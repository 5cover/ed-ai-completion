# ¤ (aka. currency-sign): AI-augmented `ed`

`¤` is a GNU `ed` plugin for AI completions, using Mistral model Codestral.

## Usage instructions

Add `¤` to your `$PATH` (for example, in `~/.local/bin/`) to serve as an AI autocompletion helper for `ed`. It uses your Mistral API key to query Codestral and then&mdash;in one swoop&mdash;injects the AI’s suggestion into the file you’re editing.

Make sure you have these prerequisites:

- An environment variable `MISTRAL_API_KEY` set with your key.
- `curl`, `jq`, and `ed` installed.
- Your file already saved on disk (since the script reads it).

Place the following code in a file called **¤.sh** and make it executable:

## How to Use It in Your ed Session

1. **Open your file in ed:**

   ```bash
   ed hello.c
   ```

2. **(Optionally) Edit your file and save your changes:**

   ```ed
   a
   // Your code modifications...
   .
   w
   ```

3. **Invoke the AI helper:**

   ```ed
   !¤ complete hello.c
   ```

   This runs the script, which sends your file’s content to Codestral and then inserts the AI’s suggestion at the end of the file.

4. **Review the changes:**

   ```ed
   1,$p
   ```

5. **Exit ed:**

   ```ed
   q
   ```

Now you’ve got an integrated, minimalist AI autocompletion tool built right into `ed`&mdash;bridging classic Unix editing with modern AI magic!
