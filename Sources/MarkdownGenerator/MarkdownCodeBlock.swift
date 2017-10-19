//
//  MarkdownCodeBlock.swift
//  MarkdownGenerator
//
//  Created by Eneko Alonso on 10/18/17.
//

import Foundation

public struct MarkdownCodeBlock: MarkdownConvertible {
    let code: String
    let style: CodeBlockStyle

    public init(code: String, style: CodeBlockStyle = .indented) {
        self.code = code
        self.style = style
    }

    /// Generated Markdown output
    public var markdown: String {
        switch style {
        case .indented:
            let lines = code.components(separatedBy: .newlines)
            let indented = lines.map { $0.isEmpty ? "" : "    \($0)" }
            return indented.joined(separator: String.newLine)
        case .backticks(let language):
            return """
            ```\(language)
            \(code)
            ```
            """
        }
    }

}

/// Markdown format for the generated code block
///
/// - indented: Code block is indented by 4-spaces
/// - backticks: Code block is wrapped with ```
public enum CodeBlockStyle {
    case indented
    case backticks(language: String)
}
