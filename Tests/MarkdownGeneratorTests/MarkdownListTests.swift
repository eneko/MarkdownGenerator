//
//  MarkdownListTests.swift
//  MarkdownGeneratorTests
//
//  Created by Eneko Alonso on 10/9/17.
//

import XCTest
import MarkdownGenerator

class MarkdownListTests: XCTestCase {

    func testUnorderedSimpleList() {
        let input = ["🍏", "🍌", "🍊", "🍇"]

        let output = """
        -   🍏
        -   🍌
        -   🍊
        -   🍇
        """

        XCTAssertEqual(MarkdownList(items: input).markdown, output)
    }

    func testOrderedSimpleList() {
        let input = ["🍏", "🍌", "🍊", "🍇"]

        let output = """
        1.  🍏
        1.  🍌
        1.  🍊
        1.  🍇
        """

        XCTAssertEqual(MarkdownList(items: input, style: .ordered).markdown, output)
    }

    func testUnorderedNestedList() {
        let input: [MarkdownConvertible] = [
            "Fruits",
            MarkdownList(items: ["🍏", "🍌", "🍊", "🍇"]),
            "Bakery",
            MarkdownList(items: ["🥖", "🍞", "🍰", "🎂"]),
        ]

        let output = """
        -   Fruits
            -   🍏
            -   🍌
            -   🍊
            -   🍇
        -   Bakery
            -   🥖
            -   🍞
            -   🍰
            -   🎂
        """

        XCTAssertEqual(MarkdownList(items: input).markdown, output)
    }

    func testOrderedNestedList() {
        let input: [MarkdownConvertible] = [
            "Fruits",
            MarkdownList(items: ["🍏", "🍌", "🍊", "🍇"], style: .ordered),
            "Bakery",
            MarkdownList(items: ["🥖", "🍞", "🍰", "🎂"], style: .ordered),
            ]

        let output = """
        1.  Fruits
            1.  🍏
            1.  🍌
            1.  🍊
            1.  🍇
        1.  Bakery
            1.  🥖
            1.  🍞
            1.  🍰
            1.  🎂
        """

        XCTAssertEqual(MarkdownList(items: input, style: .ordered).markdown, output)
    }

    func testMixedNestedList() {
        let input: [MarkdownConvertible] = [
            "Fruits",
            MarkdownList(items: ["🍏", "🍌", "🍊", "🍇"]),
            "Bakery",
            MarkdownList(items: ["🥖", "🍞", "🍰", "🎂"]),
            ]

        let output = """
        1.  Fruits
            -   🍏
            -   🍌
            -   🍊
            -   🍇
        1.  Bakery
            -   🥖
            -   🍞
            -   🍰
            -   🎂
        """

        XCTAssertEqual(MarkdownList(items: input, style: .ordered).markdown, output)
    }

    func testUnorderedTrheeLevelList() {
        let list = MarkdownList(items: ["Fruits", MarkdownList(items: ["Citrics", MarkdownList(items: ["🍋", "🍊"])])])

        let output = """
        -   Fruits
            -   Citrics
                -   🍋
                -   🍊
        """

        XCTAssertEqual(list.markdown, output)
    }

    func testMultipleParagraphLists() {
        let input = [
            """
            Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec odio.
            Quisque volutpat mattis eros. Nullam malesuada erat ut turpis.
            Suspendisse urna nibh, viverra non, semper suscipit, posuere a, pede.

                Indented code block

            Donec nec justo eget felis facilisis fermentum. Aliquam porttitor mauris
            sit amet orci. Aenean dignissim pellentesque felis.

            Morbi in sem quis dui placerat ornare. Pellentesque odio nisi, euismod in,
            pharetra a, ultricies in, diam. Sed arcu. Cras consequat.
            """,

            """
            Pellentesque fermentum dolor. Aliquam quam lectus, facilisis auctor, ultrices
            ut, elementum vulputate, nunc.

            > Blockquote paragraph that expands to
            > multiple lines

            Sed adipiscing ornare risus. Morbi est est, blandit sit amet, sagittis vel,
            euismod vel, velit. Pellentesque egestas sem. Suspendisse commodo
            ullamcorper magna.
            """
        ]

        let output = """
        -   Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec odio.
            Quisque volutpat mattis eros. Nullam malesuada erat ut turpis.
            Suspendisse urna nibh, viverra non, semper suscipit, posuere a, pede.

                Indented code block

            Donec nec justo eget felis facilisis fermentum. Aliquam porttitor mauris
            sit amet orci. Aenean dignissim pellentesque felis.

            Morbi in sem quis dui placerat ornare. Pellentesque odio nisi, euismod in,
            pharetra a, ultricies in, diam. Sed arcu. Cras consequat.

        -   Pellentesque fermentum dolor. Aliquam quam lectus, facilisis auctor, ultrices
            ut, elementum vulputate, nunc.

            > Blockquote paragraph that expands to
            > multiple lines

            Sed adipiscing ornare risus. Morbi est est, blandit sit amet, sagittis vel,
            euismod vel, velit. Pellentesque egestas sem. Suspendisse commodo
            ullamcorper magna.

        """

        XCTAssertEqual(MarkdownList(items: input).markdown, output)
    }

}
