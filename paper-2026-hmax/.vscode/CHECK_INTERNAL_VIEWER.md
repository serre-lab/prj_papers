# How to Verify You're Using the Internal PDF Viewer

## Quick Check

**If you see the PDF in a VS Code tab** (like a code file), you're using the **internal viewer** ✓

**If the PDF opens in Preview, Adobe Reader, or another app**, you're using an **external viewer** ✗

## How to Open PDF in Internal Viewer

1. **Method 1: Use LaTeX Workshop command**
   - Press `Cmd+Shift+P` (Command Palette)
   - Type: `LaTeX Workshop: View LaTeX PDF`
   - Select it - this should open in VS Code's internal viewer

2. **Method 2: Click the PDF preview button**
   - Look for the PDF preview icon in the LaTeX Workshop sidebar
   - Or use the command: `LaTeX Workshop: View LaTeX PDF file in tab`

3. **Method 3: Right-click on main.tex**
   - Right-click on `main.tex` in the file explorer
   - Select "View LaTeX PDF" or "View LaTeX PDF file in tab"

## Verify Settings

Your settings should have:
```json
"latex-workshop.view.pdf.viewer": "tab"
```

This forces the PDF to open in VS Code's internal viewer (as a tab).

## Test Inverse Search

Once the PDF is open in a VS Code tab:

1. **Look at the PDF** - it should be displayed inside VS Code
2. **Hold Cmd and click** anywhere in the PDF
3. **VS Code should jump** to the corresponding line in `main.tex`

## If It Still Doesn't Work

1. **Reload VS Code**: `Cmd+Shift+P` → "Developer: Reload Window"
2. **Recompile with SyncTeX**: Make sure you compile with `--synctex` flag
3. **Check SyncTeX file exists**: `ls -la main.synctex.gz`
4. **Try clicking without Cmd first**: Sometimes just clicking works
5. **Check LaTeX Workshop output**: View → Output → Select "LaTeX Workshop" from dropdown

## Common Issues

- **PDF opens in Preview**: Your system default PDF viewer is taking over
  - Solution: Always use LaTeX Workshop's "View LaTeX PDF" command
  - Or change system default PDF app temporarily

- **Clicking does nothing**: PDF might not be in internal viewer
  - Solution: Close external PDF and use LaTeX Workshop command to reopen

- **SyncTeX file missing**: PDF wasn't compiled with `--synctex`
  - Solution: Recompile using LaTeX Workshop's build command

