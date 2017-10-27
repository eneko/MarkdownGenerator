//
//  MarkdownCollapsibleSectionTests.swift
//  MarkdownGeneratorTests
//
//  Created by Eneko Alonso on 10/18/17.
//

import XCTest
import MarkdownGenerator

class MarkdownCollapsibleSectionTests: XCTestCase {

    func testSimple() {
        let output = """
        <details><summary markdown="span">Hello</summary>

        World

        </details>
        """
        XCTAssertEqual(MarkdownCollapsibleSection(summary: "Hello", details: "World").markdown, output)
    }

    func testComplex() {
        let output = """
        <details><summary markdown="span">This is cool stuff</summary>

        # Title

        -   🐶
        -   🐱
        -   🦊

        | Name | Count |
        | ---- | ----- |
        | Dog | 1 |
        | Cat | 2 |

        ```swift
        let foo = Bar()
        ```

        </details>
        """

        let details: [MarkdownConvertible] = [
            MarkdownHeader(title: "Title"),
            MarkdownList(items: ["🐶", "🐱", "🦊"]),
            MarkdownTable(headers: ["Name", "Count"], data: [["Dog", "1"], ["Cat", "2"]]),
            MarkdownCodeBlock(code: "let foo = Bar()", style: .backticks(language: "swift"))
        ]
        XCTAssertEqual(MarkdownCollapsibleSection(summary: "This is cool stuff", details: details).markdown, output)
    }

}
