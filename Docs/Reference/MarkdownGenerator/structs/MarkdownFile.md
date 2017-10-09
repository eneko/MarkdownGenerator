**STRUCT**
# `MarkdownFile`

**Declaration**
```swift
public struct MarkdownFile
```

**Infered Type**
```swift
MarkdownFile.Type
```

Helper structure to write Markdown files to disk.

--------------------

## Properties
### `filename`

**Declaration**
```swift
public let filename: String
```

**Infered Type**
```swift
String
```

Name of the Markdown file, without extension.

### `basePath`

**Declaration**
```swift
public let basePath: String
```

**Infered Type**
```swift
String
```

Path where the Markdown file will be written to.

Path can be absolute or relative to the working directory. It should
not contain a trailing slash, nor the name of the file to write.

### `content`

**Declaration**
```swift
public var content: MarkdownConvertible
```

**Infered Type**
```swift
MarkdownConvertible
```

MarkdownConvertible entity that will be rendered
as the Markdown content of the file. Can be an `Array`.

### `filePath`

**Declaration**
```swift
public var filePath: String
```

**Infered Type**
```swift
String
```

Computed property containing the file path (<basePath>/<filename>.md)

## Methods
### `write()`

**Declaration**
```swift
public func write() throws
```

**Infered Type**
```swift
(MarkdownFile) -> () throws -> ()
```

Generate and write the Markdown file to disk.

- Will override the file if already existing, or create a new one.
- Will create the path directory structure if it does not exists.

- Throws: Throws an exception if the file could not be written to disk, or
          if the path could not be created if it didn't exist.

