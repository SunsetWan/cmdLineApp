// swift-tools-version:5.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription



let package = Package(
    name: "cmdLineApp",
    products: [
        .executable(name: "cmdLineApp", targets: ["cmdLineApp"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
        .package(url: "https://github.com/kylef/Commander", from: "0.9.0"),
        .package(url: "https://github.com/SwiftyJSON/SwiftyJSON", from: "5.0.0"),
//        .package(url: "https://github.com/mtynior/ColorizeSwift.git", from: ""),
        .package(url: "https://github.com/luoxiu/Crayon", .upToNextMajor(from: "0.0.1")),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "cmdLineApp",
            dependencies: ["Commander","SwiftyJSON","Crayon"]),
        .testTarget(
            name: "cmdLineAppTests",
            dependencies: ["cmdLineApp"]),
    ]
)
