//
//  Bot.swift
//  Swiftylebot
//
//  Created by Andrey Sevrikov on 05/11/2017.
//

import Vapor
import Foundation
import Dispatch

public class Bot {
    
    // MARK: - Public properties
    
    public var onUpdate: ((Update) -> Void)?
    
    // MARK: - Pivate properties
    
    private let droplet: Droplet
    private var token: String
    private var lastOffset: Int?
    
    // MARK: - Serving
    
    public init(token: String) throws {
        self.token = token
        self.droplet = try Droplet()
    }
    
    public func startPolling(with interval: TimeInterval) throws {
        
        while true {
            let params: [String: NodeRepresentable] = ["offset": self.lastOffset ?? -1]
            let response = try self.droplet.client.get("https://api.telegram.org/bot\(self.token)/getUpdates", query: params)
            
            guard let json = response.json else {
                continue
            }
            
            let schema = try UpdatesSchema(node: json)
            
            for update in schema.updates {
                onUpdate?(update)
            }
            
            if let lastUpdateId = schema.updates.last?.id {
                self.lastOffset = lastUpdateId + 1
            }
            
            RunLoop.current.run(mode: RunLoopMode.defaultRunLoopMode, before: Date(timeIntervalSinceNow: interval))
        }
    }
    
    public func startListening() throws {
        
        droplet.get("") { req in
            return "aha"
        }
        
        try droplet.run()
    }
}
