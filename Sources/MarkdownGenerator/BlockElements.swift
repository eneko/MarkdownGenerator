//
//  MarkdownElements.swift
//  MarkdownGenerator
//
//  Created by Eneko Alonso on 10/8/17.
//

import Foundation



//struct MarkdownTable: MarkdownConvertible {
//
//
//    var output: String {
//        return """
//        | *\(name)* | \(discussion.joined(separator: "\n")) |
//        """
//    }
//}

public struct MarkdownList: MarkdownConvertible {
    
    public let items: [MarkdownConvertible]

    public var markdown: String {
        return items.map { "- \($0.markdown)" }.joined(separator: String.newLine)
    }
}

public struct MarkdownLink: MarkdownConvertible {
    public let title: String
    public let url: String

    public var markdown: String {
        return "[\(title)](\(url))"
    }
}

public struct MarkdownImage: MarkdownConvertible {
    public let url: String
    public let alternateText: String

    public var markdown: String {
        return "![\(alternateText)](\(url))"
    }
}
