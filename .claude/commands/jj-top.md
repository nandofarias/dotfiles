Jump to the top of the stack. Steps:

1. Find the top change (the one furthest from trunk in the current stack):
   ```bash
   jj log -r 'heads(trunk()..@)' --no-graph -T 'change_id.shortest(8) ++ "\n"' --limit 1
   ```

2. If already there, inform the user. Otherwise:
   ```bash
   jj edit <top-change-id>
   ```

3. Show current position:
   ```bash
   jj log -r 'trunk()..@' --limit 10
   ```
