**STRUCT**

# `MarkdownLink`

**Contents**

- [Properties](#properties)
  - `text`
  - `url`
  - `markdown`
- [Methods](#methods)
  - `init(text:url:)`

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
<details><summary><code>text</code></summary>

```swift
public let text: String
```

> Text to display as hyper-linked.
</details>

<details><summary><code>url</code></summary>

```swift
public let url: String
```

> Link URL, can be absolute, relative, or #local.
</details>

<details><summary><code>markdown</code></summary>

```swift
public var markdown: String
```

> Generated Markdown output
</details>

## Methods
<details><summary><code>init(text:url:)</code></summary>

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
</details>