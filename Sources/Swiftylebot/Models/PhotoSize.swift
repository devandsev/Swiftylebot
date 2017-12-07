//
//  PhotoSize.swift
//  Swiftylebot
//
//  Created by Andrey Sevrikov on 10/11/2017.
//

import Foundation
import Vapor

public struct PhotoSize: NodeInitializable {
    
    public let id: String
    public let width: Int
    public let height: Int
    public let size: Int?
    
    public init(node: Node) throws {
        id = try node.get("file_id")
        width = try node.get("width")
        height = try node.get("height")
        size = try? node.get("file_size")
    }
}
