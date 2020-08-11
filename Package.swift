// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "OrgchartGenerator",
    platforms: [
        .macOS("10.11")
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
        .package(url: "https://github.com/dehesa/CodableCSV.git", from: "0.6.1"),
        .package(url: "https://github.com/apple/swift-argument-parser.git", from: "0.2.2")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "OrgchartGenerator",
            dependencies: [
                .product(name: "CodableCSV", package: "CodableCSV"),
                .product(name: "ArgumentParser", package: "swift-argument-parser")
            ])
    ]
)
