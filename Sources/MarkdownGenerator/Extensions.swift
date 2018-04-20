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

    /// Remove consecutive blank lines from a string output
    public var removingConsecutiveBlankLines: String {
        let lines = components(separatedBy: .newlines)
        let filtered: [(offset: Int, element: String)] = lines.enumerated().filter { line in
            return line.offset == 0 ||
                lines[line.offset].trimmingCharacters(in: .whitespaces).isEmpty == false ||
                lines[line.offset - 1].trimmingCharacters(in: .whitespaces).isEmpty == false
        }
        return filtered.map { $0.element }.joined(separator: String.newLine)
    }

    static let newLine = "\n"
}

extension Array: MarkdownConvertible {
    /// Render a collection of Markdown convertible elements.
    ///
    /// Elements are rendered separated by one blank line, to prevent formatting interference.
    public var markdown: String {
        return compactMap { ($0 as? MarkdownConvertible)?.markdown }.joined(separator: "\n\n")
    }
}
