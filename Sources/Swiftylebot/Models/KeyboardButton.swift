//
//  KeyboardButton.swift
//  Swiftylebot
//
//  Created by Andrey Sevrikov on 09/12/2017.
//

import Foundation
import Vapor

public struct KeyboardButton: NodeRepresentable {
    
    public let text: String
    public let requestContact: Bool?
    public let requestLocation: Bool?
    
    public init(text: String,
         requestContact: Bool? = nil,
         requestLocation: Bool? = nil) {
        
        self.text = text
        self.requestContact = requestContact
        self.requestLocation = requestLocation
    }
    
    public func makeNode(in context: Context?) throws -> Node {
        var node = Node(context)
        
        try node.set("text", text)
        
        if let requestContact = requestContact {
            try node.set("request_contact", requestContact)
        }
        if let requestLocation = requestLocation {
            try node.set("request_location", requestLocation)
        }
        
        return node
    }
}
