//
//  APIError.swift
//  Swiftylebot
//
//  Created by Andrey Sevrikov on 02/12/2017.
//

import Foundation
import Vapor

public struct APIError: NodeInitializable, Error {
    
    public let code: Int
    public let description: String
    public let ok: Bool
    
    public init(node: Node) throws {
        code = try node.get("error_code")
        description = try node.get("description")
        ok = try node.get("ok")
    }
    
    public init(code: Int, description: String) {
        self.code = code
        self.description = description
        self.ok = false
    }
}
