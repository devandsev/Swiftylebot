//
//  InlineKeyboardButton.swift
//  Swiftylebot
//
//  Created by Andrey Sevrikov on 16/12/2017.
//

import Foundation
import Vapor

public struct InlineKeyboardButton: NodeRepresentable {
    
    public let text: String
    public let url: String
    public let callbackData: String?
    public let switchInlineQuery: String?
    public let switchInlineQueryCurrentChat: String?
    public let callbackGame: CallbackGame?
    public let pay: Bool?
    
    public func makeNode(in context: Context?) throws -> Node {
        var node = Node(context)
        
        try node.set("text", self.text)
        try node.setIfNotNil("url", self.url)
        try node.setIfNotNil("callback_data", self.callbackData)
        try node.setIfNotNil("switch_inline_query", self.switchInlineQuery)
        try node.setIfNotNil("switch_inline_query_current_chat", self.switchInlineQueryCurrentChat)
        try node.setIfNotNil("callback_game", self.callbackGame)
        try node.setIfNotNil("pay", self.pay)
        
        return node
    }
}
