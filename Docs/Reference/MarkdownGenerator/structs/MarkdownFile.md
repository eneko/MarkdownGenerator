**STRUCT**
# `MarkdownFile`

**Contents**
- [Properties](#properties)
  - `filename`
  - `basePath`
  - `content`
  - `filePath`
- [Methods](#methods)
  - `init(filename:basePath:content:)`
  - `write()`

**Declaration**
```swift
public struct MarkdownFile
```



> Helper structure to write Markdown files to disk.

--------------------

## Properties
### `filename`

**Declaration**
```swift
public let filename: String
```



> Name of the Markdown file, without extension.

### `basePath`

**Declaration**
```swift
public let basePath: String
```



> Path where the Markdown file will be written to.
>
> Path can be absolute or relative to the working directory. It should
> not contain a trailing slash, nor the name of the file to write.
>
> Path will be created if it doesn't already exist in the system.

### `content`

**Declaration**
```swift
public var content: MarkdownConvertible
```



> MarkdownConvertible entity that will be rendered
> as the Markdown content of the file. Can be an `Array`.

### `filePath`

**Declaration**
```swift
public var filePath: String
```



> Computed property containing the file path (`<basePath>/<filename>.md`)

--------------------


## Methods
### `init(filename:basePath:content:)`

**Declaration**
```swift
public init(filename: String, basePath: String = "", content: MarkdownConvertible)
```



> MarkdownFile initializer
>
> - Parameters:
>   - filename: Name of the Markdown file, without extension.
>   - basePath: Path where the Markdown file will be written to.
>
>        Path can be absolute or relative to the working directory. It should
>        not contain a trailing slash, nor the name of the file to write.
>
>        Path will be created if it doesn't already exist in the system.
>
>   - content: MarkdownConvertible entity that will be rendered
>        as the Markdown content of the file. Can be an `Array`.

#### Parameters
| Name | Description |
| ---- | ----------- |
| filename | Name of the Markdown file, without extension. |
| basePath | Path where the Markdown file will be written to. Path can be absolute or relative to the working directory. It should not contain a trailing slash, nor the name of the file to write. Path will be created if it doesn’t already exist in the system. |
| content | MarkdownConvertible entity that will be rendered as the Markdown content of the file. Can be an `Array`. |

### `write()`

**Declaration**
```swift
public func write() throws
```



> Generate and write the Markdown file to disk.
>
> - Will override the file if already existing, or create a new one.
> - Will create the path directory structure if it does not exists.
>
> - Throws: Throws an exception if the file could not be written to disk, or
>           if the path could not be created.



--------------------
