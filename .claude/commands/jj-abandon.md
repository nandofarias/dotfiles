Abandon changes. Target: $ARGUMENTS

## Steps

1. **Parse the target:**
   - If `$ARGUMENTS` is empty, show the stack and ask what to abandon.
   - Can be: change ID, bookmark name, or revset expression.

2. **Show what will be abandoned:**
   ```bash
   jj log -r '$ARGUMENTS'
   ```
   Ask for confirmation before proceeding.

3. **Abandon:**
   ```bash
   jj abandon $ARGUMENTS
   ```

4. **Clean up bookmarks:**
   If the abandoned change had a bookmark, the bookmark is automatically removed by jj.
   Check if there's a PR to close:
   ```bash
   gh pr list --head <bookmark> --state open --json number --jq '.[].number'
   ```
   If a PR exists, ask if the user wants to close it:
   ```bash
   gh pr close <number>
   ```

5. **Show updated stack:**
   ```bash
   jj log -r 'trunk()..@'
   ```

## Common patterns
- Abandon just the working copy: `jj abandon @` (useful to "start over" on current change)
- Abandon everything in the stack: `jj abandon 'trunk()..@'`
- Abandon a specific change mid-stack: children are rebased onto the parent automatically
