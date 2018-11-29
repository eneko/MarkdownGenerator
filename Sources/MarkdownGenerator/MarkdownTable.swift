//
//  MarkdownTable.swift
//  MarkdownGenerator
//
//  Created by Eneko Alonso on 10/9/17.
//

import Foundation

/// Render a two dimensional Markdown table.
///
///     |    | Name   | Department |
///     | -- | ------ | ---------- |
///     | 🍏 | Apple  | Fruits     |
///     | 🍊 | Orange | Fruits     |
///     | 🥖 | Bread  | Bakery     |
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
        let columnWidths = computeColumnWidths()
        if columnWidths.isEmpty {
            return .newLine
        }
        let headerRow = makeRow(values: pad(values: headers, lengths: columnWidths))
        let separatorRow = makeRow(values: columnWidths.map { String(repeating: "-", count: $0) })
        let dataRows = data.map { columns in
            return makeRow(values: pad(values: columns, lengths: columnWidths))
        }
        return """
        \(headerRow)
        \(separatorRow)
        \(dataRows.joined(separator: String.newLine))
        """
    }

    /// Return max length for each column, counting individual UTF16 characters for better emoji support.
    ///
    /// - Returns: Array of column widths
    func computeColumnWidths() -> [Int] {
        let rows = [headers] + data
        guard let maxColumns = rows.map({ $0.count }).max() else {
            return []
        }
        let columnWidths = (0..<maxColumns).map { columnIndex -> Int in
            return columnLength(values: rows.compactMap({ $0.get(at: columnIndex) }))
        }
        return columnWidths
    }

    func columnLength(values: [String]) -> Int {
        return values.map({ $0.utf16.count }).max() ?? 0
    }

    /// Pad array of strings to a given length, counting individual UTF16 characters
    ///
    /// - Parameters:
    ///   - values: array of strings to pad
    ///   - lengths: desired lengths
    /// - Returns: array of right-padded strings
    func pad(values: [String], lengths: [Int]) -> [String] {
        var values = values
        while values.count < lengths.count {
            values.append("")
        }
        return zip(values, lengths).map { value, length in
            value + String(repeating: " ", count: max(0, length - value.utf16.count))
        }
    }

    /// Convert a String array into a markdown formatter table row.
    /// Table cells cannot contain multiple lines. New line characters are replaced by a space.
    ///
    /// - Parameter values: array of values
    /// - Returns: Markdown formatted row
    func makeRow(values: [String]) -> String {
        let values = values.map { $0.replacingOccurrences(of: String.newLine, with: " ") }
        return "| " + values.joined(separator: " | ") + " |"
    }
}

extension Array {
    func get(at index: Int) -> Element? {
        guard (0..<count).contains(index) else {
            return nil
        }
        return self[index]
    }
}
