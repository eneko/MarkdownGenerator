//
//  MarkdownConvertible.swift
//  MarkdownGenerator
//
//  Created by Eneko Alonso on 10/8/17.
//

import Foundation

/// Defines an entity that can be represented as Markdown.
public protocol MarkdownConvertible {

    /// Generated Markdown output representing the current entity.
    var markdown: String { get }
}
