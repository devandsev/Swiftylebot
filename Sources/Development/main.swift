import Swiftylebot
import Vapor

let session = try! Swiftylebot.Session(token: "YOUR_TOKEN")

let updateHandler = session.onUpdate() { bot, update in
    
    switch update.item {
    case .message(let message):
        print("received message: \(message.text)")
    case .editedMessage(let message):
        print("received edited message: \(message.text)")
    case .channelPost(let message):
        print("received channel post: \(message.text)")
    case .editedChannelPost(let message):
        print("received edited channel post: \(message.text)")
    }
}

//let updateHandler = session.onUpdate(updateTypes: [.message]) { bot, update in
//    print(update)
//}

try! session.startPolling(interval: 2.0)

//session.remove(updateHandler: updateHandler)
