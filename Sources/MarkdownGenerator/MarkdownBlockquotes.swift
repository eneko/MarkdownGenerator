//
//  MarkdownBlockquotes.swift
//  MarkdownGenerator
//
//  Created by Eneko Alonso on 10/8/17.
//

import Foundation

/// Render Markdown Blockquotes
///
/// Markdown uses email-style > characters for blockquoting.
///
/// > This is a blockquote with two paragraphs. Lorem ipsum dolor sit amet,
/// > consectetuer adipiscing elit. Aliquam hendrerit mi posuere lectus.
/// > Vestibulum enim wisi, viverra nec, fringilla in, laoreet vitae, risus.
/// >
/// > Donec sit amet nisl. Aliquam semper ipsum sit amet velit. Suspendisse
/// > id sem consectetuer libero luctus adipiscing.
///
public struct MarkdownBlockquotes: MarkdownConvertible {

    let content: MarkdownConvertible

    /// MarkdownBlockquotes initializer
    ///
    /// - Parameter content: Content to be block-quoted with '> '
    public init(content: MarkdownConvertible) {
        self.content = content
    }

    /// Generated Markdown output
    public var markdown: String {
        return content.blockquoted.markdown
    }
}

// MARK: - MarkdownBlockquote
extension MarkdownConvertible {
    /// Quoted version of the generated Markdown output of the current entity.
    ///
    ///     "## H2 Header".blockquoted     // > ## H2 Header
    ///
    public var blockquoted: MarkdownConvertible {
        let lines = markdown.components(separatedBy: String.newLine)
        let quoted: [String] = lines.flatMap { $0.isEmpty ? "" : "> \($0)" }
        return quoted.joined(separator: String.newLine)
    }
}
