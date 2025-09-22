// swift-tools-version: 6.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "FirstSwiftPackage",
    platforms: [
        .iOS(.v15),       // 最低支持 iOS 15
        .macOS(.v12),     // 最低支持 macOS 12
        .tvOS(.v15),
        .watchOS(.v8)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "FirstSwiftPackage",
            targets: ["FirstSwiftPackage"]),
    ],
    dependencies: [
        // 添加依赖包
        .package(url: "https://github.com/Alamofire/Alamofire.git", from: "5.6.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "FirstSwiftPackage",
            dependencies: [
                .product(name: "Alamofire", package: "Alamofire"),
            ],
        ),
        .testTarget(
            name: "FirstSwiftPackageTests",
            dependencies: ["FirstSwiftPackage"]
        ),
    ]
)
