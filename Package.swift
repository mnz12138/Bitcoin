// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "BitcoinKit",
    products: [
        .library(
            name: "BitcoinKit",
            targets: ["BitcoinKit"]),
    ],
    dependencies: [
        .package(url: "https://github.com/vapor-community/copenssl.git", exact: Version("1.0.0-rc.1")),
        .package(url: "https://github.com/Boilertalk/secp256k1.swift", .upToNextMinor(from: .init("0.1.0")!)),
        .package(url: "https://github.com/vapor-community/random.git", .upToNextMinor(from: .init("1.2.0")!))
    ],
    targets: [
        .target(
            name: "BitcoinKit",
            dependencies: [
                "BitcoinKitPrivate",
                .product(name: "secp256k1", package: "secp256k1.swift"),
                .product(name: "Random", package: "random")
            ]
        ),
        .target(
            name: "BitcoinKitPrivate",
            dependencies: [
                .product(name: "COpenSSL", package: "copenssl"),
                .product(name: "secp256k1", package: "secp256k1.swift")
            ]
        ),
        .testTarget(
            name: "BitcoinKitTests",
            dependencies: ["BitcoinKit"])
    ],
    swiftLanguageVersions: [.v5]
)
