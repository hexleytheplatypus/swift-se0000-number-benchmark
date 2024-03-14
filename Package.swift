// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "benchmark",
    platforms: [
        .macOS(.v14),
        .iOS(.v17),
        .tvOS(.v17),
        .watchOS(.v10),
    ],
    dependencies: [
        .package(url: "https://github.com/hexleytheplatypus/swift-se0000-number.git", from: "1.0.1"),
        .package(url: "https://github.com/apple/swift-collections-benchmark", from: "0.0.3"),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .executableTarget(
            name: "benchmark",
            dependencies: [
                .product(name: "CollectionsBenchmark", package: "swift-collections-benchmark"),
                .product(name: "SE0000_Number", package: "swift-se0000-number"),
            ]
        ),
    ]
)
