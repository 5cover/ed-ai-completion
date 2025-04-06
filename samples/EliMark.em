#!/bin/env -s elimark 'This is a shebang line. In a markup language. Try and stop me'

# EliMark: The Living Markup Language

Welcome to **EliMark**—a fresh take on text formatting that embraces simplicity while giving you the power to express complex ideas when needed. EliMark is designed for writers, developers, and thinkers who want a clean, intuitive language for everyday notes, technical documentation, and creative expression—without being held back by the limitations of traditional Markdown.

---

## Table of Contents

1. [Philosophy and Goals](#philosophy-and-goals)
2. [Key Features](#key-features)
3. [Deviations from Markdown](#deviations-from-markdown)
4. [EliMark Syntax Guide](#elimark-syntax-guide)
    - [Basic Elements](#basic-elements)
    - [Text Formatting](#text-formatting)
    - [Inline Math and LaTeX](#inline-math-and-latex)
    - [Code Blocks](#code-blocks)
    - [Lists](#lists)
    - [Images with Explicit Sizing](#images-with-explicit-sizing)
    - [Tables with Multiline Content and Captions](#tables-with-multiline-content-and-captions)
    - [Line Breaks](#line-breaks)
    - [Additional Enhancements](#additional-enhancements)
5. [Examples](#examples)
6. [Future Directions](#future-directions)
7. [Conclusion](#conclusion)

---

## Philosophy and Goals

**EliMark** is built on a simple yet profound idea: _keep 95% of your writing clean and uncluttered while providing a robust set of tools for the moments when you need something extra_. It’s inspired by Markdown’s minimalism but addresses its shortcomings by:

- **Unobtrusive Core:** For everyday writing, EliMark feels as light and natural as Markdown.
- **Extensible Complexity:** When complex formatting is required, EliMark steps up with clear, explicit syntax that doesn’t feel like an afterthought.
- **Consistency:** Every element in EliMark is designed to be self-contained and context-independent. You can paste any snippet anywhere in an EliMark document, and it will render correctly.
- **Expressiveness:** Beyond the basics, EliMark allows you to include inline LaTeX for math, explicit image sizing, and even custom formatting like underlining text.
- **Portability:** While EliMark commonly parses to HTML, its definition is independent of any backend. Parsers can target LaTeX, PDF, or other formats without relying on embedded HTML, CSS, or JavaScript.

---

## Key Features

- **Simple Core Syntax:** Minimal and clear for 95% of your needs.
- **Inline LaTeX:** Write inline mathematical expressions using LaTeX for beautiful and accurate typesetting.
- **Single, Unambiguous List Marker:** Only one character is used for list items, ensuring consistency.
- **Flexible Content in Lists:** Insert any type of content—text, images, even tables—directly within lists.
- **Enhanced Tables:** Support for multiline content within cells without resorting to `<br>` tags, plus table captions to add context.
- **Explicit Image Sizing:** Directly specify dimensions for images within your document.
- **Preserved Line Breaks:** Line breaks are rendered exactly as written—no unexpected collapses.
- **New Text Decorations:** Besides the usual *emphasis*, **strong emphasis**, and ~~deletion~~, EliMark introduces a clear syntax for insertion (underline) to complement deletion.
- **Self-contained and Modular:** Every fragment of EliMark is independent, ensuring maximum portability and ease of parsing.

## Deviations from Markdown

While drawing inspiration from Markdown, EliMark intentionally diverges to solve common pain points:

- **No Indented Code Blocks:** Use only backticks for code formatting.
- **Explicit Over Implicit:** Every feature, like image sizes or table captions, must be explicitly declared.
- **Uniform List Syntax:** Only one list marker is allowed—removing the ambiguity between `-`, `*`, or `+`.
- **Robust Table Content:** Unlike Markdown, where inline HTML is often needed for rich tables, EliMark natively supports complex, multiline cell content.
- **Preserved Whitespace:** Line breaks are never collapsed, ensuring that your formatting remains as you intend without extra backslashes.
- **Consistent Decoration:** Every formatting option (e.g., for underlining) has a single, clear syntax that doesn’t rely on contextual guessing.

## EliMark Syntax Guide

Below is a detailed guide to using EliMark. Each section explains the syntax and provides examples to help both beginners and seasoned users.

### Definitions

Term|Definition
-|-
Leading whitespace|Leading whitespace refers to space characters at the start of a line. Tabs are not supported unless explicitly stated.

### Basic Elements

#### Shebang line

> When your markup language documentation starts with a shebang line, you know you're in for a treat!

The first line of a EliMark document may be a shebang, in which case it is ignored.

#### Paragraphs

Simply write text. A blank line separates paragraphs.

```em
This is a paragraph in EliMark.

This is another paragraph.
```

#### Headings

Use one or more `#` characters (up to 6) at the start of a line to indicate headings.  
*Note:* There is only one style per heading level.

```em
# Heading Level 1
## Heading Level 2
### Heading Level 3
```

### Text Formatting

#### Emphasis

- *Italic:* Wrap text in single asterisks: `*italic*`
- **Bold:** Wrap text in double asterisks: `**bold**`
- ***Bold & Italic:*** Use triple asterisks: `***bold & italic***`

#### Deletion (Strikethrough)

Use double tildes: `~~strikethrough~~`: ~~strikethrough~~

#### Insertion (Underline)

New syntax for underline: wrap text in double underscores: `__underline__`: __underline__

#### Highlighting

Highlight text by enclosing in `#`: `not #highlighted# not`: not #highlighted# not

#### Superscripts and subscripts

Like in LaTeX, use a `^` (for superscripts) or `_` (for subscripts) followed by either:

- a word (until the first horizontal space character or the end of the current formatting block):
    - `abc^def`: abc^def
    - `*abc_de*f: *abc^de*f &rarr; ends at the the `e`, not the `f`. The `*` ends the emphasis normally.
- or an explicit braced group:
    - `abc_{de}f`: abc_{de}f
    - `*abc^{d*f}`: *abc^{d*f} &rarr; the emphasis isn't parsed, since the ending `*` is in a a braced group.
  

#### Inline LaTeX for Math

Use `$...$` for inline math.

```em
The quadratic formula is $x = \frac{-b \pm \sqrt{b^2-4ac}}{2a}$.
```

#### Abbreviations

Inform the reader what an abbreviation or acronym means: `[SQL<Structured Query Language]`: [SQL<Structured Query Language]


### Code Blocks

#### Inline Code

Wrap code with single backticks: `` `code` ``

#### Multiline Code Blocks

Use triple backticks before and after the code block. Optionally, specify the language after the opening backticks for syntax highlighting.

```python
print('Hello from EliMark!')
```

You can nest code blocks using fences of **3 or more backticks** and increasing leading whitespace. The parser trims the **least common leading leading whitespace** from all lines inside a block, allowing you to embed multi-language examples cleanly without excessive backtick counting. Ending fences must appear on their own line with no leading or trailing characters.

```em
  ```python
  def hello_world():
      print("Hello, EliMark!")
  ```
```

#### Keyboard Input

Write keyboard keys using the syntax ``[`Key`]``. This visually indicates a keyboard key, like  This is useful for indicating keyboard input like [`Ctrl`], [`Esc`], or [`Enter`].

#### Sample output

A special language (`$`) that maps to HTML `<samp>` element semantics. May be

```sh
ls
```

```$
bin
boot
cdrom
dev
etc
```

### Lists

> In Elimark, list syntax can be simply described as headers with block content and leading whitepace.

4 list segment styles are available.

- 1 &rarr; numbered list.
  Actual values are irrelevant and computed automatically.
- * &rarr; bullet list
- - &rarr; dashed list
- [] &rarr; checkmark (not selected)
- [x] &rarr; or [X] checkmark (selected)
- Latin letter a-z &rarr; lowercase alphabetical. Continues with aa, ab, ac... after z.
- Latin letter A-Z &rarr; uppercase alphabetical. Continues with AA, AB, AC... after Z.

Segments may be separated by a dots. Dot separators are required for letters and numbers in order to disambiguate.

For each item, the last segment must be followed by an leading whitespace character.

Each list style can be combined and nested freely.

Multiple list styles can cohabit at the same level.

- Project: FlexiC
-- Language features
--- Syntax errors are treated as comments
--- Transpiles to stdc
--- Supports polyglot embedding
-- Parser design
--- Recursive descent
--- Error recovery via comments
--- Example pseudocode:
    ```c
    if (!match(expected)) {
        commentOut(token);
    }
    ```
-- Goals:
--- Simplicity
--- Speed
--- Humor
1. Project: EliMark
1.1. Philosophy
1.1.* 95% clean, 5% powerful
1.1.* No HTML pollution
1.1.3 A wild numbered list item appeared
1.2 Features
1.2.- Inline LaTex
1.2.- Multiline table
1.2.- Explicit image sizing
1.2.- Example table row
      ```
       | Feature       | Description                       |
       |---------------|-----------------------------------|
       | Tables        | Support rich, nested content      |
      ```
1.3 Future directions
1.3.a Extensible syntax engine
1.3.b Extensible syntax engine
1.3.c Extensible syntax engine

## Rich content in lists

Lists in EliMark support any block-level content, including images, code blocks, and even tables.

To be recognized as part of the list, addional content lines of an item must be be padded by the same amount of leading whitespace characters as the first line.

- Item
  Additional content 1
  Additional content 2
- Another item
  ```javascript
  console.log("Hello from within a list!");
  ```
- Many, many items
  ![Alt Text](image.png)(w300.h200)

## Difference between multi-level list and nested lists

While "block-nested" lists that create a new list as block content inside an item:

```em
* a
  * 1
* b
  * 3
```

Are conceptually similar to regular nested lists:

```em
* a
** 1
* b
** 3
```

The latter is more compact and easy to maintain, especially for large, deep lists. So both syntaxes are allowed.

### Images with Explicit Sizing

Explicit sizing options are optionally appended in curly braces.
Width (w) and Height (h) don't have to be both specified.
Units are optional, defaulting to `px` if omitted.
The EliMark standard only requires the `px` unit, though implementations are encouraged to add (and *document*) additional units.

```em
![Description](url/to/image.png)(w400.h300px)
![Description](url/to/image.png)(w400px)
```

### Tables with Multiline Content and Captions

#### Table Caption

A single line above the column headers. Leading leading whitespace is ignored, meaning the caption can be safely centered.

```em
  Monthly Sales Data
Quarter|Gross profit
-------|------------
Q1     |  ...
```

#### Table Structure:

Use vertical bars `|` to separate columns. Unlike Markdown, each cell can contain multiline content. Newlines within a cell are preserved if you use an equals sign `=` instead of the traditonal dash.

```em
| Name        | Description                    | Price |
|=============|================================|=======|
| Widget A    | A versatile widget.            | $10   |
| Widget B    | An advanced widget with:
              - feature 1
              - feature 2
              Enjoys high performance.      | $15   |
| Widget C    | A compact widget.
              Suitable for small tasks.     | $8    |
```

### Whitespace and line Breaks

In EliMark, every newline is significant. There is no automatic collapsing into a single space. Consider using a line-wrapping editor of this is causing a problem with long lines.

On the other hand, leading whitespace characters are collapsed, like in HTML.

```em
This line is preserved.
This line starts on a new line.
```

### Additional Enhancements

#### Escaping

To make sure a character is always interpreted literally, precede it by a backslash `\`. This is valid even for characters with no special meaning. This rule only applies outside of code blocks and inline codes (to make copy pasting code easier)

#### HTML entities

While EliMark is decoupled from HTML, HTML5 entities provide a good, intuitive syntax to express special characters.

`&rarr;`: &rarr;

> This isn't HTML. It just happens to have the same *syntax* as HTML.
  
Note: HTML entities inside inline codes and code blocks are not expanded. Use the actual character instead.

EliMark interprets entities purely as character substitutions, not as semantic markers. &copy; becomes ©, but it has no special meaning to a parser or renderer.

### Horizontal rules

Use three or more hyphens on a new line to create a horizontal rule.

```em
---
```

---

### Blockquotes

Use the greater-than symbol `>` at the beginning of a line. For nested blockquotes, use additional `>` characters.

```em
> This is a blockquote.
>> Nested blockquote.
```

## Examples

### Example 1: A Simple Note

```elimark
# Meeting Notes

Today I discussed the upcoming project launch. I emphasized the need for clarity in our documentation.

- Key Points:
  - *Simplicity* is key.
  - **Bold decisions** are required.
  - And don't forget: math matters. The growth can be modeled by $G(t)=G_0e^{rt}$.

> Remember: “We are in a process of __becoming__.”
```

### Example 2: A Rich Table

```elimark
                            Project Roadmap

| Phase       | Description                                   | Deadline   |
|=============|===============================================|===========|
| **Planning**| Brainstorm ideas, gather requirements, and draft initial designs. | January 2026 |
| **Development**| Build the core functionality:
- Set up backend in Rust.
- Create frontend with SolidJS.
- Integrate inline LaTeX support. | March 2026 |
| **Launch**  | Final testing, bug fixes, and deployment.   | June 2026 |
```

### Example 3: A Code Block with Inline Math

```elimark
  # Example Function

  ```python
  def calculate_growth(G0, r, t):
      """
      Calculates growth based on the formula:
      G(t) = G0 * exp(r * t)
      """
      from math import exp
      return G0 * exp(r * t)
  ```

  The result for G(5) when G0 = 100 and r = 0.05 is approximately $100e^{0.25}$.
```

## Future Directions

EliMark is a living language. Its community and usage will inspire further refinements. Future enhancements might include:

- **Enhanced Extensibility:** A modular extension system that allows custom syntax elements without breaking core consistency.
- **Multiple Output Formats:** Native support for exporting to LaTeX, PDF, and even interactive web presentations without relying on HTML as the source.

### Attribute system

Give every element a unified attribute syntax. These can be hooked into through the parser to support custom feature, such as:

- element classes
- specific styles
- DSL extensions of EliMark
- markup extensions
- dynamic and evolving markup that changes based on parser configuration

Why? Because EliMark loves you.
EliMark also loves seeing you suffer.

### `elimarkfmt`

Canonical formatter.

## Conclusion

**EliMark** is more than just a markup language—it’s a commitment to clarity, consistency, and creative expression. It provides a simple core that handles 95% of your everyday writing needs while opening doors to advanced formatting when you need to push beyond the basics.

Whether you’re jotting down quick notes, drafting complex documentation, or exploring creative writing, EliMark grows with you—maintaining the balance between simplicity and power. Welcome to a new way of thinking about text.

---

*We hope you enjoy using EliMark as much as it was envisioned—an intuitive, elegant medium for every thought you wish to capture.*

