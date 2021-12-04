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
  static func pythonMarkdownReader(itemProcessor: ((Item<M>) async -> Void)? = nil) -> Self {
    Reader(supportedExtensions: ["md", "markdown"], convert: { absoluteSource, relativeSource, relativeDestination in
      let contents: String = try absoluteSource.read()
      
      // First we parse the markdown file
      let markdown = parser.markdown(contents)

      // Then we try to decode the embedded metadata within the markdown (which otherwise is just a [String: String] dict)
      let decoder = makeMetadataDecoder(for: markdown.metadata)
      let date = try resolvePublishingDate(from: absoluteSource, decoder: decoder)
      let metadata = try M.init(from: decoder)

      // Create the Page
      let item = Item(
        relativeSource: relativeSource,
        relativeDestination: relativeDestination,
        title: markdown.title ?? absoluteSource.lastComponentWithoutExtension,
        rawContent: contents,
        body: markdown.html,
        date: date,
        lastModified: absoluteSource.modificationDate ?? Date(),
        metadata: metadata
      )

      // Run the processor, if any, to modify the Item
      if let itemProcessor = itemProcessor {
        await itemProcessor(item)
      }

      return item
    })
  }
}
