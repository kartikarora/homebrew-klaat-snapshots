# homebrew-klaat-snapshots

A Homebrew Tap for the latest snapshot builds of **klaat**.

## What is klaat?

**klaat** is a fast, native command-line tool built with Kotlin and GraalVM that converts Google Docs and Markdown files into interactive, step-by-step codelabs. It is designed as a high-performance, drop-in replacement for [Google's `claat` tool](https://github.com/googlecodelabs/tools/tree/main/claat).

For more information, visit the [official website](https://klaat.kartikarora.me).

## Snapshots vs. Stable

- **Snapshots (This Tap):** These builds are generated from the latest development state. They contain the newest features and fixes but may be less stable.
- **Stable:** Official releases are available via Homebrew Core.

## Installation

To install the latest snapshot build of `klaat`, run:

```bash
brew tap kartikarora/klaat-snapshots
brew install klaat-snapshot
```

This will install the binary as `klaat`.

## Usage

Since `klaat` is a drop-in replacement for `claat`, you can use it with your existing workflows:

```bash
# Export a Google Doc to HTML
klaat export <doc-id>

# Serve a local directory of codelabs
klaat serve
```

Run `klaat --help` for a full list of commands and options.
