

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


---
## Distilled 2026-04-01 08:01 UTC

## Decisions
- **Use "feedforward" framing for CS audience** in neuroscience-heavy paragraphs to make the text more accessible (why: reduces jargon and aligns with familiar CS terminology)
- **Cmd+Return keyboard shortcut** for LaTeX compilation in Cursor (why: faster workflow than auto-build on save or manual commands)

## Context Updates
- **Marp slide compilation command**: `marp --no-stdin --allow-local-files --theme cpsy1291-theme.css <file>.md --pdf` (includes local images and custom theme)
- **Nested git repos in `teaching/cpsy1291/lecture_materials/`** (e.g., `welch_labs_code`, `neuromatch_neuroai`) cause Cursor to show orange folder indicator despite parent repo being clean
- **`service/reviews/` and `service/ploscb/`** contain confidential material (reviews, submissions) that must **never** be pushed to GitHub
- **`sandbox/CPSY-1950-Project-Demo`** is a nested repo with no push access; `.env` and `__pycache__/` are gitignored

## Procedures
- **For Marp slides**: Compile all decks in a directory using:
  ```bash
  for f in *.md; do marp --no-stdin --allow-local-files --theme cpsy1291-theme.css "$f" --pdf; done
  ```
- **Git hygiene for nested repos**: Add nested repos to `.gitignore` in parent repo to avoid accidental commits
- **Confidential directories**: Ensure `submissions/`, `triage-notes/`, and `reviews/` are excluded via `.gitignore` in `service/ploscb/` and `service/reviews/`


---
## Distilled 2026-04-02 08:00 UTC

## Decisions
- **Move finished letter `.tex` files directly to `final/` directory** (why: user no longer wants to keep PDFs or maintain an `archive/` directory, simplifying workflow)
- **Use `stfloats` package for bottom-placed two-column figures in `twocolumn` mode** (why: ensures `figure*` can appear at the bottom of page 1, resolving float placement issues in two-column layouts)

## Context Updates
- **Letter workflow change**: Finished letters are now stored as `.tex` files in `final/`; no PDFs or archive copies are kept.
- **Figure placement fix**: `stfloats` enables `[!b]` placement for `figure*` in two-column documents, preventing unwanted deferral to the next page.
- **Course updates**: Added Panopto recording link for CPSY 1950 (3/31 lecture) and specified "Kasper Multipurpose Room" for poster mini-conf (4/7 and 4/9).

## Procedures
- **For two-column bottom floats**: Use `\usepackage{stfloats}` and `[!b]` placement with `figure*` to ensure figures appear at the bottom of the current page.
- **For letter management**: Move finalized `.tex` files to `final/`; delete build artifacts (`*.aux`, `*.log`, etc.) from `drafts/`.


---
## Distilled 2026-04-03 08:00 UTC

## Decisions
- **Use `stfloats` package for bottom-placed two-column figures in CCN submissions** (why: `dblfloatfix` does not support bottom placement for `figure*` in two-column mode, causing figures to defer to the next page)
- **Replace `#chapter X` with `% chapter X` in `.bib` files** (why: `#` is a string-concatenation operator in BibTeX/Biber, causing parsing errors and broken references)
- **Use `\IfFileExists{filename}{...}{...}` for missing figures in drafts** (why: prevents compilation failures while allowing placeholder text or frames to indicate missing figures)

## Context Updates
- **Figure placement workflow**: For two-column CCN submissions, use `stfloats` + `figure*[!b]` to force bottom placement on the current page.
- **Biber/BibTeX parsing quirk**: `#` is not a comment character; use `%` for comments in `.bib` files.
- **Draft figure handling**: Wrap missing figures in `\IfFileExists` to avoid build failures during early drafting.

## Procedures
- **For two-column bottom figures**:
  ```latex
  \usepackage{stfloats}
  \begin{figure*}[!b]
    \centering
    \includegraphics[width=0.88\textwidth]{figure.png}
    \caption{...}
    \label{fig:...}
  \end{figure*}
  ```
- **For missing figures in drafts**:
  ```latex
  \IfFileExists{figure.png}{
    \includegraphics[width=0.88\textwidth]{figure.png}
  }{
    \fbox{\parbox{0.88\textwidth}{\centering Placeholder: figure.png}}
  }
  ```
- **Fixing `.bib` parsing errors**: Replace `#chapter X` with `% chapter X` and run `biber` + 2x `lualatex`.
