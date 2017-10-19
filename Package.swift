// swift-tools-version:4.0
import PackageDescription

let package = Package(
    name: "MarkdownGenerator",
    products: [
        .library(name: "MarkdownGenerator", targets: ["MarkdownGenerator"])
    ],
    dependencies: [],
    targets: [
        .target(name: "MarkdownGenerator", dependencies: []),
        .testTarget(name: "MarkdownGeneratorTests", dependencies: ["MarkdownGenerator"])
    ]
)
