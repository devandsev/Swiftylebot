//
//  UpdatesSchema.swift
//  Swiftylebot
//
//  Created by Andrey Sevrikov on 07/11/2017.
//

import Foundation
import Vapor

struct UpdatesSchema: NodeInitializable {
    
    enum ResponseParameter: Int {
        case migrateToChatId
        case retryAfter
    }
    
    let ok: Bool
    let updates: [Update]
    
    let description: String?
    let errorCode: String?
    let parameters: [ResponseParameter]
    
    var lastUpdateId: Int?
    
    init(node: Node) throws {
        ok = try node.get("ok")
        
        guard ok else {
            self.updates = []
            description = try? node.get("description")
            errorCode = try? node.get("error_code")
            
            var parameters: [ResponseParameter] = []
            
            if let migrateToChatId: ResponseParameter = try? node.get("migrate_to_chat_id") {
                parameters.append(migrateToChatId)
            }
            
            if let retryAfter: ResponseParameter = try? node.get("retry_after") {
                parameters.append(retryAfter)
            }
            
            self.parameters = parameters
            
            return
        }
        
        var updates: [Update] = []
        
        let updateNodes: [Node] = try node.get("result")
        
        // Skip updates that we can't map. Keep track of the last update_id, though.
        for updateNode in updateNodes {
            do {
                let update: Update = try updateNode.converted()
                updates.append(update)
                lastUpdateId = update.id
            } catch let error as NodeError {
                if let updateId: Int = try? updateNode.get("update_id") {
                    self.lastUpdateId = updateId
                }
                // TODO: add logger
                print("Couldn't map Update: \(error.reason)")
            } catch {
                if let updateId: Int = try? updateNode.get("update_id") {
                    self.lastUpdateId = updateId
                }
                print("Couldn't map Update: \(error.localizedDescription) \n \(updateNode.wrapped)")
            }
        }
        
        self.updates = updates
    }
}
