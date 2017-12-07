//
//  Document.swift
//  Swiftylebot
//
//  Created by Andrey Sevrikov on 10/11/2017.
//

import Foundation
import Vapor

public struct Document: NodeInitializable {
    
    public let id: String
    public let thumb: PhotoSize?
    public let name: String?
    public let mimeType: String?
    public let size: Int?
    
    public init(node: Node) throws {
        id = try node.get("file_id")
        thumb = try? node.get("thumb")
        name = try? node.get("file_name")
        mimeType = try? node.get("mime_type")
        size = try? node.get("file_size")
    }
}
