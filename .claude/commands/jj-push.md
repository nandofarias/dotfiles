Push all bookmarks in the current stack to the remote.

1. **Show what will be pushed:**
   ```bash
   jj bookmark list -r 'trunk()..@'
   ```

2. **Push all bookmarks:**
   ```bash
   jj git push --all --allow-new
   ```
   Note: If `git.push-new-bookmarks = true` is set in jj config, `--allow-new` is not needed.

3. **Report results.** If push fails (e.g., divergent bookmarks), explain the issue and suggest:
   - `jj git fetch` first if remote has moved
   - `jj bookmark set <name> -r <change>` to fix bookmark position

## Edge Cases
- If there are no bookmarks in the stack, inform the user they need to create bookmarks first.
- If push is rejected due to non-fast-forward, suggest fetching first.
