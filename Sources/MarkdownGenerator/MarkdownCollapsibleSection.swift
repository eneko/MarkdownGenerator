//
//  MarkdownCollapsibleSection.swift
//  MarkdownGenerator
//
//  Created by Eneko Alonso on 10/18/17.
//

import Foundation

public struct MarkdownCollapsibleSection: MarkdownConvertible {
    let summary: String
    let details: MarkdownConvertible

    public init(summary: String, details: MarkdownConvertible) {
        self.summary = summary
        self.details = details
    }

    /// Generated Markdown output
    public var markdown: String {
        return """
        <details><summary>\(summary)</summary>

        \(details.markdown)
        </details>
        """
    }

}
