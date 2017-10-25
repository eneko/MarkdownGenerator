**STRUCT**
# `MarkdownBlockquotes`

**Declaration**
```swift
public struct MarkdownBlockquotes: MarkdownConvertible
```

> Render Markdown Blockquotes
>
> Markdown uses email-style > characters for blockquoting.
>
> > This is a blockquote with two paragraphs. Lorem ipsum dolor sit amet,
> > consectetuer adipiscing elit. Aliquam hendrerit mi posuere lectus.
> > Vestibulum enim wisi, viverra nec, fringilla in, laoreet vitae, risus.
> >
> > Donec sit amet nisl. Aliquam semper ipsum sit amet velit. Suspendisse
> > id sem consectetuer libero luctus adipiscing.

## Properties
<details><summary><code>markdown</code></summary>

**Declaration**
```swift
public var markdown: String
```

> Generated Markdown output
</details>

## Methods
<details><summary><code>init(content:)</code></summary>

**Declaration**
```swift
public init(content: MarkdownConvertible)
```

> MarkdownBlockquotes initializer
>
> - Parameter content: Content to be block-quoted with '> '

#### Parameters
| Name | Description |
| ---- | ----------- |
| content | Content to be block-quoted with ’> ’ |
</details>