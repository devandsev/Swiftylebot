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
    
    // MARK: - Pivate properties
    
    private var token: String
    
    // MARK: - Lifecycle
    
    public init(token: String) throws {
        self.token = token
    }
}
