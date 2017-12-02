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

session.errorHandler = { error in
    switch error {
        
    case .localError(let description):
        print("Got local error: \(description)")
        
    case .serverError(let apiError):
        print("Got server error with code \(apiError.code): \(apiError.description)")
    }
}

do {
    try session.startPolling(interval: 30.0)
} catch let error {
    print("Got an error: \(error)")
}

//session.remove(updateHandler: updateHandler)
