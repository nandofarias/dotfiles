Create a new change in the stack with a bookmark. Arguments: $ARGUMENTS

## Steps

1. **Parse arguments:**
   - If `$ARGUMENTS` is empty, ask the user for a bookmark name and commit message.
   - The argument format can be:
     - Just a name: `add-auth-endpoint` → bookmark becomes `ffarias/add-auth-endpoint`
     - Ticket-prefixed: `BLVD-1234-add-auth` → bookmark becomes `ffarias/BLVD-1234-add-auth`
     - Already prefixed: `ffarias/BLVD-1234-add-auth` → use as-is
   - Auto-prefix `ffarias/` if the name doesn't already start with `ffarias/`
   - If a commit message follows the name (separated by a space after the bookmark part), use it for the description.

2. **Check current state:**
   ```bash
   jj log -r '@' --no-graph -T 'if(empty, "EMPTY", "HAS_CHANGES") ++ "\n"'
   ```
   - If the working copy `@` is empty AND has no description, we can use it directly.
   - If `@` has changes or a description, run `jj new` first to create a new change on top.

3. **Set the description:**
   ```bash
   jj describe -m "<commit message>"
   ```
   If no commit message was provided, derive one from the bookmark name (convert hyphens to spaces, remove ticket prefix for the message).

4. **Create the bookmark:**
   ```bash
   jj bookmark create <bookmark-name> -r @
   ```

5. **Confirm** by showing the updated stack:
   ```bash
   jj log -r 'trunk()..@' --limit 5
   ```

## Edge Cases
- If the bookmark name already exists, warn the user and ask if they want to move it instead (`jj bookmark set`).
- If we're not on a stack (working copy is on trunk), that's fine — this starts a new stack.
