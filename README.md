# Data, Code and Visualization

Source for <https://jkunst.com/blog>, built with [Quarto](https://quarto.org/)
and published from the `docs/` directory.

## Routine maintenance

Quarto is bundled with current versions of RStudio. From the project root:

```powershell
quarto preview --no-clean
```

If `quarto` is not available in `PATH` on Windows, use RStudio's bundled copy:

```powershell
& 'C:\Program Files\RStudio\resources\app\bin\quarto\bin\quarto.exe' preview --no-clean
```

Before publishing, render the site and review the changes in `docs/`:

```powershell
quarto render --no-clean
git status --short
```

The posts use `freeze: true`. A full site render reuses the committed results in
`_freeze/`, which protects historical posts from package and data changes. To
create or intentionally recompute one post, render that post directly, inspect
both `_freeze/` and `docs/`, and commit them together:

```powershell
quarto render posts/YYYY-MM-DD-post-name/index.qmd
quarto render --no-clean
```

Always keep `--no-clean` on project-wide preview and render commands: `docs/`
contains historical pages that no longer have a source document. Do not delete
`_freeze/` or recompute all posts unless you are deliberately rebuilding their
software environments. Old posts are kept as an archive even when their original
code or external data is no longer reproducible.

## New post checklist

1. Create `posts/YYYY-MM-DD-short-title/index.qmd`.
2. Add `title`, `description`, `date`, `categories`, and a local preview `image`.
3. Render the post directly once, then render the complete site.
4. Check the page on desktop and mobile, including external links and image alt text.
5. Commit the source, `_freeze/`, and generated `docs/` changes together.
