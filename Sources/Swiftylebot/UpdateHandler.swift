//
//  UpdateHandler.swift
//  Development
//
//  Created by Andrey Sevrikov on 10/11/2017.
//

import Vapor
import Foundation

public class UpdateHandler {
    
    let allowedUpdates: [Update.ItemType]
    let handler: (Bot, Update) -> Void
    
    init(allowedUpdates: [Update.ItemType], handler: @escaping (Bot, Update) -> Void) {
        self.allowedUpdates = allowedUpdates
        self.handler = handler
    }
    
    func process(bot: Bot, update: Update) {
        guard !allowedUpdates.isEmpty else {
            handler(bot, update)
            return
        }
        
        if allowedUpdates.contains(update.item.itemType) {
            handler(bot, update)
        }
    }
}
