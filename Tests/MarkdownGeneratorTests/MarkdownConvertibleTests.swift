//
//  MarkdownConvertibleTests.swift
//  MarkdownGeneratorTests
//
//  Created by Eneko Alonso on 10/9/17.
//

import XCTest
import MarkdownGenerator

class MarkdownConvertibleTests: XCTestCase {

    func testCustomStructureAdoptsProtocol() {
        // Custom structure that can be rendered as Markdown
        struct Contact: MarkdownConvertible {
            let firstName: String
            let lastName: String

            var markdown: String {
                return "**\(lastName)**, \(firstName)"
            }
        }

        XCTAssertEqual(Contact(firstName: "Bob", lastName: "Jones").markdown, "**Jones**, Bob")
    }

    static var allTests = [
        ("testCustomStructureAdoptsProtocol", testCustomStructureAdoptsProtocol),
    ]

}
