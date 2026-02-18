Start a new ticket. Arguments: $ARGUMENTS

## Steps

1. **Parse arguments:**
   - Expected format: `BLVD-1234 add user authentication` or `BLVD-1234-add-user-auth`
   - Extract ticket ID (e.g., `BLVD-1234`) and description
   - Construct bookmark name: `ffarias/<ticket>-<description-slug>`
     (e.g., `ffarias/BLVD-1234-add-user-auth`)

2. **Ensure we have latest develop:**
   ```bash
   jj git fetch
   ```

3. **Create a new change off trunk:**
   ```bash
   jj new trunk() -m "<description>"
   ```

4. **Create the bookmark:**
   ```bash
   jj bookmark create <bookmark-name> -r @
   ```

5. **Show the starting state:**
   ```bash
   jj log -r 'trunk()..@'
   ```

6. **Inform the user:**
   - "Started new stack for <ticket>. You're on a fresh change."
   - "Start making changes — they're automatically tracked."
   - "When ready for the next change in the stack, use `/jj-create`"

## Edge Cases
- If `$ARGUMENTS` is empty, ask for ticket ID and description.
- If there are uncommitted changes in the current working copy, warn before switching context.
  Suggest `jj new` first to save current work.
