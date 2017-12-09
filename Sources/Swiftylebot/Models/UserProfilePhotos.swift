//
//  UserProfilePhotos.swift
//  Swiftylebot
//
//  Created by Andrey Sevrikov on 09/12/2017.
//

import Foundation
import Vapor

public struct UserProfilePhotos: NodeInitializable {
    
    public let totalCount: Int
    public let photos: [[PhotoSize]]
    
    public init(node: Node) throws {
        totalCount = try node.get("total_count")
        photos = try node.get("photos")
    }
}
