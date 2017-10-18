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
        
        XCTAssertEqual(MarkdownHeader(title: "Header Title", level: .h1, style: .setex).markdown, h1)
        XCTAssertEqual(MarkdownHeader(title: "Header Title", level: .h2, style: .setex).markdown, h2)
        XCTAssertEqual(MarkdownHeader(title: "Header Title", level: .h3, style: .setex).markdown, "### Header Title")
        XCTAssertEqual(MarkdownHeader(title: "Header Title", level: .h4, style: .setex).markdown, "#### Header Title")
        XCTAssertEqual(MarkdownHeader(title: "Header Title", level: .h5, style: .setex).markdown, "##### Header Title")
        XCTAssertEqual(MarkdownHeader(title: "Header Title", level: .h6, style: .setex).markdown, "###### Header Title")
    }

    func testHeaderLevelsAtxCosing() {
        XCTAssertEqual(MarkdownHeader(title: "Header Title", level: .h1, close: true).markdown, "# Header Title #")
        XCTAssertEqual(MarkdownHeader(title: "Header Title", level: .h2, close: true).markdown, "## Header Title ##")
        XCTAssertEqual(MarkdownHeader(title: "Header Title", level: .h3, close: true).markdown, "### Header Title ###")
        XCTAssertEqual(MarkdownHeader(title: "Header Title", level: .h4, close: true).markdown, "#### Header Title ####")
        XCTAssertEqual(MarkdownHeader(title: "Header Title", level: .h5, close: true).markdown, "##### Header Title #####")
        XCTAssertEqual(MarkdownHeader(title: "Header Title", level: .h6, close: true).markdown, "###### Header Title ######")
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
        
        XCTAssertEqual(MarkdownHeader(title: "Header Title", level: .h1, style: .setex, close: true).markdown, h1)
        XCTAssertEqual(MarkdownHeader(title: "Header Title", level: .h2, style: .setex, close: true).markdown, h2)
        XCTAssertEqual(MarkdownHeader(title: "Header Title", level: .h3, style: .setex, close: true).markdown, "### Header Title ###")
        XCTAssertEqual(MarkdownHeader(title: "Header Title", level: .h4, style: .setex, close: true).markdown, "#### Header Title ####")
        XCTAssertEqual(MarkdownHeader(title: "Header Title", level: .h5, style: .setex, close: true).markdown, "##### Header Title #####")
        XCTAssertEqual(MarkdownHeader(title: "Header Title", level: .h6, style: .setex, close: true).markdown, "###### Header Title ######")
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
        ("testCodeHeader", testCodeHeader),
    ]

}
