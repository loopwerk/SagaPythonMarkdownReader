import Foundation
import Saga
import SwiftMarkdown

let config = [
  "codehilite": [
    "css_class": "highlight"
  ]
]

let parser = try! SwiftMarkdown(
  extensions: [.nl2br, .fencedCode, .codehilite, .strikethrough, .title, .meta, .saneLists, .urlize],
  extensionConfig: config
)

public extension Reader {
  static var pythonMarkdownReader: Self {
    Reader(supportedExtensions: ["md", "markdown"], convert: { absoluteSource in
      let contents: String = try absoluteSource.read()
      let document = parser.markdown(contents)
      return (document.title, document.html, document.metadata)
    })
  }
}
