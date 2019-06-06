# MarkdownGenerator


![Release](https://img.shields.io/github/release/eneko/markdowngenerator.svg)
![Swift 4.0+](https://img.shields.io/badge/Swift-4.0+-orange.svg)
[![Build Status](https://travis-ci.org/eneko/MarkdownGenerator.svg?branch=master)](https://travis-ci.org/eneko/MarkdownGenerator)
[![codecov](https://codecov.io/gh/eneko/MarkdownGenerator/branch/master/graph/badge.svg)](https://codecov.io/gh/eneko/MarkdownGenerator)
[![Swift Package Manager Compatible](https://img.shields.io/badge/spm-compatible-brightgreen.svg)](https://swift.org/package-manager)
![Linux Compatible](https://img.shields.io/badge/linux-compatible%20🐧-brightgreen.svg)

A small Swift library to generate Markdown documents.

**Features**
- ✅ Easily generate Markdown from structured data
- ✅ Extendible: make your classes and structs conform to `MarkdownConvertible`
- ✅ Swift Package Manager compatible
- ✅ Linux compatible 🐧


## MarkdownConvertible
Types conforming to the `MarkdownConvertible` protocol can be rendered as a
markdown string, by implementing the `.markdown` computed property.

Out of the box, `MarkdownGenerator` provides the following Markdown elements:

- Unordered lists
- Ordered lists
- Tables
- Block-quotes
- Code Blocks
- Collapsible Blocks
- Images
- Links
- Headings

Please take a look at the following examples, or read the [reference documentation](/docs).

### Lists
List can be nested to any levels and contain single or multi-line items. Lists can be ordered, unordered, or mixed.

```swift
let list = MarkdownList(items: ["🍏", "🍌", "🍊", "🍇"])
print(list.markdown)
```

Generates the following output:

    -   🍏
    -   🍌
    -   🍊
    -   🍇

Which renders as:

-   🍏
-   🍌
-   🍊
-   🍇


### Tables
While Markdown didn't have support for tables originally, most modern Markdown readers (including GitHub) properly render tables nowadays.

```swift
let data: [[String]] = [
    ["🍏", "Apple", "Fruits"],
    ["🍊", "Orange", "Fruits"],
    ["🥖", "Bread", "Bakery"],
]
let table = MarkdownTable(headers: ["", "Name", "Department"], data: data)
print(table.markdown)
```

Generates the following output:

    |    | Name   | Department |
    | -- | ------ | ---------- |
    | 🍏 | Apple  | Fruits     |
    | 🍊 | Orange | Fruits     |
    | 🥖 | Bread  | Bakery     |

Which renders as:

|    | Name   | Department |
| -- | ------ | ---------- |
| 🍏 | Apple  | Fruits     |
| 🍊 | Orange | Fruits     |
| 🥖 | Bread  | Bakery     |

Pretty tables 🎉

### Blockquotes

Any `MarkdownConvertible` content (including `String`) can be easily `.blockquoted`.

```swift
let input = """
## This is a header.

1.   This is the first list item.
2.   This is the second list item.

Here's some example code:

    return shell_exec("echo $input | $markdown_script");

> This is a quote.
"""

print(input.blockquoted.markdown)
```

Generates the following output:

    > ## This is a header.
    >
    > 1.   This is the first list item.
    > 2.   This is the second list item.
    >
    > Here's some example code:
    >
    >     return shell_exec("echo $input | $markdown_script");
    >
    > > This is a quote.

Which renders as:

> ## This is a header.
>
> 1.   This is the first list item.
> 2.   This is the second list item.
>
> Here's some example code:
>
>     return shell_exec("echo $input | $markdown_script");
>
> > This is a quote.


### Collapsible Blocks
Collapsible blocks look great on GitHub and other Markdown viewers. Great way to provide detailed content without cluttering the output.

```swift
let details: [MarkdownConvertible] = [
    MarkdownHeader(title: "Title"),
    MarkdownList(items: ["🐶", "🐱", "🦊"]),
    MarkdownTable(headers: ["Name", "Count"], data: [["Dog", "1"], ["Cat", "2"]]),
    MarkdownCodeBlock(code: "let foo = Bar()", style: .backticks(language: "swift"))
]

print(MarkdownCollapsibleSection(summary: "This is cool stuff", details: details).markdown)
```

Generates the following output:

    <details><summary>This is cool stuff</summary>

    # Title

    -   🐶
    -   🐱
    -   🦊

    | Name | Count |
    | ---- | ----- |
    | Dog  | 1     |
    | Cat  | 2     |

    ```swift
    let foo = Bar()
    ```
    </details>

Which renders as (click to expand):

<details><summary>This is cool stuff</summary>

# Title

-   🐶
-   🐱
-   🦊

| Name | Count |
| ---- | ----- |
| Dog  | 1     |
| Cat  | 2     |

```swift
let foo = Bar()
```
</details>


## Contact
Follow and/or contact me on Twitter at [@eneko](https://www.twitter.com/eneko).


## Contributions
If you find an issue, just [open a ticket](https://github.com/eneko/MarkdownGenerator/issues/new)
on it. Pull requests are warmly welcome as well.


## License
MarkdownGenerator is licensed under the Apache 2.0 license. See [LICENSE](/LICENSE) for more info.
