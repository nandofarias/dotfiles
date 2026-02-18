Jump to the bottom of the stack. Steps:

1. Find the bottom change (first change after trunk):
   ```bash
   jj log -r 'roots(trunk()..@)' --no-graph -T 'change_id.shortest(8) ++ "\n"' --limit 1
   ```

2. If already there, inform the user. Otherwise:
   ```bash
   jj edit <bottom-change-id>
   ```

3. Show current position:
   ```bash
   jj log -r 'trunk()..@' --limit 10
   ```
