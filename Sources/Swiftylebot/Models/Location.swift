//
//  Location.swift
//  Swiftylebot
//
//  Created by Andrey Sevrikov on 10/11/2017.
//

import Foundation
import Vapor

public struct Location: NodeInitializable {
    
    public let longitude: Float
    public let latitude: Float
    
    public init(node: Node) throws {
        longitude = try node.get("longitude")
        latitude = try node.get("latitude")
    }
}
