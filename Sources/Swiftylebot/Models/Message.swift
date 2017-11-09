//
//  Message.swift
//  SwiftylebotPackageDescription
//
//  Created by Andrey Sevrikov on 09/11/2017.
//

import Foundation
import Vapor

public class Message: NodeInitializable {

    public let id: Int
    public let from: User?
    public let date: Date
    public let chat: Chat
    public let forwardFrom: User?
    public let forwardFromChat: Chat?
    public let forwardFromMessageId: Int?
    public let forwardSignature: String?
    public let forwardDate: Date?
    public let replyToMessage: Message?
    public let editDate: Date?
    public let authorSignature: String?
    public let text: String?
    public let entities: [MessageEntity]?
    public let captionEntities: [MessageEntity]?
    public let audio: Audio?
    public let document: Document?
    public let game: Game?
    public let photo: [PhotoSize]?
    public let sticker: Sticker?
    public let video: Video?
    public let voice: Voice?
    public let videoNote: VideoNote?
    public let caption: String?
    public let contact: Contact?
    public let location: Location?
    public let venue: Venue?
    public let newChatMembers: [User]?
    public let leftChatMember: User?
    public let newChatTitle: String?
    public let newChatPhoto: [PhotoSize]?
    public let deleteChatPhoto: Bool?
    public let groupChatCreated: Bool?
    public let supergroupChatCreated: Bool?
    public let channelChatCreated: Bool?
    public let migrateToChatId: Int?
    public let migrateFromChatId: Int?
    public let pinnedMessage: Message?
    public let invoice: Invoice?
    public let successfulPayment: SuccessfulPayment?
    
    public required init(node: Node) throws {
        id = try node.get("message_id")
        from = try node.get("from")
        date = try Date(node: try node.get("date"))
        chat = try node.get("chat")
        forwardFrom = try node.get("forward_from")
        forwardFromChat = try node.get("forward_from_chat")
        forwardFromMessageId = try node.get("forward_from_message_id")
        forwardSignature = try node.get("forward_signature")
        
        let existingForwardDate: Date? = try node.get("forward_date")
        if let date = existingForwardDate {
            forwardDate = try Date(node: date)
        } else {
            forwardDate = nil
        }
//        forwardDate = try Date(node: try node.get("forward_date"))
        
        replyToMessage = try node.get("reply_to_message")
        
        let existingEditDate: Date? = try node.get("edit_date")
        if let date = existingEditDate {
            editDate = try Date(node: date)
        } else {
            editDate = nil
        }
//        editDate = try Date(node: try node.get("edit_date"))
        
        authorSignature = try node.get("author_signature")
        text = try node.get("text")
        entities = try node.get("entities")
        captionEntities = try node.get("caption_entities")
        audio = try node.get("audio")
        document = try node.get("document")
        game = try node.get("game")
        photo = try node.get("photo")
        sticker = try node.get("sticker")
        video = try node.get("video")
        voice = try node.get("voice")
        videoNote = try node.get("video_note")
        caption = try node.get("caption")
        contact = try node.get("contact")
        location = try node.get("location")
        venue = try node.get("venue")
        newChatMembers = try node.get("new_chat_members")
        leftChatMember = try node.get("left_chat_member")
        newChatTitle =  try node.get("new_chat_title")
        newChatPhoto = try node.get("new_chat_photo")
        deleteChatPhoto = try node.get("delete_chat_photo")
        groupChatCreated = try node.get("group_chat_created")
        supergroupChatCreated = try node.get("supergroup_chat_created")
        channelChatCreated = try node.get("channel_chat_created")
        migrateToChatId = try node.get("migrate_to_chat_id")
        migrateFromChatId = try node.get("migrate_from_chat_id")
        pinnedMessage = try node.get("pinned_message")
        invoice = try node.get("invoice")
        successfulPayment = try node.get("successful_payment")
    }
}
