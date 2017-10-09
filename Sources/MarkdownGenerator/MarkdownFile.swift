//
//  MarkdownFile.swift
//  MarkdownGenerator
//
//  Created by Eneko Alonso on 10/8/17.
//

import Foundation

/// Helper structure to write Markdown files to disk.
public struct MarkdownFile {

    /// Name of the Markdown file, without extension.
    public let filename: String
    
    /// Path where the Markdown file will be written to.
    ///
    /// Path can be absolute or relative to the working directory. It should
    /// not contain a trailing slash, nor the name of the file to write.
    public let basePath: String
    
    /// MarkdownConvertible entity that will be rendered
    /// as the Markdown content of the file. Can be an `Array`.
    public var content: MarkdownConvertible

    /// Computed property containing the file path (<basePath>/<filename>.md)
    public var filePath: String {
        return "\(basePath)/\(filename).md"
    }
    
    /// Generate and write the Markdown file to disk.
    ///
    /// - Will override the file if already existing, or create a new one.
    /// - Will create the path directory structure if it does not exists.
    ///
    /// - Throws: Throws an exception if the file could not be written to disk, or
    ///           if the path could not be created if it didn't exist.
    public func write() throws {
        try createDirectory(path: basePath)
        try content.markdown.write(toFile: filePath, atomically: true, encoding: .utf8)
    }

    private func createDirectory(path: String) throws {
        var isDir: ObjCBool = false
        if FileManager.default.fileExists(atPath: path, isDirectory: &isDir) == false {
            try FileManager.default.createDirectory(atPath: path, withIntermediateDirectories: true, attributes: nil)
        }
    }
}
