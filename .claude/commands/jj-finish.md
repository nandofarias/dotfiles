Clean up after a PR at the bottom of the stack has been merged.

## Steps

1. **Fetch latest (to get the merge):**
   ```bash
   jj git fetch
   ```

2. **Identify merged bookmarks:**
   Look for bookmarks that were in the stack but are now on trunk (merged):
   ```bash
   jj bookmark list --all -T 'if(name.starts_with("ffarias/"), name ++ " " ++ if(tracking_present, "tracked", "local") ++ "\n")'
   ```
   Also check which bookmarks were deleted from remote (these were merged + branch deleted):
   ```bash
   jj log -r 'trunk()' --limit 5
   ```

3. **Abandon the merged changes:**
   For each merged bookmark, abandon the changes that are now in trunk:
   ```bash
   jj abandon 'trunk()..@- & ::trunk()'
   ```
   Or more specifically, if we know the bookmark:
   ```bash
   jj abandon <merged-change-id>
   ```

4. **Rebase remaining stack onto trunk:**
   ```bash
   jj rebase -b @ -d trunk()
   ```

5. **Push updated bookmarks:**
   ```bash
   jj git push --all
   ```

6. **Update PR base branches:**
   For the new bottom-most PR in the stack, update its base to `develop`:
   ```bash
   gh pr edit <pr-number> --base develop
   ```

7. **Show the cleaned-up stack:**
   ```bash
   jj log -r 'trunk()..@'
   ```

## Edge Cases
- If all PRs were merged, congratulate the user — stack is complete!
- If the merge created conflicts in the remaining stack, report them.
- If bookmarks were auto-deleted by jj git fetch (because remote branch was deleted after merge), note this.
