//
//  MarkdownLinkTests.swift
//  MarkdownGeneratorTests
//
//  Created by Eneko Alonso on 10/9/17.
//

import XCTest
import MarkdownGenerator

class MarkdownLinkTests: XCTestCase {

    func testLink() {
        let link = MarkdownLink(text: "example.com", url: "http://example.com")
        XCTAssertEqual(link.markdown, "[example.com](http://example.com)")
    }

    static var allTests = [
        ("testLink", testLink)
    ]

}
