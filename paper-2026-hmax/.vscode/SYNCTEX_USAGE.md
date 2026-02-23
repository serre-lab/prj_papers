# LaTeX Workshop SyncTeX Usage Guide

## Overview
SyncTeX enables bidirectional synchronization between your LaTeX source file (`main.tex`) and the compiled PDF.

## Forward Search (Source → PDF)
**Purpose:** Jump from a location in your `.tex` file to the corresponding location in the PDF.

**How to use:**
1. Place your cursor on a line in `main.tex`
2. Press **`Cmd+Option+J`** (Mac) or **`Ctrl+Alt+J`** (Windows/Linux)
3. The PDF viewer will open/switch to the PDF and highlight the corresponding location

**Alternative methods:**
- Right-click in the editor → "SyncTeX from cursor"
- Use the command palette: `Cmd+Shift+P` → "LaTeX Workshop: SyncTeX from cursor"

## Inverse Search (PDF → Source)
**Purpose:** Jump from a location in the PDF to the corresponding location in your `.tex` file.

**How to use:**
1. Open the PDF in the LaTeX Workshop viewer (internal viewer)
2. **Cmd+Click** (Mac) or **Ctrl+Click** (Windows/Linux) on any location in the PDF
3. VS Code will jump to the corresponding line in `main.tex`

**Note:** Inverse search only works with the internal PDF viewer. External PDF viewers (like Preview on Mac) won't work.

## Requirements
1. **SyncTeX must be enabled during compilation:**
   - The configuration uses `--synctex` flag with tectonic
   - This generates a `.synctex.gz` file alongside your PDF

2. **PDF must be compiled with SyncTeX:**
   - The current configuration automatically includes `--synctex` flag
   - After compilation, you should see `main.synctex.gz` in your directory

3. **Use the internal PDF viewer:**
   - The configuration is set to use `"latex-workshop.view.pdf.viewer": "tab"`
   - This opens the PDF in a VS Code tab, enabling inverse search

## Troubleshooting

### Forward search doesn't work:
- Make sure the PDF has been compiled with `--synctex` flag
- Check that `main.synctex.gz` exists in your directory
- Try recompiling the document

### Inverse search doesn't work:
- Make sure you're using the internal PDF viewer (not an external app)
- Check that the PDF was compiled with SyncTeX enabled
- Try clicking in the PDF viewer - it should work automatically when SyncTeX is enabled

### PDF opens in external viewer:
- Change the setting: `"latex-workshop.view.pdf.viewer": "tab"`
- Or use: `"latex-workshop.view.pdf.viewer": "external"` and configure your external viewer for SyncTeX

## Keyboard Shortcuts Summary
- **Forward search:** `Cmd+Option+J` (Mac) / `Ctrl+Alt+J` (Windows/Linux)
- **Inverse search:** `Cmd+Click` (Mac) / `Ctrl+Click` (Windows/Linux) in PDF

