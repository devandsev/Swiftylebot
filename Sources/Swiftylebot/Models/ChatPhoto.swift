//
//  ChatPhoto.swift
//  Swiftylebot
//
//  Created by Andrey Sevrikov on 03/12/2017.
//

import Foundation
import Vapor

public struct ChatPhoto: NodeInitializable {
    
    public let smallFileId: String
    public let bigFileId: String
    
    public init(node: Node) throws {
        smallFileId = try node.get("small_file_id")
        bigFileId = try node.get("big_file_id")
    }
}
