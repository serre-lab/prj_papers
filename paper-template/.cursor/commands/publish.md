# Publish Command

Command: `/publish`

## Description
Compiles the document, checks naming conventions, and publishes to GitHub (if configured).

## Behavior
1. Run `make publish` which:
   - Compiles the document (`make pdf`)
   - Checks naming conventions (`make check`)
   - Runs the publish script (`scripts/publish.sh`)
2. If compilation errors occur, fix them and retry
3. Report whether:
   - Compilation was successful
   - Changes were committed
   - Changes were pushed to origin
   - Or if setup is needed (no git repo, no origin remote, etc.)

## Example
User: `/publish`

Response: Compiles, commits changes (if any), pushes to origin (if configured), and reports the status.

