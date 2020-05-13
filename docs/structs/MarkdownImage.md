**STRUCT**

# `MarkdownImage`

> Render an HTML image in Markdown format
>
>     MarkdownImage(url: "http://example.com/image.jpg", altText: "SourceDocs Header").markdown
>
> Would render as:
>
>     ![SourceDocs Header](http://example.com/image.jpg)

## Properties
### `url`

> URL where the image is located. Can be absolute or relative.

### `altText`

> Alternate text to display on non-graphic browsers or to be used by screen readers.

### `markdown`

> Generated Markdown output

## Methods
### `init(url:altText:)`

> MarkdownImage initializer
>
> - Parameters:
>   - url: URL where the image is located. Can be absolute or relative.
>   - altText: Alternate text to display on non-graphic browsers or to be used by screen readers.
