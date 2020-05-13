**STRUCT**

# `MarkdownLink`

> Render an HTML link in Markdown format
>
>     MarkdownLink(text: "Google", url: "https://example.com").markdown
>
> Would render as:
>
>     [Google](https://example.com)

## Properties
### `text`

> Text to display as hyper-linked.

### `url`

> Link URL, can be absolute, relative, or #local.

### `markdown`

> Generated Markdown output

## Methods
### `init(text:url:)`

> MarkdownLink initializer
>
> - Parameters:
>   - text: Text to display as hyper-linked.
>   - url: Link URL, can be absolute, relative, or #local.
