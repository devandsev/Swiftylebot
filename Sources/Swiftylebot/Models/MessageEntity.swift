//
//  MessageEntity.swift
//  Swiftylebot
//
//  Created by Andrey Sevrikov on 09/11/2017.
//

import Foundation
import Vapor

public struct MessageEntity: NodeInitializable {
    
    public enum MessageEntityType: String, NodeInitializable {
        case mention = "mention"
        case hashtag = "hashtag"
        case botCommand = "bot_command"
        case url = "url"
        case email = "email"
        case bold = "bold"
        case italic = "italic"
        case code = "code"
        case pre = "pre"
        case textLink = "text_link"
        case textMention = "text_mention"
    }
    
    let type: MessageEntityType
    let offset: Int
    let length: Int
    let url: String?
    let user: User?
    
    public init(node: Node) throws {
        type = try node.get("type")
        offset = try node.get("offset")
        length = try node.get("length")
        url = try? node.get("url")
        user = try? node.get("user")
    }
}
