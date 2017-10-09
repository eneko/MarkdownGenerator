//
//  MarkdownImageTests.swift
//  MarkdownGeneratorTests
//
//  Created by Eneko Alonso on 10/9/17.
//

import XCTest
import MarkdownGenerator

class MarkdownImageTests: XCTestCase {

    func testImage() {
        XCTAssertEqual(MarkdownImage(url: "http://example.com/image.png").markdown, "![](http://example.com/image.png)")
    }

    func testImageAltText() {
        let image = MarkdownImage(url: "http://example.com/image.png", altText: "Alternate Text")
        XCTAssertEqual(image.markdown, "![Alternate Text](http://example.com/image.png)")
    }

}
