//
//  Video.swift
//  Swiftylebot
//
//  Created by Andrey Sevrikov on 10/11/2017.
//

import Foundation
import Vapor

public struct Video: NodeInitializable {
    
    public let id: String
    public let width: Int
    public let height: Int
    public let duration: Int
    public let thumb: PhotoSize?
    public let mimeType: String?
    public let size: Int?
    
    public init(node: Node) throws {
        id = try node.get("file_id")
        width = try node.get("width")
        height = try node.get("height")
        duration = try node.get("duration")
        thumb = try? node.get("thumb")
        mimeType = try? node.get("mime_type")
        size = try? node.get("file_size")
    }
}
