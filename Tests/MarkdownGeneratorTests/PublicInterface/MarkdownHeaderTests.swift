//
//  BockElementsTests.swift
//  MarkdownGeneratorTests
//
//  Created by Eneko Alonso on 10/8/17.
//

import XCTest
import MarkdownGenerator

class MarkdownHeaderTests: XCTestCase {

    func testDefaultHeader() {
        XCTAssertEqual(MarkdownHeader(title: "Header Title").markdown, "# Header Title")
    }

    func testHeaderLevelsAtx() {
        XCTAssertEqual(MarkdownHeader(title: "Header Title", level: .h1).markdown, "# Header Title")
        XCTAssertEqual(MarkdownHeader(title: "Header Title", level: .h2).markdown, "## Header Title")
        XCTAssertEqual(MarkdownHeader(title: "Header Title", level: .h3).markdown, "### Header Title")
        XCTAssertEqual(MarkdownHeader(title: "Header Title", level: .h4).markdown, "#### Header Title")
        XCTAssertEqual(MarkdownHeader(title: "Header Title", level: .h5).markdown, "##### Header Title")
        XCTAssertEqual(MarkdownHeader(title: "Header Title", level: .h6).markdown, "###### Header Title")
    }

    func testHeaderLevelsSetex() {
        let h1 = """
        Header Title
        ============
        """

        let h2 = """
        Header Title
        ------------
        """

        let h3 = "### Header Title"
        let h4 = "#### Header Title"
        let h5 = "##### Header Title"
        let h6 = "###### Header Title"

        XCTAssertEqual(MarkdownHeader(title: "Header Title", level: .h1, style: .setex).markdown, h1)
        XCTAssertEqual(MarkdownHeader(title: "Header Title", level: .h2, style: .setex).markdown, h2)
        XCTAssertEqual(MarkdownHeader(title: "Header Title", level: .h3, style: .setex).markdown, h3)
        XCTAssertEqual(MarkdownHeader(title: "Header Title", level: .h4, style: .setex).markdown, h4)
        XCTAssertEqual(MarkdownHeader(title: "Header Title", level: .h5, style: .setex).markdown, h5)
        XCTAssertEqual(MarkdownHeader(title: "Header Title", level: .h6, style: .setex).markdown, h6)
    }

    func testHeaderLevelsAtxCosing() {
        let h1 = "# Header Title #"
        let h2 = "## Header Title ##"
        let h3 = "### Header Title ###"
        let h4 = "#### Header Title ####"
        let h5 = "##### Header Title #####"
        let h6 = "###### Header Title ######"
        XCTAssertEqual(MarkdownHeader(title: "Header Title", level: .h1, close: true).markdown, h1)
        XCTAssertEqual(MarkdownHeader(title: "Header Title", level: .h2, close: true).markdown, h2)
        XCTAssertEqual(MarkdownHeader(title: "Header Title", level: .h3, close: true).markdown, h3)
        XCTAssertEqual(MarkdownHeader(title: "Header Title", level: .h4, close: true).markdown, h4)
        XCTAssertEqual(MarkdownHeader(title: "Header Title", level: .h5, close: true).markdown, h5)
        XCTAssertEqual(MarkdownHeader(title: "Header Title", level: .h6, close: true).markdown, h6)
    }

    func testHeaderLevelsSetexClosing() {
        let h1 = """
        Header Title
        ============
        """

        let h2 = """
        Header Title
        ------------
        """

        let h3 = "### Header Title ###"
        let h4 = "#### Header Title ####"
        let h5 = "##### Header Title #####"
        let h6 = "###### Header Title ######"

        XCTAssertEqual(MarkdownHeader(title: "Header Title", level: .h1, style: .setex, close: true).markdown, h1)
        XCTAssertEqual(MarkdownHeader(title: "Header Title", level: .h2, style: .setex, close: true).markdown, h2)
        XCTAssertEqual(MarkdownHeader(title: "Header Title", level: .h3, style: .setex, close: true).markdown, h3)
        XCTAssertEqual(MarkdownHeader(title: "Header Title", level: .h4, style: .setex, close: true).markdown, h4)
        XCTAssertEqual(MarkdownHeader(title: "Header Title", level: .h5, style: .setex, close: true).markdown, h5)
        XCTAssertEqual(MarkdownHeader(title: "Header Title", level: .h6, style: .setex, close: true).markdown, h6)
    }

    func testCodeHeader() {
        XCTAssertEqual(MarkdownHeader(title: "`Header Title`").markdown, "# `Header Title`")
    }

    static var allTests = [
        ("testDefaultHeader", testDefaultHeader),
        ("testHeaderLevelsAtx", testHeaderLevelsAtx),
        ("testHeaderLevelsSetex", testHeaderLevelsSetex),
        ("testHeaderLevelsAtxCosing", testHeaderLevelsAtxCosing),
        ("testHeaderLevelsSetexClosing", testHeaderLevelsSetexClosing),
        ("testCodeHeader", testCodeHeader)
    ]

}
