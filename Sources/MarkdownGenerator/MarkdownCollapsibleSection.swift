//
//  MarkdownCollapsibleSection.swift
//  MarkdownGenerator
//
//  Created by Eneko Alonso on 10/18/17.
//

import Foundation

/// Collapsible blocks are a great way to hide large portions of content
/// that, while valuable to the reader, would result on a lot of noise.
///
/// Collapsible blocks work well in most Markdown readers, including
/// GitHub.com and rendered GitHub Pages. However, because they rely on
/// HTML tags, they will make the _raw_ markdown output harder to read.
///
/// ```html
/// <details><summary>Block Title</summary>
///
///     Block details.
///
/// </details>
/// ```
public struct MarkdownCollapsibleSection: MarkdownConvertible {
    let summary: String
    let details: MarkdownConvertible

    /// MarkdownCollapsibleSection initializer
    ///
    /// - Parameters:
    ///   - summary: Plain text or HTML string containing the block title.
    ///   - details: Markdown convertible elements to include in the collapsible block.
    public init(summary: String, details: MarkdownConvertible) {
        self.summary = summary
        self.details = details
    }

    /// Generated Markdown output
    public var markdown: String {
        return """
        <details><summary markdown="span">\(summary)</summary>

        \(details.markdown)

        </details>
        """
    }

}
