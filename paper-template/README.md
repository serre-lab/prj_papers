# LaTeX Paper Template

A clean, Overleaf-friendly LaTeX paper template using Tectonic for compilation.

## Structure

```
paper-template/
  main.tex              # Main LaTeX document (single file, no split sections)
  bib/
    references.bib      # Bibliography entries
  figures/              # Exported figure files (PDF, PNG, JPG, etc.)
  fig-src/              # Editable figure source files
  style/
    macros.tex          # Custom LaTeX macros
  scripts/              # Build and publish scripts
  build/                # Build outputs (gitignored)
```

## Compilation

Compile the document using Tectonic:

```bash
make pdf
```

Or directly:

```bash
tectonic -o build main.tex
```

The output PDF is written to `build/main.pdf`.

## Workflow

### Compile
```bash
make pdf
```

### Check naming conventions
```bash
make check
```

### Publish (compile + commit + push)
```bash
make publish
```

Or with custom options:
```bash
./scripts/publish.sh main.tex "Custom commit message" 1  # Include PDF in commit
```

## Naming Conventions

**Important**: When creating a new paper repository from this template, the repository folder name MUST match:

```
paper-YYYY-shortslug
```

Examples:
- `paper-2026-fossil-leaves`
- `paper-2025-hmax-revival`
- `paper-2024-neural-circuits`

Rules:
- Use lowercase letters and numbers only
- Use hyphens (not underscores) to separate words
- No spaces or uppercase letters in tracked paths
- Format: `paper-` + 4-digit year + `-` + lowercase slug

The template itself (`paper-template`) will show a warning when running `make check`—this is expected and can be ignored.

## Using Within prj_papers

If you use the [prj_papers](https://github.com/serre-lab/prj_papers) monorepo:

1. Copy this template folder to `prj_papers/paper-YYYY-shortslug` (e.g. `paper-2026-my-paper`)
2. Rename and customize the content
3. From the `prj_papers` root, run: `git add paper-YYYY-shortslug/` and commit
4. Push to the prj_papers remote—no separate repo needed

## Create the GitHub Repository

*Use this section only when creating a standalone repo (not for prj_papers).*

### Path A: GitHub CLI (Recommended)

If you have GitHub CLI installed and authenticated:

```bash
gh repo create <REPO_NAME> --private --source=. --remote=origin --push
```

Or use the helper script:

```bash
./scripts/create_github_repo.sh
```

### Path B: Manual Setup

1. Create a new private repository on GitHub (no README, no license)
2. Run these commands:

```bash
git remote add origin git@github.com:<USER>/<REPO_NAME>.git
git branch -M main
git push -u origin main
```

## Cursor Integration

This template includes Cursor rules and commands:

- **`.cursor/rules/latex.mdc`**: Always uses Tectonic for compilation
- **`/compile`**: Compiles the document and fixes errors
- **`/publish`**: Compiles, commits, and pushes to GitHub

## Customization

1. Edit `main.tex` to add your content
2. Add bibliography entries to `bib/references.bib`
3. Add custom macros to `style/macros.tex`
4. Place figures in `figures/` and reference them in LaTeX

## Requirements

- [Tectonic](https://tectonic-typesetting.github.io/) for LaTeX compilation
- Git (for version control)
- Make (for build automation)

## Troubleshooting

**"spawn tectonic ENOENT" in Cursor/VS Code:** Cursor may use a minimal PATH. Add the full path in your user settings (`latex-workshop.latex.tools`): `"command": "/opt/homebrew/bin/tectonic"` on macOS.

