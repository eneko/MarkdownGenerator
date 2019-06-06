**STRUCT**

# `MarkdownCollapsibleSection`

```swift
public struct MarkdownCollapsibleSection: MarkdownConvertible
```

> Collapsible blocks are a great way to hide large portions of content
> that, while valuable to the reader, would result on a lot of noise.
>
> Collapsible blocks work well in most Markdown readers, including
> GitHub.com and rendered GitHub Pages. However, because they rely on
> HTML tags, they will make the _raw_ markdown output harder to read.
>
> ```html
> <details><summary>Block Title</summary>
>
>     Block details.
>
> </details>
> ```

## Properties
### `markdown`

```swift
public var markdown: String
```

> Generated Markdown output

## Methods
### `init(summary:details:)`

```swift
public init(summary: String, details: MarkdownConvertible)
```

> MarkdownCollapsibleSection initializer
>
> - Parameters:
>   - summary: Plain text or HTML string containing the block title.
>   - details: Markdown convertible elements to include in the collapsible block.

#### Parameters

| Name | Description |
| ---- | ----------- |
| summary | Plain text or HTML string containing the block title. |
| details | Markdown convertible elements to include in the collapsible block. |