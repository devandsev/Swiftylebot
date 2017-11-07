import Swiftylebot
import Vapor

let b = try! Bot(token: "YOUR_TOKEN")
b.onUpdate = { update in
    print(update.id)
}
try! b.startPolling(with: 2.0)
