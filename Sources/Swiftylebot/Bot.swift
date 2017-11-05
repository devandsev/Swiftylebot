//
//  Bot.swift
//  Swiftylebot
//
//  Created by Andrey Sevrikov on 05/11/2017.
//

import Vapor

public class Bot {
    
    private let droplet: Droplet
    
    public var onUpdate: (() -> Void)?
    
    public init(token: String) throws {
        
        self.droplet = try Droplet()
    }
    
    public func startPolling() throws {
    }
    
    public func startListening() throws {
        
        droplet.get("") { req in
            self.onUpdate?()
            return "aha"
        }
        
        try droplet.run()
    }
}
