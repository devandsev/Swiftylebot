//
//  Session.swift
//  Development
//
//  Created by Andrey Sevrikov on 10/11/2017.
//

import Vapor
import Foundation
import Dispatch

public class Session {
    
    // MARK: - Public properties
    
    public var errorHandler: ((TelegramError) -> Void)?
    
    // MARK: - Pivate properties
    
    private let droplet: Droplet
    private let bot: Bot
    private let token: String
    private var lastOffset: Int?
    private var updateHandlers: [UpdateHandler] = []
    
    // MARK: - Lifecycle
    
    public init(token: String) throws {
        self.token = token
        self.droplet = try Droplet()
        self.bot = try Bot(token: token)
    }
    
    public func onUpdate(handler: @escaping (Bot, Update) -> Void) -> UpdateHandler {
        return self.onUpdate(updateTypes: [], handler: handler)
    }
    
    public func onUpdate(updateTypes: [Update.ItemType], handler: @escaping (Bot, Update) -> Void) -> UpdateHandler {
        let updateHandler = UpdateHandler(allowedUpdates: updateTypes, handler: handler)
        self.updateHandlers.append(updateHandler)
        
        return updateHandler
    }
    
    public func remove(updateHandler: UpdateHandler) {
        let possibleIndex = updateHandlers.index { $0 === updateHandler }
        
        guard let index = possibleIndex else { return }
        
        updateHandlers.remove(at: index)
    }
    
    // MARK: - Serving
    
    public func startPolling(interval: TimeInterval) throws {
        try self.startPolling(for: [], interval: interval)
    }
    
    private func startPolling(for allowedUdpates: [Update.ItemType], interval: TimeInterval) throws {
        while true {
            var params: [String: NodeRepresentable] = ["offset": self.lastOffset ?? -1,
                                                       "timeout": interval]
            params["allowed_updates"] = allowedUdpates.map {$0.rawValue}
            
            guard let response = try? self.droplet.client.post("https://api.telegram.org/bot\(self.token)/getUpdates", query: params) else {
                handle(error: .localError("Couldn't get response"))
                continue
            }
            
            guard let json = response.json else {
                handle(error: .localError("Couldn't get response json"))
                continue
            }
            
            guard let schema = try? UpdatesSchema(node: json) else {
                if let error = try? APIError(node: json) {
                    handle(error: .serverError(error))
                } else {
                    handle(error: .localError("Unknown error"))
                }
                continue
            }
            
            for update in schema.updates {
                for updateHandler in updateHandlers {
                    updateHandler.process(bot: self.bot, update: update)
                }
            }
            
            if let lastUpdateId = schema.updates.last?.id {
                self.lastOffset = lastUpdateId + 1
            }
        }
    }
    
    public func startListening() throws {
        try self.startListening(for: [])
    }
    
    private func startListening(for allowedUdpates: [Update.ItemType]) throws {
        droplet.get("") { req in
            return "aha"
        }
        
        try droplet.run()
    }
    
    private func handle(error: TelegramError) {
        errorHandler?(error)
        
        // 10 sec error cooldown
        RunLoop.current.run(mode: RunLoopMode.defaultRunLoopMode, before: Date(timeIntervalSinceNow: 10))
    }
}
