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
        XCTAssertEqual(MarkdownLink(text: "example.com", url: "http://example.com").markdown, "[example.com](http://example.com)")
    }

}
