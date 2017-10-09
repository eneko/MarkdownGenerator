//
//  MarkdownBlockquotesTests.swift
//  MarkdownGeneratorTests
//
//  Created by Eneko Alonso on 10/8/17.
//

import XCTest
import MarkdownGenerator

class MarkdownBlockquotesTests: XCTestCase {

    let input = """
        ## This is a header.

        1.   This is the first list item.
        2.   This is the second list item.

        Here's some example code:

            return shell_exec("echo $input | $markdown_script");

        > This is a quote.
        """

    let output = """
        > ## This is a header.
        >
        > 1.   This is the first list item.
        > 2.   This is the second list item.
        >
        > Here's some example code:
        >
        >     return shell_exec("echo $input | $markdown_script");
        >
        > > This is a quote.
        """

    func testBlockquotes() {
        XCTAssertEqual(MarkdownBlockquotes(content: input).markdown, output)
    }

    func testBlockquoted() {
        XCTAssertEqual(input.blockquoted.markdown, output)
    }

    func testNested() {
        XCTAssertEqual(input.blockquoted.blockquoted.markdown, output.blockquoted.markdown)
    }

    func testMultipleInputs() {
        XCTAssertEqual([input, input].blockquoted.markdown, [output, output].joined(separator: "\n>\n"))
    }

}
