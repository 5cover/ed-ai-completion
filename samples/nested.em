# Nested code blocks

Basically my teck stack

```sql
  basically my database.
  ```php
    my backend
    ```html
      the core of the web
      ```css
        useless, so used for everything
        ```js
          useful, unfortunetely.
        ```
      ```
    ```
  ```
```

## Syntax rules

When given a code block of *N* (&ge; 3) backticks

The end marker is the next line that contains only *N* backticks. No *leading* or trailing whitespace, no other characters.

Lines are left trimmed by the least amount of unique whitespace characters each one starts with. This means if every line in the code block:

- starts with 2 spaces: remove 2 leading spaces on each line.
- starts with 1 spaces, except one which starts with 1 space: remove 1 leading space on each line.
- starts with 4 spaces, except 1 which starts with 1 space and a hard tab:  remove 1 leading space on each line.

4+ backticks (like in Markdown) are still supported (if you have long lines and the added indentation is causing you problems), but the indented style is recommended.