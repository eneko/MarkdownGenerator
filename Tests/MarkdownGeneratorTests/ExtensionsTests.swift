//
//  ExtensionsTests.swift
//  MarkdownGeneratorTests
//
//  Created by Eneko Alonso on 10/8/17.
//

import XCTest
import MarkdownGenerator

class ExtensionsTests: XCTestCase {

    func testStringExtension() {
        XCTAssertEqual("Hello World!".markdown, "Hello World!")
        XCTAssertEqual("".markdown, "")
    }

    func testArrayExtension() {
        let strings = [
            "Hello World!",
            "How are you doing today?",
            "Hopefully better than yesterday.",
            "Have a nice day!"
        ]
        let output = """
        Hello World!

        How are you doing today?

        Hopefully better than yesterday.

        Have a nice day!
        """
        XCTAssertEqual(strings.markdown, output)
    }

    static var allTests = [
        ("testStringExtension", testStringExtension),
        ("testArrayExtension", testArrayExtension),
    ]

}
