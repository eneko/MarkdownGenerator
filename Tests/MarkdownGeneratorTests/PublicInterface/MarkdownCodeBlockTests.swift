//
//  MarkdownCodeBlockTests.swift
//  MarkdownGeneratorTests
//
//  Created by Eneko Alonso on 10/18/17.
//

import XCTest
import MarkdownGenerator

class MarkdownCodeBlockTests: XCTestCase {

    func testEmpty() {
        let input = """
        """
        let output = """
        """
        XCTAssertEqual(MarkdownCodeBlock(code: input).markdown, output)
    }

    func testIndented() {
        let input = """
        /// Defines an entity that can be represented as Markdown.
        public protocol MarkdownConvertible {

            /// Generated Markdown output representing the current entity.
            var markdown: String { get }
        }
        """
        let output = """
            /// Defines an entity that can be represented as Markdown.
            public protocol MarkdownConvertible {

                /// Generated Markdown output representing the current entity.
                var markdown: String { get }
            }
        """
        XCTAssertEqual(MarkdownCodeBlock(code: input).markdown, output)
    }

    func testBackticks() {
        let input = """
        /// Defines an entity that can be represented as Markdown.
        public protocol MarkdownConvertible {

            /// Generated Markdown output representing the current entity.
            var markdown: String { get }
        }
        """
        let output = """
        ```
        /// Defines an entity that can be represented as Markdown.
        public protocol MarkdownConvertible {

            /// Generated Markdown output representing the current entity.
            var markdown: String { get }
        }
        ```
        """
        XCTAssertEqual(MarkdownCodeBlock(code: input, style: .backticks(language: "")).markdown, output)
    }

    func testBackticksSwift() {
        let input = """
        /// Defines an entity that can be represented as Markdown.
        public protocol MarkdownConvertible {

            /// Generated Markdown output representing the current entity.
            var markdown: String { get }
        }
        """
        let output = """
        ```swift
        /// Defines an entity that can be represented as Markdown.
        public protocol MarkdownConvertible {

            /// Generated Markdown output representing the current entity.
            var markdown: String { get }
        }
        ```
        """
        XCTAssertEqual(MarkdownCodeBlock(code: input, style: .backticks(language: "swift")).markdown, output)
    }

}
