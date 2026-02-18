Jump to a specific change for editing. Target: $ARGUMENTS

## Steps

1. **Parse the target:**
   - If `$ARGUMENTS` is empty, show the stack and ask which change to edit:
     ```bash
     jj log -r 'trunk()..@' --no-graph -T 'change_id.shortest(8) ++ " " ++ if(bookmarks, bookmarks.join(", ") ++ " ", "") ++ description.first_line() ++ "\n"'
     ```
   - The target can be a change ID (short or full), bookmark name, or revset expression.

2. **Record current position** (so user can return with jj-top):
   Note the current change ID in case the user wants to come back.

3. **Edit the target:**
   ```bash
   jj edit $ARGUMENTS
   ```

4. **Show new position:**
   ```bash
   jj log -r 'trunk()..@ | @' --limit 10
   ```

5. **Remind the user:**
   - All file changes are automatically part of the current change (no staging needed)
   - Use `/jj-top` to return to the top of the stack when done
   - Use `/jj-up` or `/jj-down` to navigate from here

## Edge Cases
- If the target doesn't exist, show available changes and ask again.
- If the target is immutable (on trunk), warn the user.
