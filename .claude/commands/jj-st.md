Show the current jj stack status. Run these steps:

1. **Show the stack graph:**
   ```bash
   jj log -r 'trunk()..@'
   ```

2. **Show bookmark status (what needs pushing):**
   ```bash
   jj bookmark list -r 'trunk()..@'
   ```

3. **Check for open PRs for each bookmark in the stack:**
   For each bookmark found in step 2, check if a PR exists:
   ```bash
   gh pr list --head <bookmark-name> --json number,title,state,baseRefName,url --jq '.[]'
   ```

4. **Check for conflicts:**
   ```bash
   jj log -r 'trunk()..@ & conflicts()' --no-graph -T 'change_id.shortest(8) ++ " " ++ description.first_line() ++ " [CONFLICT]\n"'
   ```

5. **Present a summary** showing:
   - Stack graph (from step 1)
   - For each bookmarked change: ✅ PR exists (with link) or ⬜ No PR yet
   - 📤 Needs push / ✓ Up to date for each bookmark
   - ⚠️ Any conflicts

Keep the output concise. Use the jj log graph as the primary visual.
