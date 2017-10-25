**STRUCT**
# `MarkdownHeader`

**Contents**
- [Properties](#properties)
  - `markdown`
- [Methods](#methods)
  - `init(title:level:style:close:)`

```swift
public struct MarkdownHeader: MarkdownConvertible
```

> Renders a Markdown Header
>
> Markdown supports two styles of headers, Setext and atx.
>
> Setext-style headers are “underlined” using equal signs (for first-level headers)
> and dashes (for second-level headers). For example:
>
>     This is an H1
>     =============
>
>     This is an H2
>     -------------
>
> Atx-style headers use 1-6 hash characters at the start of the line, corresponding
> to HTML header levels 1-6. For example:
>
>     # This is an H1
>
>     ## This is an H2
>
>     ###### This is an H6
>
> Atx-style headers can be closed (this is purely cosmetic):
>
>     # This is an H1 #
>
>     ## This is an H2 ##
>
>     ### This is an H3 ###

## Properties
### `markdown`

```swift
public var markdown: String
```

> Generated Markdown output

## Methods
### `init(title:level:style:close:)`

```swift
public init(title: String, level: MarkdownHeaderLevel = .h1, style: MarkdownHeaderStyle = .atx,
                close: Bool = false)
```

> MarkdownHeader initializer.
>
> - Parameters:
>   - title: Title of the header element
>   - level: Header level (`h1`, `h2`... `h6`)
>   - style: Header style: `setex` (underlined) or `atx` ('#') (defaults to `atx`).
>            Setex format is only available for first-level (using equal signs) and
>            second-level headers (using dashes).
>   - close: Close `atx` style headers (defaults to `false`). When false, headers
>            only include the '#' prefix. When `true`, headers also include the
>            trailing '#' suffix:
>
>            ### Third-level Header ###
>
> - SeeAlso: MarkdownHeaderLevel, MarkdownHeaderStyle

#### Parameters

| Name | Description |
| ---- | ----------- |
| title | Title of the header element |
| level | Header level (`h1`, `h2`… `h6`) |
| style | Header style: `setex` (underlined) or `atx` (’#’) (defaults to `atx`). Setex format is only available for first-level (using equal signs) and second-level headers (using dashes). |
| close | Close `atx` style headers (defaults to `false`). When false, headers only include the ‘#’ prefix. When `true`, headers also include the trailing ‘#’ suffix: |
