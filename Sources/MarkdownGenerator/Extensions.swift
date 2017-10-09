//
//  Extensions.swift
//  MarkdownGenerator
//
//  Created by Eneko Alonso on 10/8/17.
//

import Foundation

// MARK: - String: MarkdownConvertible

extension String: MarkdownConvertible {
    /// Render a string of text as Markdown. No transformations applied.
    public var markdown: String {
        return self
    }

    static let newLine = "\n"
}

extension Array: MarkdownConvertible {
    /// Render a collection of Markdown convertible elements.
    ///
    /// Elements are rendered separated by one blank line, to prevent formatting interference.
    public var markdown: String {
        return self.flatMap { ($0 as? MarkdownConvertible)?.markdown }.joined(separator: "\n\n")
    }
}
