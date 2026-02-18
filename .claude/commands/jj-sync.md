Sync the stack with the latest develop. Steps:

1. **Fetch from remote:**
   ```bash
   jj git fetch
   ```

2. **Show what changed on develop:**
   ```bash
   jj log -r 'trunk()' --limit 3
   ```

3. **Rebase the stack onto latest trunk:**
   ```bash
   jj rebase -b @ -d 'trunk()'
   ```

   The `-b @` flag rebases the entire branch containing `@` (the whole stack), and `-d trunk()` sets the new destination.

4. **Check for conflicts after rebase:**
   ```bash
   jj log -r 'trunk()..@ & conflicts()' --no-graph -T 'change_id.shortest(8) ++ " " ++ description.first_line() ++ " [CONFLICT]\n"'
   ```

5. **Report results:**
   - If no conflicts: "Stack rebased onto latest develop. All clean."
   - If conflicts: Show which changes have conflicts. In jj, conflicts are recorded in the change — you can resolve them by editing the files. Tell the user:
     - `jj edit <conflicting-change>` to go to the conflicting change
     - Edit the files to resolve conflict markers
     - jj auto-detects when conflicts are resolved (no `git add` needed)
     - Use `/jj-st` to check if conflicts are cleared

6. **Show updated stack:**
   ```bash
   jj log -r 'trunk()..@' --limit 15
   ```

## Note on jj's conflict handling

Unlike git, jj does NOT stop on conflicts during rebase. It records conflict markers in the change tree and lets you continue working. This means your entire stack is rebased even if some changes conflict. You resolve at your convenience.
