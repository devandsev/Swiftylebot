//
//  Voice.swift
//  Swiftylebot
//
//  Created by Andrey Sevrikov on 10/11/2017.
//

import Foundation
import Vapor

public struct Voice: NodeInitializable {
    
    public let id: String
    public let duration: Int
    public let mimeType: String?
    public let size: Int?
    
    public init(node: Node) throws {
        id = try node.get("file_id")
        duration = try node.get("duration")
        mimeType = try? node.get("mime_type")
        size = try? node.get("file_size")
    }
}
