//
//  MarkdownImage.swift
//  MarkdownGenerator
//
//  Created by Eneko Alonso on 10/9/17.
//

import Foundation


public struct MarkdownImage: MarkdownConvertible {
    public let url: String
    public let alternateText: String

    public var markdown: String {
        return "![\(alternateText)](\(url))"
    }
}

