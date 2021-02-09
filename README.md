# SagaPythonMarkdownReader

A Markdown reader for [Saga](https://github.com/loopwerk/Saga), which uses [Python-Markdown](https://github.com/Python-Markdown/markdown). Code syntax highlighting is done via Pygments, if installed.

## Usage
Include `SagaPythonMarkdownReader` in your Package.swift as usual:

``` swift
let package = Package(
  name: "MyWebsite",
  dependencies: [
    .package(name: "Saga", url: "https://github.com/loopwerk/Saga.git", from: "0.12.0"),
    .package(name: "SagaPythonMarkdownReader", url: "https://github.com/loopwerk/SagaPythonMarkdownReader", from: "0.1.0"),
  ],
  targets: [
    .target(
      name: "MyWebsite",
      dependencies: ["Saga", "SagaPythonMarkdownReader"]),
  ]
)
```

And then in your website you can `import SagaPythonMarkdownReader` and use `pythonMarkdownReader` as you would do the default `markdownReader`.
