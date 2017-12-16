//
//  CallbackQuery.swift
//  Swiftylebot
//
//  Created by Andrey Sevrikov on 16/12/2017.
//

import Foundation
import Vapor

public struct CallbackQuery: NodeInitializable {
    
    public let id: String
    public let from: String
    public let message: String?
    public let inlineMessageId: String?
    public let chatInstance: String?
    public let data: String?
    public let gameShortName: String?
    
    public init(node: Node) throws {
        id = try node.get("id")
        from = try node.get("from")
        message = try? node.get("message")
        inlineMessageId = try? node.get("inline_message_id")
        chatInstance = try? node.get("chat_instance")
        data = try? node.get("data")
        gameShortName = try? node.get("game_short_name")
    }
}

