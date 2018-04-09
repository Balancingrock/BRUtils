// swift-tools-version:4.0

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
        ),
        .testTarget(
            name: "BRUtilsTests",
            dependencies: ["BRUtils"]
        )
    ]
)
