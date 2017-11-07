//
//  UpdatesSchema.swift
//  Swiftylebot
//
//  Created by Andrey Sevrikov on 07/11/2017.
//

import Vapor
import Foundation

struct UpdatesSchema: NodeInitializable {
    
    let ok: Bool
    let updates: [Update]
    
    init(node: Node) throws {
        ok = try node.get("ok")
        updates = try node.get("result")
    }
}
