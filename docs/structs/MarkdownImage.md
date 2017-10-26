**STRUCT**

# `MarkdownImage`

**Contents**

- [Properties](#properties)
  - `url`
  - `altText`
  - `markdown`
- [Methods](#methods)
  - `init(url:altText:)`

```swift
public struct MarkdownImage: MarkdownConvertible
```

> Render an HTML image in Markdown format
>
>     MarkdownImage(url: "http://example.com/image.jpg", altText: "SourceDocs Header").markdown
>
> Would render as:
>
>     ![SourceDocs Header](http://example.com/image.jpg)

## Properties
<details><summary><code>url</code></summary>

```swift
public let url: String
```

> URL where the image is located. Can be absolute or relative.
</details>

<details><summary><code>altText</code></summary>

```swift
public let altText: String
```

> Alternate text to display on non-graphic browsers or to be used by screen readers.
</details>

<details><summary><code>markdown</code></summary>

```swift
public var markdown: String
```

> Generated Markdown output
</details>

## Methods
<details><summary><code>init(url:altText:)</code></summary>

```swift
public init(url: String, altText: String = "")
```

> MarkdownImage initializer
>
> - Parameters:
>   - url: URL where the image is located. Can be absolute or relative.
>   - altText: Alternate text to display on non-graphic browsers or to be used by screen readers.

#### Parameters

| Name | Description |
| ---- | ----------- |
| url | URL where the image is located. Can be absolute or relative. |
| altText | Alternate text to display on non-graphic browsers or to be used by screen readers. |
</details>