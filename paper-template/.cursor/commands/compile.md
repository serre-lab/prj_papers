# Compile Command

Command: `/compile`

## Description
Compiles the LaTeX document using Tectonic and fixes any compilation errors.

## Behavior
1. Run `make pdf` to compile the document
2. If compilation fails:
   - Read the error messages
   - Fix the minimal issue needed to resolve the error
   - Retry compilation until it succeeds
3. Summarize any changes made to fix compilation errors

## Example
User: `/compile`

Response: Compiles the document, fixes any errors, and reports success or the changes made.

