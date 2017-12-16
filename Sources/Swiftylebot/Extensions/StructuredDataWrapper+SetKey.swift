//
//  StructuredDataWrapper+SetKey.swift
//  Swiftylebot
//
//  Created by Andrey Sevrikov on 16/12/2017.
//

import Foundation
import Vapor

extension StructuredDataWrapper {
    
    public mutating func setIfNotNil(_ path: String, _ any: Any?) throws {
        guard let any = any else {
            return
        }
        
        try self.set(path, any)
    }
}
