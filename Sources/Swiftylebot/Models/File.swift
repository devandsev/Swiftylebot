//
//  File.swift
//  Swiftylebot
//
//  Created by Andrey Sevrikov on 09/12/2017.
//

import Foundation
import Vapor

public struct File: NodeInitializable {
    
    public let fileId: String
    public let fileSize: Int?
    public let filePath: String?
    
    public init(node: Node) throws {
        fileId = try node.get("file_id")
        fileSize = try? node.get("file_size")
        filePath = try? node.get("file_path")
    }
}
