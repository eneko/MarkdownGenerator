//
//  MarkdownImage.swift
//  MarkdownGenerator
//
//  Created by Eneko Alonso on 10/9/17.
//

import Foundation

/// Render an HTML image in Markdown format
///
///     MarkdownImage(url: "http://example.com/image.jpg", altText: "SourceDocs Header").markdown
///
/// Would render as:
///
///     ![SourceDocs Header](http://example.com/image.jpg)
///
public struct MarkdownImage: MarkdownConvertible {

    /// URL where the image is located. Can be absolute or relative.
    public let url: String

    /// Alternate text to display on non-graphic browsers or to be used by screen readers.
    public let altText: String

    /// MarkdownImage initializer
    ///
    /// - Parameters:
    ///   - url: URL where the image is located. Can be absolute or relative.
    ///   - altText: Alternate text to display on non-graphic browsers or to be used by screen readers.
    public init(url: String, altText: String = "") {
        self.url = url
        self.altText = altText
    }

    /// Generated Markdown output
    public var markdown: String {
        return "![\(altText)](\(url))"
    }
}
