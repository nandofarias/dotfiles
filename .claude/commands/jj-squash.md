Squash the current change into its parent.

1. **Show what will be squashed:**
   ```bash
   jj log -r '@ | @-' --no-graph -T 'change_id.shortest(8) ++ " " ++ description.first_line() ++ "\n"'
   ```

2. **Squash:**
   ```bash
   jj squash
   ```
   This moves all changes from `@` into `@-` (parent). The working copy becomes a new empty change on top.

3. **If the squashed change had a bookmark, it might need moving:**
   Check if the old `@` had a bookmark that should now be on the parent.

4. **Show result:**
   ```bash
   jj log -r 'trunk()..@' --limit 10
   ```

## Variant: Squash specific files only
If the user wants to squash only specific files:
```bash
jj squash <file-paths>
```

## Variant: Squash into a non-parent
```bash
jj squash --into <target-change>
```
