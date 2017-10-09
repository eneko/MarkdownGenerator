//
//  MarkdownLink.swift
//  MarkdownGenerator
//
//  Created by Eneko Alonso on 10/9/17.
//

import Foundation

public struct MarkdownLink: MarkdownConvertible {
    public let title: String
    public let url: String

    public var markdown: String {
        return "[\(title)](\(url))"
    }
}
