import Swiftylebot
import Vapor

let b = try! Bot(token: "YOUR_TOKEN")
b.onUpdate = { json in
    print(json)
}
try! b.startPolling(with: 2.0)
