//
//  MarkdownTableTests.swift
//  MarkdownGeneratorTests
//
//  Created by Eneko Alonso on 11/28/18.
//

import XCTest
@testable import MarkdownGenerator

class MarkdownTableInternalTests: XCTestCase {

    func testEmptyColumnLength() {
        let table = MarkdownTable(headers: [], data: [])
        XCTAssertEqual(table.columnLength(values: []), 0)
    }

}
