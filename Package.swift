// swift-tools-version:5.0

import PackageDescription

let package = Package(
    name: "BRUtils",
    platforms: [.macOS(.v10_10), .iOS(.v8)],
    products: [
        .library(name: "BRUtils", targets: ["BRUtils"])
    ],
    dependencies: [],
    targets: [
        .target(
            name: "BRUtils",
            dependencies: []
        )
    ],
    swiftLanguageVersions: [.v4, .v4_2, .v5]
)
