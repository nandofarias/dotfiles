Reorder changes in the current stack.

## Steps

1. **Show the current stack order (bottom to top):**
   ```bash
   jj log -r '(trunk()..@) ~ trunk()' --no-graph --reversed -T 'change_id.shortest(8) ++ " " ++ if(bookmarks, "[" ++ bookmarks.join(", ") ++ "] ", "") ++ description.first_line() ++ "\n"'
   ```
   Number each change for easy reference (1 = bottom, 2, 3... = top).

2. **Ask the user for the new order.** Example:
   > Current order (bottom to top):
   > 1. abc123 [ffarias/TICKET-auth] Add authentication
   > 2. def456 [ffarias/TICKET-api] Add API layer
   > 3. ghi789 [ffarias/TICKET-ui] Add UI components
   >
   > Enter new order (e.g., "3 1 2" to move UI to bottom):

3. **Execute the reorder using `jj rebase`:**

   To reorder, you rebase changes one by one from bottom to top in the desired order:

   For each change in the new order (bottom to top):
   ```bash
   # Rebase change onto the previous one (or trunk for the first)
   jj rebase -r <change-id> -d <previous-change-or-trunk>
   ```

   **Important:** Use `-r` (single revision) not `-b` (branch) to move individual changes.

4. **Handle bookmarks:** Bookmarks stay attached to their changes, so they move with the reorder automatically.

5. **Check for conflicts and show result:**
   ```bash
   jj log -r 'trunk()..@'
   ```

## Edge Cases
- If reorder creates conflicts, warn the user but proceed (jj handles conflicts gracefully).
- If the stack has only 1 change, there's nothing to reorder.
