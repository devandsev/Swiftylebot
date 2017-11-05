// swift-tools-version:4.0

import PackageDescription

let package = Package(
    name: "Swiftylebot",
    products: [
        .library(
            name: "Swiftylebot",
            targets: ["Swiftylebot"]),
        ],
    dependencies: [
        .package(url: "https://github.com/vapor/vapor.git", .upToNextMajor(from: "2.1.0")),
    ],
    targets: [
        .target(name: "Swiftylebot", dependencies: ["Vapor"]),
        .target(name: "Development", dependencies: ["Swiftylebot"])
    ]
)
