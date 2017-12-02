//
//  Chat.swift
//  Swiftylebot
//
//  Created by Andrey Sevrikov on 09/11/2017.
//

import Foundation
import Vapor

public struct Chat: NodeInitializable {
    
    public enum ChatType: String, NodeInitializable {
        case `private` = "private"
        case group = "group"
        case supergroup = "supergroup"
        case channel = "channel"

        public init(node: Node) throws {
            guard let string = node.string,
            let chatType = ChatType(rawValue: string) else {
                throw NodeError.unableToConvert(input: node, expectation: "String", path: [])
            }
            
            self = chatType
        }
    }

    public let id: Int
    public let type: ChatType
    public let title: String?
    public let username: String?
    public let firstName: String?
    public let lastName: String?
    public let isAllMembersAreAdmins: Bool?
    public let photo: ChatPhoto?
    public let description: String?
    public let inviteLink: String?
    public let pinnedMessage: Message?
    public let stickerSetName: String?
    public let canSetStickerSet: Bool?
    
    public init(node: Node) throws {
        id = try node.get("id")
        type = try node.get("type")
        title = try? node.get("title")
        username = try? node.get("username")
        firstName = try? node.get("first_name")
        lastName = try? node.get("last_name")
        isAllMembersAreAdmins = try? node.get("all_members_are_administrators")
        photo = try? node.get("photo")
        description = try? node.get("description")
        inviteLink = try? node.get("invite_link")
        pinnedMessage = try? node.get("pinned_message")
        stickerSetName = try? node.get("sticker_set_name")
        canSetStickerSet = try? node.get("can_set_sticker_set")
    }
}
