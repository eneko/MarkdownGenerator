**STRUCT**
# `MarkdownLink`

**Contents**
- [Properties](#properties)
  - `text`
  - `url`
  - `markdown`
- [Methods](#methods)
  - `init(text:url:)`

**Declaration**
```swift
public struct MarkdownLink: MarkdownConvertible
```

**Infered Type**
```swift
MarkdownLink.Type
```

Render an HTML link in Markdown format

    MarkdownLink(text: "Google", url: "https://example.com").markdown

Would render as:

    [Google](https://example.com)

--------------------

## Properties
### `text`

**Declaration**
```swift
public let text: String
```

**Infered Type**
```swift
String
```

Text to display as hyper-linked.

### `url`

**Declaration**
```swift
public let url: String
```

**Infered Type**
```swift
String
```

Link URL, can be absolute, relative, or #local.

### `markdown`

**Declaration**
```swift
public var markdown: String
```

**Infered Type**
```swift
String
```

Generated Markdown output

--------------------

## Methods
### `init(text:url:)`

**Declaration**
```swift
public init(text: String, url: String)
```

**Infered Type**
```swift
(MarkdownLink.Type) -> (String, String) -> MarkdownLink
```

MarkdownLink initializer

- Parameters:
  - text: Text to display as hyper-linked.
  - url: Link URL, can be absolute, relative, or #local.

#### Parameters
| Name | Description |
| ---- | ----------- |
| `text` | Text to display as hyper-linked. |
| `url` | Link URL, can be absolute, relative, or #local. |