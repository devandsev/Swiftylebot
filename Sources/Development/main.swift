import Swiftylebot

let b = try! Bot(token: "test")
b.onUpdate = {
    print("update received")
}
try! b.startListening()
