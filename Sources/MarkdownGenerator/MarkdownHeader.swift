//
//  MarkdownHeader.swift
//  MarkdownGenerator
//
//  Created by Eneko Alonso on 10/8/17.
//

import Foundation

/// Renders a Markdown Header
///
/// Markdown supports two styles of headers, Setext and atx.
///
/// Setext-style headers are “underlined” using equal signs (for first-level headers)
/// and dashes (for second-level headers). For example:
///
///     This is an H1
///     =============
///
///     This is an H2
///     -------------
///
/// Atx-style headers use 1-6 hash characters at the start of the line, corresponding
/// to HTML header levels 1-6. For example:
///
///     # This is an H1
///
///     ## This is an H2
///
///     ###### This is an H6
///
/// Atx-style headers can be closed (this is purely cosmetic):
///
///     # This is an H1 #
///
///     ## This is an H2 ##
///
///     ### This is an H3 ###
///
public struct MarkdownHeader: MarkdownConvertible {
    let title: String
    let level: MarkdownHeaderLevel
    let style: MarkdownHeaderStyle
    let close: Bool
    
    /// MarkdownHeader initializer.
    ///
    /// - Parameters:
    ///   - title: Title of the header element
    ///   - level: Header level (`h1`, `h2`... `h6`)
    ///   - style: Header style: `setex` (underlined) or `atx` ('#') (defaults to `atx`). Setex format is only available
    ///            for first-level (using equal signs) and second-level headers (using dashes).
    ///   - close: Close `atx` style headers (defaults to `false`). When false, headers only include the '#' prefix.
    ///            When `true`, headers also include the trailing '#' suffix:
    ///
    ///            ### Third-level Header ###
    ///
    /// - SeeAlso: MarkdownHeaderLevel, MarkdownHeaderStyle
    public init(title: String, level: MarkdownHeaderLevel = .h1, style: MarkdownHeaderStyle = .atx, close: Bool = false) {
        self.title = title
        self.level = level
        self.style = level.rawValue < 3 ? style : .atx
        self.close = close
    }
    
    /// Generated Markdown output
    public var markdown: String {
        switch style {
        case .atx:
            let prefix = Array(repeating: "#", count: level.rawValue).joined()
            let suffix = close ? prefix : ""
            return "\(prefix) \(title) \(suffix)".trimmingCharacters(in: .whitespacesAndNewlines)
        case .setex:
            let symbol = level == .h1 ? "=" : "-"
            let underline = Array(repeating: symbol, count: title.count).joined()
            return """
            \(title)
            \(underline)
            """
        }
    }
}

/// Markdown Header level
///
/// - h1: first-level headers
///
///       # H1 Header
///
/// - h2: second-level headers
///
///       ## H2 Header
///
/// - h3: third-level headers
///
///       ### H3 Header
///
/// - h4: fourth-level headers
///
///       #### H4 Header
///
/// - h5: fifth-level headers
///
///       ##### H5 Header
///
/// - h6: sixth-level headers
///
///       ###### H6 Header
///
public enum MarkdownHeaderLevel: Int {
    case h1 = 1, h2, h3, h4, h5, h6
}

/// Markdown Header render style
///
/// - `setex`: Setext-style headers are “underlined” using equal signs (for first-level headers)
///          and dashes (for second-level headers). For example:
///
///              This is a Setex H1 Header
///              =========================
///
///              This is a Setex H2 Header
///              -------------------------
///
/// - `atx`: Atx-style headers use 1-6 hash characters at the start of the line, corresponding
///        to header levels 1-6. For example:
///
///            # This is an Atx H1 Header
///
///            ## This is an Atx H2 Header
///
///            ###### This is a closed Atx H6 Header ######
///
public enum MarkdownHeaderStyle {
    case setex, atx
}
