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

    func testFileWrite() throws {
        let content = MarkdownHeader(title: "Hello World!")
        let file = MarkdownFile(filename: "WriteTest", content: content)
        try file.write()

        let fileContent = try String(contentsOfFile: "WriteTest.md")
        XCTAssertEqual(fileContent, content.markdown)
    }

    func testFileWriteWithFolder() throws {
        let content = MarkdownHeader(title: "Hello World!")
        let file = MarkdownFile(filename: "WriteTest", basePath: "AFolder", content: content)
        try file.write()

        let fileContent = try String(contentsOfFile: "AFolder/WriteTest.md")
        XCTAssertEqual(fileContent, content.markdown)
    }

    static var allTests = [
        ("testFilePath", testFilePath)
    ]

}
