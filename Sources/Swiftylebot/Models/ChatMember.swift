//
//  ChatMember.swift
//  Swiftylebot
//
//  Created by Andrey Sevrikov on 17/12/2017.
//

import Foundation
import Vapor

public struct ChatMember: NodeInitializable {
    
    public enum Status: String {
        case creator = "creator"
        case administrator = "administrator"
        case member = "member"
        case restricted = "restricted"
        case left = "left"
        case kicked = "kicked"
    }
    
    public enum Permission: String {
        case canBeEdited = "can_be_edited"
        case canChangeInfo = "can_change_info"
        case canPostMessages = "can_post_messages"
        case canEditMessages = "can_edit_messages"
        case canDeleteMessages = "can_delete_messages"
        case canInviteUsers = "can_invite_users"
        case canRestrictMembers = "can_restrict_members"
        case canPinMessages = "can_pin_messages"
        case canPromoteMembers = "can_promote_members"
        case canSendMessages = "can_send_messages"
        case canSendMediaMessages = "can_send_media_messages"
        case canSendOtherMessages = "can_send_other_messages"
        case canAddWebPagePreviews = "can_add_web_page_previews"
        
        static let values = [canBeEdited,
                             canChangeInfo,
                             canPostMessages,
                             canEditMessages,
                             canDeleteMessages,
                             canInviteUsers,
                             canRestrictMembers,
                             canPinMessages,
                             canPromoteMembers,
                             canSendMessages,
                             canSendMediaMessages,
                             canSendOtherMessages,
                             canAddWebPagePreviews]
    }
    
    public let user: User
    public let status: Status
    public let permissions: [Permission]
    
    public init(node: Node) throws {
        user = try node.get("user")
        status = try node.get("status")
        
        permissions = Permission.values.flatMap { try? node.get($0.rawValue) as Permission }
    }
}
