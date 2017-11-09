//
//  Update.swift
//  Swiftylebot
//
//  Created by Andrey Sevrikov on 07/11/2017.
//

import Foundation
import Vapor

public struct Update: NodeInitializable {
    
    public let id: Int
    public let message: Message?
    public let editedMessage: Message?
    public let channelPost: Message?
    public let editedChannelPost: Message?
    
    public init(node: Node) throws {
        id = try node.get("update_id")
        message = try node.get("message")
        editedMessage = try node.get("edited_message")
        channelPost = try node.get("channel_post")
        editedChannelPost = try node.get("edited_channel_post")
    }
}
