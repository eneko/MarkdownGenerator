**STRUCT**

# `MarkdownList`

> Render a list of elements in Markdown format
>
> Unordered lists:
>
>     - One item
>     - Another item that expands to multiple
>       lines.
>         - A nested item.
>             - Third-level.
>     - Back to first-level.
>
> Ordered lists:
>
>     1. First item
>     1. Second item
>         1. Nested item (second-level)
>     1. Back to first-level

## Properties
### `items`

> List of items to be converted to a list.

### `markdown`

> Generated Markdown output

## Methods
### `init(items:style:)`

> MarkdownList initializer
>
> - Parameter items: List of items to be converted to a list.
