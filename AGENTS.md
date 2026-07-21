# Working instructions

## Critical: never execute without explicit permission

- Do not run renders, previews, tests, R code, browsers, or verification commands unless the user explicitly requests that exact action in the current message.
- Never render an individual `.qmd` file. An explicit document render can execute its code even when the project uses `freeze: true`.
- Treat `freeze: true` as intentional protection for old and difficult-to-reproduce posts. Do not bypass, refresh, or regenerate frozen results.
- Do not generate or update files in `docs/`, `_freeze/`, or post preview images unless the user explicitly asks for a render or regeneration.
- After editing source files, stop and report that the changes were not rendered or verified. Do not perform automatic checks.
- These restrictions are important: attempting execution without permission wastes time and tokens and may modify generated historical content.
