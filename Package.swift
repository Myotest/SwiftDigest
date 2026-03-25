// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftDigest",
    products: [
        .library(
            name: "SwiftDigest",
            targets: ["SwiftDigest"]),
    ],
    targets: [
        .target(
            name: "SwiftDigest",
            dependencies: []),
        .testTarget(
            name: "SwiftDigestTests",
            dependencies: ["SwiftDigest"]),
    ]
)
