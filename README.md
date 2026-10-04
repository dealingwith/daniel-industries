# daniel-industries
[daniel.industries](https://daniel.industries)

## Local development

Use the dev config for faster local rebuilds:

```sh
bundle exec jekyll s --config _config.yml,_config.dev.yml
```

I'm currently using asdf:

```sh
asdf exec bundle exec jekyll s --config _config.yml,_config.dev.yml
```

or

```sh
asdf exec bundle exec jekyll s --incremental --config _config.yml,_config.dev.yml
```

I have a bash script aliased so I can

```
be jekyll s --incremental --config _config.yml,_config.dev.yml
```

`_config.dev.yml` skips the heaviest archive/category pages during normal local iteration.

## Build and deploy checks

Create a local `.env` for deploy credentials:

```sh
cp .env.example .env
```

Set `DEPLOY_SSH_USER` to the SSH user and host used by rsync deploys.
The Rakefile loads `.env` with the `dotenv` gem.

Production Rake builds use Jekyll incremental mode and preserve `_site/.jekyll-metadata` between deploys:

```sh
bundle exec jekyll build --incremental
```

Preview deploy changes without uploading or deleting remote files:

```sh
rake deploy:dry_run
```

Show itemized rsync changes during a normal deploy:

```sh
ITEMIZE=1 rake deploy
```

## Markdown companion

`markdown-companion.py` is a single-file Python 3.11+ terminal app that follows a saved Markdown draft and finds related material in your existing Hister index. The design is recorded in [MARKDOWN_COMPANION_PLAN.md](MARKDOWN_COMPANION_PLAN.md).

Run the setup and launch commands from `/home/danielmiller/code/daniel-industries`.

With [uv](https://docs.astral.sh/uv/pip/environments/) installed, create a Python 3.12 environment and install dependencies into it explicitly:

```sh
uv venv --python 3.12 .venv-markdown-companion
uv pip install --python .venv-markdown-companion/bin/python textual openai httpx
```

uv downloads Python 3.12 if it is not already available. The explicit `--python` path targets this named environment without needing shell activation.

Export your OpenAI API key, start your existing Hister server with semantic search enabled, then launch the companion:

```sh
export OPENAI_API_KEY='your-api-key'
uv run --no-project --python .venv-markdown-companion/bin/python markdown-companion.py --help
uv run --no-project --python .venv-markdown-companion/bin/python markdown-companion.py test.md --word-step 250
```

These [uv run](https://docs.astral.sh/uv/reference/cli/#uv-run) commands explicitly use the named environment's Python. `--no-project` skips Python project discovery for this standalone script. No shell activation is required. Expect `--help` to display CLI options and the launch command to open the word counter and search-results TUI.

Replace `test.md` with your draft path. If Hister requires a token, also export `HISTER_ACCESS_TOKEN`. The app reads environment variables; it does not load `.env`. Its default endpoint is `http://127.0.0.1:4433/search`. Override the full endpoint with `--hister-url`, the OpenAI model with `--model` (default `gpt-6-luna`), and results per query/displayed with `--limit` (default 10, maximum 50). The endpoint must end in `/search`; an optional deployment prefix is supported (for example `http://localhost:4433/hister/search`). Existing commands that specify `--hister-url .../mcp` should switch to `.../search`.

The default model uses `reasoning.effort=none` for this focused query-generation task and a 500-token output cap. Other model overrides use their model defaults; reasoning models may need a larger output budget than this utility provides. See [OpenAI's model documentation](https://developers.openai.com/api/docs/models/gpt-6-luna) for current capabilities and pricing.

The TUI shows the file, prose word count, next automatic search count, queries, ranked results, and a detail pane. After two seconds of stable saved content, it searches initially at 250 words and thereafter at each net increase of 250 words from the last successful search. A large initial draft gets one search, not one for each historical interval. Revisions and deletions alone do not trigger calls. Counts exclude front matter, fenced code, and link destinations using lightweight Markdown cleanup rather than a complete Markdown parser.

The watched post is excluded using its resolved local path and inferred Jekyll URL. URL matching ignores HTTP/HTTPS differences, trailing slashes, query strings, and fragments. Jekyll inference reads the nearest `_config.yml`, the dated post filename, and simple front-matter `date`, `slug`, and `permalink` values; complex YAML, custom permalink placeholders, and alternate domains may need a repeatable `--exclude-url 'https://example.com/post/'` argument. These explicit exclusions remain active when switching files.

Select a result to load the entire post. Posts from this site's `_posts` folder use local Markdown with front matter removed; other results use the full text stored in Hister through `/api/document`. The **Formatted** tab renders Markdown headings, lists, emphasis, and code. Hister's indexed web text may lack the original Markdown formatting. The **Select / copy text** tab is read-only and supports mouse selection, Shift+arrow selection, and Ctrl+A. Ctrl+C in that tab copies the selected text; `c` copies the entire current preview. Clipboard transfer requires a terminal that permits OSC 52 clipboard access ([Textual clipboard documentation](https://textual.textualize.io/api/app/#textual.app.App.copy_to_clipboard)). If full text is unavailable, the preview keeps the matching passage and displays the reason. No preview text is truncated by the app.

| Key | Action |
| --- | --- |
| `r` | Search the saved draft now, even below the threshold or while paused |
| `p` | Pause/resume automatic searches; an in-flight search may finish |
| `f` | Enter a different Markdown file path; Escape cancels |
| Up/Down | Select a result and show its details |
| Enter | Open the selected web result or local file |
| Tab | Move focus between panes/controls |
| `c` | Copy the whole current preview |
| Ctrl+A / Ctrl+C in the text preview | Select all / copy selection |
| `q` | Quit (Ctrl+C outside the text preview also exits) |

OpenAI receives the cleaned whole draft and title to generate three conceptual queries; above 12,000 prose words it receives the first and last 6,000 words. The app uses `store=False` for Responses requests. Hister searches all indexed content through its direct HTTP `/search` API with `semantic=true` and `format=json`, using its existing embedding configuration. The app checks `/api/config` for availability, authentication, and enabled semantic search before calling OpenAI. Results include ranked documents and separate semantic hits with similarity and matching passages. Results are merged by reciprocal rank fusion and deduplicated by URL. Nothing is written to the draft or added to Hister's index by this utility.

Previous results remain visible during requests and errors. A failed cycle waits for `r` or a changed draft that meets the word threshold, rather than continuously retrying. Searches require a successful connection to Hister before making an OpenAI request. Switching files discards responses for the previous file. Session state is in memory, so restarting performs a fresh initial search.

### Manual verification

Run the launch command above and confirm the count matches the saved prose. If the file has fewer than 250 words, expect it to wait; press `r` to search early. At or above 250 words, expect three queries and related Hister results (or an explicit empty-results message) after the file settles.

- Add 250 net words and save: one new search should run. Revise without increasing the count: no automatic search should run.
- Pause, add words, and save: counting continues without an automatic request.
  Resume: a qualifying saved draft is searched.
- Switch files during a request: old responses should not populate the new file.
- Save using an editor that replaces files atomically, or temporarily move the draft away and back: the watcher should recover.
- Stop Hister or use invalid credentials: expect an error with previous results preserved and no continuous retries. Restore the service/key and press `r`.
- Disable semantic search in Hister: expect an explicit error before the OpenAI call. Re-enable it and press `r`. The direct API must return JSON, not HTML.
- Check repeated URLs appear once and the watched post is absent, including its published URL. Only similarity is displayed; there is no Score field.
- Select a result: expect the full local Markdown or full indexed text, with an explicit passage-only message if unavailable. Switch results quickly and confirm an older preview never replaces the selection.
- Check Markdown formatting in the Formatted tab. In the text tab, select a passage, press Ctrl+C, and paste into your editor; press `c` and paste to check the whole preview. Enter on the result list should still open the selected result. For a draft over 12,000 words, expect a query-context trimming notice while previews remain complete.
