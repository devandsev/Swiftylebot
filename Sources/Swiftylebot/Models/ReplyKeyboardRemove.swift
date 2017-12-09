//
//  ReplyKeyboardRemove.swift
//  Swiftylebot
//
//  Created by Andrey Sevrikov on 09/12/2017.
//

import Foundation
import Vapor

public struct ReplyKeyboardRemove: NodeRepresentable {
    
    public let selective: Bool?
    
    public init(selective: Bool? = nil) {

        self.selective = selective
    }
    
    public func makeNode(in context: Context?) throws -> Node {
        var node = Node(context)
        
        try node.set("remove_keyboard", true)
        
        if let selective = selective {
            try node.set("selective", selective)
        }
        
        return node
    }
}
