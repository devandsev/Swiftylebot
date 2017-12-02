//
//  User.swift
//  Swiftylebot
//
//  Created by Andrey Sevrikov on 09/11/2017.
//

import Foundation
import Vapor

public struct User: NodeInitializable {
    
    public let id: Int
    public let isBot: Bool
    public let firstName: String
    public let lastName: String?
    public let username: String?
    public let languageCode: String?
    
    public init(node: Node) throws {
        id = try node.get("id")
        isBot = try node.get("is_bot")
        firstName = try node.get("first_name")
        lastName = try? node.get("last_name")
        username = try? node.get("username")
        languageCode = try? node.get("language_code")
    }
}
