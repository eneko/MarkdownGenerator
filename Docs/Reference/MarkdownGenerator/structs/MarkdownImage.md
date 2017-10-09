**STRUCT**
# `MarkdownImage`

**Contents**
- [Properties](#properties)
  - `url`
  - `altText`
  - `markdown`
- [Methods](#methods)
  - `init(url:altText:)`

**Declaration**
```swift
public struct MarkdownImage: MarkdownConvertible
```

**Infered Type**
```swift
MarkdownImage.Type
```

Render an HTML image in Markdown format

    MarkdownImage(url: "http://example.com/image.jpg", altText: "SourceDocs Header").markdown

Would render as:

    ![SourceDocs Header](http://example.com/image.jpg)

--------------------

## Properties
### `url`

**Declaration**
```swift
public let url: String
```

**Infered Type**
```swift
String
```

URL where the image is located. Can be absolute or relative.

### `altText`

**Declaration**
```swift
public let altText: String
```

**Infered Type**
```swift
String
```

Alternate text to display on non-graphic browsers or to be used by screen readers.

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
### `init(url:altText:)`

**Declaration**
```swift
public init(url: String, altText: String = "")
```

**Infered Type**
```swift
(MarkdownImage.Type) -> (String, String) -> MarkdownImage
```

MarkdownImage initializer

- Parameters:
  - url: URL where the image is located. Can be absolute or relative.
  - altText: Alternate text to display on non-graphic browsers or to be used by screen readers.

#### Parameters
| Name | Description |
| ---- | ----------- |
| `url` | URL where the image is located. Can be absolute or relative. |
| `altText` | Alternate text to display on non-graphic browsers or to be used by screen readers. |