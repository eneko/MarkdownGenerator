//
//  MarkdownList.swift
//  MarkdownGenerator
//
//  Created by Eneko Alonso on 10/9/17.
//

import Foundation

public struct MarkdownList: MarkdownConvertible {

    public let items: [MarkdownConvertible]

    public var markdown: String {
        return items.map { "- \($0.markdown)" }.joined(separator: String.newLine)
    }
}
