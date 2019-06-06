**STRUCT**

# `MarkdownLink`

```swift
public struct MarkdownLink: MarkdownConvertible
```

> Render an HTML link in Markdown format
>
>     MarkdownLink(text: "Google", url: "https://example.com").markdown
>
> Would render as:
>
>     [Google](https://example.com)

## Properties
### `text`

```swift
public let text: String
```

> Text to display as hyper-linked.

### `url`

```swift
public let url: String
```

> Link URL, can be absolute, relative, or #local.

### `markdown`

```swift
public var markdown: String
```

> Generated Markdown output

## Methods
### `init(text:url:)`

```swift
public init(text: String, url: String)
```

> MarkdownLink initializer
>
> - Parameters:
>   - text: Text to display as hyper-linked.
>   - url: Link URL, can be absolute, relative, or #local.

#### Parameters

| Name | Description |
| ---- | ----------- |
| text | Text to display as hyper-linked. |
| url | Link URL, can be absolute, relative, or #local. |