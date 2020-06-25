// swift-tools-version:5.0

import PackageDescription

let package = Package(
    name: "BRUtils",
    products: [
        .library(name: "BRUtils", targets: ["BRUtils"])
    ],
    dependencies: [],
    targets: [
        .target(
            name: "BRUtils",
            dependencies: []
        )
    ]
)
