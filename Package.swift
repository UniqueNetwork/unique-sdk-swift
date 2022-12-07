// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription



let package = Package(
    name: "UniqueSDK",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "UniqueSDK",
            targets: ["UniqueSDK"])
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(url: "https://github.com/tesseract-one/Sr25519.swift.git", .upToNextMajor(from: "0.1.0")),
        .package(url: "https://github.com/tesseract-one/Bip39.swift.git", .upToNextMajor(from: "0.1.0")),
        .package(url: "https://github.com/kishikawakatsumi/KeychainAccess.git", .upToNextMajor(from: "4.2.2"))
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "UniqueSDK",
            dependencies: [.product(name: "Sr25519", package: "Sr25519.swift"), .product(name: "Bip39", package: "Bip39.swift"), "KeychainAccess"],
            path: "UniqueSDK"),
    ]
)
