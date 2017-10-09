//
//  MarkdownLink.swift
//  MarkdownGenerator
//
//  Created by Eneko Alonso on 10/9/17.
//

import Foundation

/// Render an HTML link in Markdown format
///
///     MarkdownLink(text: "Google", url: "https://example.com").markdown
///
/// Would render as:
///
///     [Google](https://example.com)
///
public struct MarkdownLink: MarkdownConvertible {

    /// Text to display as hyper-linked.
    public let text: String

    /// Link URL, can be absolute, relative, or #local.
    public let url: String

    /// MarkdownLink initializer
    ///
    /// - Parameters:
    ///   - text: Text to display as hyper-linked.
    ///   - url: Link URL, can be absolute, relative, or #local.
    public init(text: String, url: String) {
        self.text = text
        self.url = url
    }

    /// Generated Markdown output
    public var markdown: String {
        return "[\(text)](\(url))"
    }
}
