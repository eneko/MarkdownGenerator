//
//  MarkdownTable.swift
//  MarkdownGenerator
//
//  Created by Eneko Alonso on 10/9/17.
//

import Foundation

/// Render a two dimensional Markdown table.
///
///     |   | Name | Department |
///     | - | ---- | ---------- |
///     | 🍏 | Apple | Fruits |
///     | 🍊 | Orange | Fruits |
///     | 🥖 | Bread | Bakery |
///
/// *Notes*:
/// - Markdown tables are not supported by all Markdown readers.
/// - Table headers are required.
/// - Table cells cannot contain multiple lines. New line characters are replaced by a space.
public struct MarkdownTable: MarkdownConvertible {

    let headers: [String]
    let data: [[String]]

    /// MarkdownTable initializer
    ///
    /// - Parameters:
    ///   - headers: List of table header titles.
    ///   - data: Two-dimensional `String` array with the table content. Rows are defined by
    ///        the outer array, columns are defined by the inner arrays.
    ///
    ///        An array of rows, each row containing an array of columns. All rows should contain the same
    ///        number of columns as the headers array, to avoid formatting issues.
    public init(headers: [String], data: [[String]]) {
        self.headers = headers.map { $0.isEmpty ? " " : $0 }
        self.data = data
    }

    /// Generated Markdown output
    public var markdown: String {
        let headerRow = makeRow(values: headers)
        let separatorRow = makeRow(values: headers.map { Array(repeating: "-", count: $0.count).joined() })
        let dataRows = data.map { columns in
            return makeRow(values: columns)
        }
        return """
        \(headerRow)
        \(separatorRow)
        \(dataRows.joined(separator: String.newLine))
        """
    }

    // Convert a String array into a markdown formatter table row.
    // Table cells cannot contain multiple lines. New line characters are replaced by a space.
    private func makeRow(values: [String]) -> String {
        let values = values.map { $0.replacingOccurrences(of: String.newLine, with: " ") }
        return "| " + values.joined(separator: " | ") + " |"
    }
}
