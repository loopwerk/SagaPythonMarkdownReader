// swift-tools-version:5.2

import PackageDescription

let package = Package(
  name: "SagaPythonMarkdownReader",
  products: [
    .library(
      name: "SagaPythonMarkdownReader",
      targets: ["SagaPythonMarkdownReader"]),
  ],
  dependencies: [
    .package(name: "Saga", url: "https://github.com/loopwerk/Saga.git", from: "0.12.0"),
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
