- [ ] danielBsLOG
- [ ] IN PROGRESS danielsjourney installations
- [ ] danielsjourney.com news
- [ ] Greenbelt blog
- [ ] machina xianporna
- [ ] Post-post
- [ ] worship think tank

# Blogger Archive Script Workflow

This directory contains source archives for several old Blogger blogs. Most
blog folders contain individual markdown posts, and some generated markdown
roll-ups also live at the root of this directory.

The Ruby scripts are intended to be run manually from this directory:

```sh
cd /home/danielmiller/code/daniel-industries/_drafts/blogger
```

## Scripts

### `blogger_atom_to_jekyll.rb`

Converts Blogger Atom exports into individual Jekyll-style markdown files.

- Input: every `feed.atom` file found recursively below the selected root.
- Default root: this directory.
- Output: one `.md` file per Blogger post, written next to the source
  `feed.atom`.
- Filename format: `YYYY-MM-DD-title-post_id.md`.
- Frontmatter written: `date`, `title`, `category: nil`, and `layout: post`.
- Post body: copied from the Atom entry content.
- Filtering: includes entries with no `blogger:type` or with
  `blogger:type` equal to `POST`.

Manual command:

```sh
ruby blogger_atom_to_jekyll.rb
```

Optional command for a specific root:

```sh
ruby blogger_atom_to_jekyll.rb /path/to/blogger/archive/root
```

Expected result: the script prints how many markdown files it created and how
many `feed.atom` files it read.

### `combine_markdown_posts.rb`

Combines a blog folder full of individual markdown posts into a single
markdown file at the root of this directory.

- Input: a source directory containing `.md` posts.
- Default source selection: interactive menu of folders in this directory.
- Default output: `SOURCE-DIR-NAME.md` in this directory, with spaces replaced
  by hyphens.
- Processing: strips YAML frontmatter from each post before combining.
- Default cleanup: removes all HTML tags, scripts, styles, comments, and
  decodes HTML entities.
- Optional `--h1-separators`: inserts `# YYYY-MM-DD title` between posts based
  on frontmatter.
- Optional `--keep-non-whitespace-html`: keeps most HTML while converting
  `br`, `p`, and `div` tags into markdown spacing.

Manual command with prompts:

```sh
ruby combine_markdown_posts.rb
```

Manual command for a specific folder:

```sh
ruby combine_markdown_posts.rb --source-dir "danielsjourney installations" --h1-separators
```

Expected result: the script prints the number of markdown files combined and
the output path. Existing output files with the same path are overwritten.

### `fuzzy_match_posts.rb`

Compares source archive markdown files against the main Jekyll `_posts`
directory and writes a match report.

- Input source: a blog archive folder, either selected interactively or passed
  with `--source-dir`.
- Input target: Jekyll `_posts`, defaulting to `../../_posts` from this
  directory.
- Default report: `blogger_match_report.txt`.
- Matching method: normalized body text, 5-word shingles, title similarity,
  containment, and date proximity.
- Default date window: 3 days.
- Default minimum score: `0.22`.
- Progress: prints status every 25 source files by default.
- Prompts: when processing multiple folders, prompts before moving to a new
  source subdirectory unless `--yes` is supplied.
- Unmatched copy support exists in comments, but the active script currently
  only writes the report.

Manual command with prompts:

```sh
ruby fuzzy_match_posts.rb
```

Manual command for one source folder:

```sh
ruby fuzzy_match_posts.rb --source-dir "danielsjourney installations" --posts-dir ../../_posts
```

Manual command without continue prompts:

```sh
ruby fuzzy_match_posts.rb --source-dir "danielsjourney installations" --posts-dir ../../_posts --yes
```

Expected result: the script writes `blogger_match_report.txt` with two
sections:

- `Matched posts:` containing `Source:` and `Post:` pairs.
- `Unmatched source posts:` containing source files that did not meet the
  threshold.

### `delete_matched_source_posts.rb`

Deletes source archive files that are listed as matched in a fuzzy match
report.

- Input: `blogger_match_report.txt` by default.
- Source scope: a folder selected interactively or passed with `--source-dir`.
- Behavior: reads only `Source:` lines from the report, resolves file URLs,
  filters them to the selected source folder, and deletes only files that still
  exist there.
- Safety prompt: lists every file to delete and requires typing `DELETE`
  unless `--yes` is supplied.
- Skips report entries outside the selected source directory or missing on
  disk.

Manual command with confirmation:

```sh
ruby delete_matched_source_posts.rb --source-dir "danielsjourney installations"
```

Manual command without confirmation:

```sh
ruby delete_matched_source_posts.rb --source-dir "danielsjourney installations" --yes
```

Expected result: the script prints every matched source file it will delete,
then prints the number of deleted files. Use the confirmation flow unless you
have already reviewed the report.

## Order Of Operations

### 1. Convert Blogger Atom exports, if needed

Run `blogger_atom_to_jekyll.rb` first only when the archive still contains
`feed.atom` exports that have not yet been converted.

```sh
ruby blogger_atom_to_jekyll.rb
```

Skip this step when the blog folders already contain the individual markdown
files you want to work from.

### 2. Inspect or create a combined blog roll-up

Run `combine_markdown_posts.rb` for a blog folder when you want one readable
markdown file for review, editing, or import planning.

```sh
ruby combine_markdown_posts.rb --source-dir "BLOG FOLDER" --h1-separators
```

This step is independent of matching and deletion. It does not feed the later
scripts directly.

### 3. Match source archive posts to existing site posts

Run `fuzzy_match_posts.rb` before deleting anything. Use one source folder at a
time when cleaning up a specific blog archive.

```sh
ruby fuzzy_match_posts.rb --source-dir "BLOG FOLDER" --posts-dir ../../_posts
```

Review `blogger_match_report.txt` after this step. Matched pairs are candidates
for source cleanup; unmatched files need manual review or import work.

### 4. Delete only reviewed matched source files

After reviewing the report, run `delete_matched_source_posts.rb` for the same
source folder.

```sh
ruby delete_matched_source_posts.rb --source-dir "BLOG FOLDER"
```

Confirm the printed file list before typing `DELETE`. The script uses the
report from step 3, so rerun matching whenever the source folder, target
`_posts`, or threshold settings change.

## Typical Cleanup Loop

For each blog folder:

1. Generate or verify individual markdown source posts.
2. Optionally create a combined root markdown file for review.
3. Run fuzzy matching against `../../_posts`.
4. Review `blogger_match_report.txt`.
5. Delete matched source files only after review.
6. Manually decide what to do with unmatched source posts.

## Notes

- `combine_markdown_posts.rb` and `fuzzy_match_posts.rb` both have interactive
  folder pickers when `--source-dir` is omitted.
- Several paths contain spaces, so quote source directory arguments.
- `fuzzy_match_posts.rb` overwrites the report path on each run.
- `delete_matched_source_posts.rb` depends on the report format written by
  `fuzzy_match_posts.rb`.
- The default `_posts` target assumes this directory is located at
  `_drafts/blogger` inside the larger site repository.
