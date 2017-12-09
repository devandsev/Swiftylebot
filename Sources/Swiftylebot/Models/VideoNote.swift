//
//  VideoNote.swift
//  Swiftylebot
//
//  Created by Andrey Sevrikov on 10/11/2017.
//

import Foundation
import Vapor

public struct VideoNote: NodeInitializable {
    
    public let id: String
    public let length: Int
    public let duration: Int
    public let thumb: PhotoSize?
    public let size: Int?
    
    public init(node: Node) throws {
        id = try node.get("file_id")
        length = try node.get("length")
        duration = try node.get("duration")
        thumb = try? node.get("thumb")
        size = try? node.get("file_size")
    }
}
