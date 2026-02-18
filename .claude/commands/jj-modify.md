Modify the description of the current change. New description: $ARGUMENTS

1. **Show current description:**
   ```bash
   jj log -r '@' --no-graph -T 'description'
   ```

2. **Update the description:**
   - If `$ARGUMENTS` is provided, use it:
     ```bash
     jj describe -m "$ARGUMENTS"
     ```
   - If `$ARGUMENTS` is empty, ask the user what the new description should be.

3. **If there's a bookmark on this change, note that the PR title may need updating:**
   ```bash
   jj bookmark list -r '@'
   ```
   If a bookmark exists and has a PR, suggest:
   ```bash
   gh pr edit <number> --title "<new first line>"
   ```

4. **Show updated change:**
   ```bash
   jj log -r '@' --no-graph
   ```
