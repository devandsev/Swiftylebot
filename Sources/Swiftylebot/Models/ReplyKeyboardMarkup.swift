//
//  ReplyKeyboardMarkup.swift
//  Swiftylebot
//
//  Created by Andrey Sevrikov on 09/12/2017.
//

import Foundation
import Vapor

public struct ReplyKeyboardMarkup: NodeRepresentable {
    
    public let keyboard: [[KeyboardButton]]
    public let resizeKeyboard: Bool?
    public let oneTimeKeyboard: Bool?
    public let selective: Bool?

    public init(keyboard: [[KeyboardButton]],
         resizeKeyboard: Bool? = nil,
         oneTimeKeyboard: Bool? = nil,
         selective: Bool? = nil) {
        
        self.keyboard = keyboard
        self.resizeKeyboard = resizeKeyboard
        self.oneTimeKeyboard = oneTimeKeyboard
        self.selective = selective
    }
    
    public func makeNode(in context: Context?) throws -> Node {
        var node = Node(context)
        
        try node.set("keyboard", keyboard)
        
        try node.setIfNotNil("resizeKeyboard", resizeKeyboard)
        try node.setIfNotNil("oneTimeKeyboard", oneTimeKeyboard)
        try node.setIfNotNil("selective", selective)
        
        return node
    }
}
