import XCTest
@testable import MarkdownGeneratorTests

XCTMain([
    testCase(ExtensionsTests.allTests),
    testCase(MarkdownBlockquotesTests.allTests),
    testCase(MarkdownConvertibleTests.allTests),
    testCase(MarkdownFileTests.allTests),
    testCase(MarkdownHeaderTests.allTests),
    testCase(MarkdownImageTests.allTests),
    testCase(MarkdownLinkTests.allTests),
    testCase(MarkdownListTests.allTests),
    testCase(MarkdownTableTests.allTests)
])
