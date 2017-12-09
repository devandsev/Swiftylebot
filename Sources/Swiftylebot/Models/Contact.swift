//
//  Contact.swift
//  Swiftylebot
//
//  Created by Andrey Sevrikov on 10/11/2017.
//

import Foundation
import Vapor

public struct Contact: NodeInitializable {
    
    public let phoneNumber: String
    public let firstName: String
    public let lastName: String?
    public let userId: Int?
    
    public init(node: Node) throws {
        phoneNumber = try node.get("phone_number")
        firstName = try node.get("first_name")
        lastName = try? node.get("last_name")
        userId = try? node.get("user_id")
    }
}
