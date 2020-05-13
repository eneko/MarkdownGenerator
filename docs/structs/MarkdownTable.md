**STRUCT**

# `MarkdownTable`

> Render a two dimensional Markdown table.
>
>     |    | Name   | Department |
>     | -- | ------ | ---------- |
>     | 🍏 | Apple  | Fruits     |
>     | 🍊 | Orange | Fruits     |
>     | 🥖 | Bread  | Bakery     |
>
> *Notes*:
> - Markdown tables are not supported by all Markdown readers.
> - Table headers are required.
> - Table cells cannot contain multiple lines. New line characters are replaced by a space.

## Properties
### `markdown`

> Generated Markdown output

## Methods
### `init(headers:data:)`

> MarkdownTable initializer
>
> - Parameters:
>   - headers: List of table header titles.
>   - data: Two-dimensional `String` array with the table content. Rows are defined by
>        the outer array, columns are defined by the inner arrays.
>
>        An array of rows, each row containing an array of columns. All rows should contain the same
>        number of columns as the headers array, to avoid formatting issues.
