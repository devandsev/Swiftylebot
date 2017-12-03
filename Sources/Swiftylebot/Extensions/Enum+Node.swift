//
//  Enum.swift
//  Swiftylebot
//
//  Created by Andrey Sevrikov on 03/12/2017.
//

import Foundation
import Vapor

public extension RawRepresentable where RawValue == String {
    
    public init(node: Node) throws {
        guard let string = node.string,
            let enumValue = Self(rawValue: string) else {
                throw NodeError.unableToConvert(input: node, expectation: "String", path: [])
        }
        
        self = enumValue
    }
}
