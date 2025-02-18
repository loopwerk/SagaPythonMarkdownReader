// swift-tools-version:5.5

import PackageDescription

let package = Package(
  name: "SagaPythonMarkdownReader",
  platforms: [
    .macOS(.v12)
  ],
  products: [
    .library(
      name: "SagaPythonMarkdownReader",
      targets: ["SagaPythonMarkdownReader"]),
  ],
  dependencies: [
    .package(name: "Saga", url: "https://github.com/loopwerk/Saga.git", from: "2.0.0"),
    .package(name: "SwiftMarkdown", url: "https://github.com/loopwerk/SwiftMarkdown", from: "0.4.0"),
  ],
  targets: [
    .target(
      name: "SagaPythonMarkdownReader",
      dependencies: [
        "Saga",
        "SwiftMarkdown",
      ]),
    .testTarget(
      name: "SagaPythonMarkdownReaderTests",
      dependencies: ["SagaPythonMarkdownReader"]),
  ]
)
