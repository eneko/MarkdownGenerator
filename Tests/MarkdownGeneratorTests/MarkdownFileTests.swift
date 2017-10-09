//
//  MarkdownFileTests.swift
//  MarkdownGeneratorTests
//
//  Created by Eneko Alonso on 10/9/17.
//

import XCTest
import MarkdownGenerator

class MarkdownFileTests: XCTestCase {

    func testFilePath() {
        let file = MarkdownFile(filename: "Test", basePath: "Path/To/File", content: "")
        XCTAssertEqual(file.filePath, "Path/To/File/Test.md")
    }

}
