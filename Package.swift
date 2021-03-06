// swift-tools-version:4.0
import PackageDescription

let package = Package(
    name: "hello",
    products: [
        .library(name: "hello", targets: ["App"]),
    ],
    dependencies: [
        // 💧 A server-side Swift web framework.
        .package(url: "https://github.com/vapor/vapor.git", from: "3.0.0"),
        
        /// 💻 APIs for creating interactive CLI tools.
        .package(url: "https://github.com/vapor/console.git", from: "3.0.0"),
        
        // Leaf
        .package(url: "https://github.com/vapor/leaf.git", from: "3.0.0"),

        // 🔵 Swift ORM (queries, models, relations, etc) built on PostgreSQL.
        .package(url: "https://github.com/vapor/fluent-postgresql.git", from: "1.0.0")
    ],
    targets: [
        .target(name: "App", dependencies: ["Command", "Leaf", "FluentPostgreSQL", "Vapor"]),
        .target(name: "Run", dependencies: ["App"]),
        .testTarget(name: "AppTests", dependencies: ["App"])
    ]
)

