//
//  ForceReply.swift
//  Swiftylebot
//
//  Created by Andrey Sevrikov on 16/12/2017.
//

import Foundation
import Vapor

public struct ForceReply: NodeRepresentable {
    
    public let selective: Bool?
    
    public init(selective: Bool? = nil) {
        self.selective = selective
    }
    
    public func makeNode(in context: Context?) throws -> Node {
        var node = Node(context)
        
        try node.set("force_reply", true)
        
        try node.setIfNotNil("selective", selective)
        
        return node
    }
}
