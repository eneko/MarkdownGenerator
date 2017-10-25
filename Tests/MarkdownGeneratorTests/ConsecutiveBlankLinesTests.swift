//
//  ConsecutiveBlankLinesTests.swift
//  MarkdownGeneratorTests
//
//  Created by Eneko Alonso on 10/18/17.
//

import XCTest
import MarkdownGenerator

class ConsecutiveBlankLinesTests: XCTestCase {

    func testEmpty() {
        let input = ""
        XCTAssertEqual(input.removingConsecutiveBlankLines, input)
    }

    func testSingle() {
        let input = "Single line"
        XCTAssertEqual(input.removingConsecutiveBlankLines, input)
    }

    func testSingleTrailing() {
        let input = "Single line\n"
        XCTAssertEqual(input.removingConsecutiveBlankLines, input)
    }

    func testMulti() {
        let input = """
        Multi-line
        """
        XCTAssertEqual(input.removingConsecutiveBlankLines, input)
    }

    func testMultiTrailing() {
        let input = """
        Multi-line

        """
        XCTAssertEqual(input.removingConsecutiveBlankLines, input)
    }

    func testLeadingAndTrailing() {
        let input = """

        Multi-line

        """
        XCTAssertEqual(input.removingConsecutiveBlankLines, input)
    }

    func testLeadingAndTrailingConsecutive() {
        let input = """


        Multi-line


        """
        let output = """

        Multi-line

        """
        XCTAssertEqual(input.removingConsecutiveBlankLines, output)
    }

    func testInBetweenText() {
        let input = """
        In between lines


        Multi-line


        Final paragraph
        """
        let output = """
        In between lines

        Multi-line

        Final paragraph
        """
        XCTAssertEqual(input.removingConsecutiveBlankLines, output)
    }

    func testTripleBlankLines() {
        let input = """
        In between lines



        Multi-line



        Final paragraph
        """
        let output = """
        In between lines

        Multi-line

        Final paragraph
        """
        XCTAssertEqual(input.removingConsecutiveBlankLines, output)
    }

    func testLists() {
        let input = """
        - something

        - something else

            - nested
            - nested too

        - back again


        - final item
        """
        let output = """
        - something

        - something else

            - nested
            - nested too

        - back again

        - final item
        """
        XCTAssertEqual(input.removingConsecutiveBlankLines, output)
    }

    static var allTests = [
        ("testEmpty", testEmpty),
        ("testSingle", testSingle),
        ("testSingleTrailing", testSingleTrailing),
        ("testMulti", testMulti),
        ("testMultiTrailing", testMultiTrailing),
        ("testLeadingAndTrailing", testLeadingAndTrailing),
        ("testLeadingAndTrailingConsecutive", testLeadingAndTrailingConsecutive),
        ("testInBetweenText", testInBetweenText),
        ("testTripleBlankLines", testTripleBlankLines),
        ("testLists", testLists)
    ]

}
