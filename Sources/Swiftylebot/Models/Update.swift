//
//  Update.swift
//  Swiftylebot
//
//  Created by Andrey Sevrikov on 07/11/2017.
//

import Vapor
import Foundation

public struct Update: NodeInitializable {
    
    public let id: Int
    
    public init(node: Node) throws {
        id = try node.get("update_id")
    }
}
