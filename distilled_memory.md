

---
## Distilled 2026-03-24 08:00 UTC

## Decisions
- **Use Ghostscript to downgrade PDFs to version 1.4** for compatibility with Tectonic's `xdvipdfmx` when transparency or advanced features cause rendering issues (why: ensures all panels render correctly across LaTeX engines)
- **Add pages to `@book` references via the `note` field** in `.bib` files (why: `sciencemag.bst` ignores the `pages` field for `@book` entries, causing missing page numbers in citations)
- **Replace inline "(Methods)" references with `\cite{methods}`** (why: Science requires a numbered bibliography entry for Methods, not inline text)
- **Remove the main-text "Materials and Methods" paragraph** (why: Science convention places full methods in the supplement, with only `\cite{methods}` in the main text)
- **Shorten abstract to ≤125 words** (why: Science Research Articles enforce this strict limit)
- **Add line numbers (`\usepackage{lineno}` and `\linenumbers`)** (why: Science requires line numbers for initial submissions)
- **Add a short title (≤40 characters)** (why: Science requires both a full title and a short title for submission metadata)

## Context Updates
- **Figure compatibility fix**: `Figure1_v13_compat.pdf` (PDF 1.4) created to resolve missing panels in Tectonic; original `Figure1_v13.pdf` (PDF 1.5) works in Overleaf but not Tectonic.
- **Reference 14 (MacGinitie 1953)**: A book/monograph spanning pages 1–198; pages added via `note` field to survive Tectonic's BibTeX regeneration.
- **Supplementary figures S2–S4**: Scaled to `0.88\linewidth` to fit captions on the same page.
- **SSH alias issue**: `ssh_openclaw` alias in `~/.zshrc` uses a key path (`~/.ssh/id_ed25519_openclaw`) that expands incorrectly when logged in as `devsandbox` (resolved by using absolute paths).

## Procedures
- **For PDF compatibility issues**: Use Ghostscript to downgrade PDFs to version 1.4:
  ```bash
  gs -dNOPAUSE -dBATCH -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 \
     -sOutputFile=Figures/FigureX_compat.pdf Figures/FigureX.pdf
  ```
- **For missing pages in `@book` references**: Add pages to the `note` field in `.bib` files (e.g., `note = {pp. 1--198},`).
- **For Science submissions**: Ensure abstract ≤125 words, line numbers enabled, and short title provided. Remove main-text "Materials and Methods" section.
