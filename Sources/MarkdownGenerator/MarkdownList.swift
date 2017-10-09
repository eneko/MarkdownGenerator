//
//  MarkdownList.swift
//  MarkdownGenerator
//
//  Created by Eneko Alonso on 10/9/17.
//

import Foundation

/// Render a list of elements in Markdown format
///
/// Unordered lists:
///
///     - One item
///     - Another item that expands to multiple
///       lines.
///         - A nested item.
///             - Third-level.
///     - Back to first-level.
///
/// Ordered lists:
///
///     1. First item
///     1. Second item
///         1. Nested item (second-level)
///     1. Back to first-level
///
public struct MarkdownList: MarkdownConvertible {
    let style: MarkdownListStyle

    /// List of items to be converted to a list.
    public var items: [MarkdownConvertible]

    /// MarkdownList initializer
    ///
    /// - Parameter items: List of items to be converted to a list.
    public init(items: [MarkdownConvertible], style: MarkdownListStyle = .unordered) {
        self.items = items
        self.style = style
    }

    /// Generated Markdown output
    public var markdown: String {
        return items.map { formatted(item: $0) }.joined(separator: String.newLine)
    }

    // Per Markdown documentation, indent all lines using 4 spaces.
    private func formatted(item: MarkdownConvertible) -> String {
        let symbol = style == .ordered ? "1.  " : "-   "
        var lines = item.markdown.components(separatedBy: String.newLine)
        let first = lines.removeFirst()
        let firstLine = item is MarkdownList ? "    \(first)" : "\(symbol)\(first)"

        if lines.isEmpty {
            return firstLine
        }

        let blankLine = item is MarkdownList ? "" : String.newLine
        let indentedLines = lines.map { $0.isEmpty ? "" : "    \($0)" }.joined(separator: String.newLine) + blankLine
        return """
        \(firstLine)
        \(indentedLines)
        """
    }

}

/// Specifies the type of list to be generated
///
/// - ordered: Ordered lists use numbers followed by periods.
/// - unordered: Unordered lists use hyphens as list markers.
public enum MarkdownListStyle {
    case ordered
    case unordered
}
