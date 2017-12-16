//
//  InlineKeyboardMarkup.swift
//  Swiftylebot
//
//  Created by Andrey Sevrikov on 16/12/2017.
//

import Foundation
import Vapor

public struct InlineKeyboardMarkup: NodeRepresentable {
    
    public let inlineKeyboard: [[InlineKeyboardButton]]
    
    public func makeNode(in context: Context?) throws -> Node {
        var node = Node(context)
        
        try node.set("inline_keyboard", self.inlineKeyboard)

        return node
    }
}
