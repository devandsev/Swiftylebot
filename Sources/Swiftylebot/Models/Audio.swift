//
//  Audio.swift
//  Swiftylebot
//
//  Created by Andrey Sevrikov on 10/11/2017.
//

import Foundation
import Vapor

public struct Audio: NodeInitializable {
    
    public let id: String
    public let duration: Int
    public let performer: String?
    public let title: String?
    public let mimeType: String?
    public let size: Int?
    
    public init(node: Node) throws {
        id = try node.get("file_id")
        duration = try node.get("duration")
        performer = try? node.get("performer")
        title = try? node.get("title")
        mimeType = try? node.get("mime_type")
        size = try? node.get("file_size")
    }
}
