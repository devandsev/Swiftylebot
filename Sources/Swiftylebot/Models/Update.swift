//
//  Update.swift
//  Swiftylebot
//
//  Created by Andrey Sevrikov on 07/11/2017.
//

import Foundation
import Vapor

public struct Update: NodeInitializable {
    
    public enum ItemType: String {
        case message = "message"
        case editedMessage = "edited_message"
        case channelPost = "channel_post"
        case editedChannelPost = "edited_channel_post"
        case inlineQuery = "inline_query"
        case chosenInlineResult = "chosen_inline_result"
        case callbackQuery = "callback_query"
        case shippingQuery = "shipping_query"
        case preCheckoutQuery = "pre_checkout_query"
    }
    
    public enum Item {
        case message(item: Message)
        case editedMessage(item: Message)
        case channelPost(item: Message)
        case editedChannelPost(item: Message)
        
        var itemType: ItemType {
            switch self {
                
            case .message(item: _):
                return .message
                
            case .editedMessage(item: _):
                return .editedMessage
                
            case .channelPost(item: _):
                return .channelPost
                
            case .editedChannelPost(item: _):
                return .editedChannelPost
            }
        }
    }
    
    public let id: Int
    public let item: Item
    
    public init(node: Node) throws {
        id = try node.get("update_id")
        
        let message: Message?
        let editedMessage: Message?
        let channelPost: Message?
        let editedChannelPost: Message?
        
        message = try node.get("message")
        editedMessage = try node.get("edited_message")
        channelPost = try node.get("channel_post")
        editedChannelPost = try node.get("edited_channel_post")
        
        if let item = message {
            self.item = .message(item: item)
        } else if let item = editedMessage {
            self.item = .editedMessage(item: item)
        } else if let item = channelPost {
            self.item = .channelPost(item: item)
        } else if let item = editedChannelPost {
            self.item = .editedChannelPost(item: item)
        } else {
            throw NodeError.unableToConvert(input: node, expectation: "Update must have an item", path: [])
        }
    }
}
