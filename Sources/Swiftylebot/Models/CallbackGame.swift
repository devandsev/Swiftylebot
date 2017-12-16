//
//  CallbackGame.swift
//  Swiftylebot
//
//  Created by Andrey Sevrikov on 16/12/2017.
//

import Foundation
import Vapor

public struct CallbackGame: NodeRepresentable {
    
    public func makeNode(in context: Context?) throws -> Node {
        let node = Node(context)
        
        return node
    }
}
