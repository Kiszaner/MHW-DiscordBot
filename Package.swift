// swift-tools-version:5.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MHW-Discord",
    products: [
        .executable(name: "MHW-Discord", targets: ["MHW-Discord"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
        .package(url: "../MHWBotCore", .branch("master")),
        .package(url: "https://github.com/Azoy/Sword", .branch("master"))
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "MHW-Discord",
            dependencies: ["MHWBotCore", "Sword"]),
        .testTarget(
            name: "MHW-DiscordTests",
            dependencies: ["MHW-Discord"]),
    ]
)
