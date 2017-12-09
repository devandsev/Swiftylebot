//
//  Venue.swift
//  Swiftylebot
//
//  Created by Andrey Sevrikov on 10/11/2017.
//

import Foundation
import Vapor

public struct Venue: NodeInitializable {
    
    public let location: Location
    public let title: String
    public let address: String
    public let foursquareId: String?
    
    public init(node: Node) throws {
        location = try node.get("location")
        title = try node.get("title")
        address = try node.get("address")
        foursquareId = try? node.get("foursquare_id")
    }
}
