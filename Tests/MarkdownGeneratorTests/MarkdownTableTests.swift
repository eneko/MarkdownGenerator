//
//  MarkdownTableTests.swift
//  MarkdownGeneratorTests
//
//  Created by Eneko Alonso on 10/9/17.
//

import XCTest
import MarkdownGenerator

class MarkdownTableTests: XCTestCase {

    func test1x1Table() {
        let data: [[String]] = [[]]
        let table = MarkdownTable(headers: ["Header"], data: data)

        let output = """
        | Header |
        | ------ |
        |  |
        """

        XCTAssertEqual(table.markdown, output)
    }

    func test3x3Table() {
        let data: [[String]] = [
            ["🍏", "Apple", "Fruits"],
            ["🍊", "Orange", "Fruits"],
            ["🥖", "Bread", "Bakery"]
        ]
        let table = MarkdownTable(headers: ["", "Name", "Department"], data: data)

        let output = """
        |   | Name | Department |
        | - | ---- | ---------- |
        | 🍏 | Apple | Fruits |
        | 🍊 | Orange | Fruits |
        | 🥖 | Bread | Bakery |
        """

        XCTAssertEqual(table.markdown, output)
    }

    func testMultilineValues() {
        let data: [[String]] = [
            ["Single-line value", "Multi-line\n\nvalue"],
            ["Single-line value", "Multi-line\n\nvalue"],
            ["Single-line value", "Multi-line\n\nvalue"]
        ]
        let table = MarkdownTable(headers: ["Single-line", "Multi-line"], data: data)

        let output = """
        | Single-line | Multi-line |
        | ----------- | ---------- |
        | Single-line value | Multi-line  value |
        | Single-line value | Multi-line  value |
        | Single-line value | Multi-line  value |
        """

        XCTAssertEqual(table.markdown, output)
    }

    static var allTests = [
        ("test1x1Table", test1x1Table),
        ("test3x3Table", test3x3Table),
        ("testMultilineValues", testMultilineValues)
    ]

}
