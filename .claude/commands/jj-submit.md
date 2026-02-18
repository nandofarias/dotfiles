Submit the entire stack: push all bookmarks and create/update GitHub PRs with correct base branches.

Options from arguments: $ARGUMENTS
- `--draft`: Create new PRs as drafts
- `--dry-run`: Show what would happen without making changes

## Steps

### 1. Get the ordered stack with bookmarks

```bash
jj log -r '(trunk()..@) ~ trunk()' --no-graph --reversed -T 'change_id.shortest(8) ++ "\t" ++ bookmarks.join(",") ++ "\t" ++ description.first_line() ++ "\n"'
```

This lists changes from bottom (closest to trunk) to top. Parse the output to build an ordered list of:
- change_id
- bookmark(s) — skip changes without bookmarks
- description (first line)

### 2. Validate the stack

- Every change should have at most one bookmark (warn if multiple).
- At least one bookmark should exist in the stack.
- No unresolved conflicts:
  ```bash
  jj log -r 'trunk()..@ & conflicts()' --no-graph -T 'change_id.shortest(8) ++ "\n"'
  ```
  If conflicts exist, abort and tell the user to resolve them first.

### 3. Push all bookmarks

```bash
jj git push --all --allow-new
```

### 4. Create/update PRs for each bookmarked change

For each bookmarked change, from bottom to top:

**Determine the base branch:**
- For the bottom-most bookmark → base is `develop`
- For each subsequent bookmark → base is the bookmark below it in the stack

**Check if PR already exists:**
```bash
gh pr list --head <bookmark> --state open --json number,title,baseRefName,url,isDraft --jq '.[]'
```

**If no PR exists, create one:**
```bash
gh pr create \
  --base <base-branch> \
  --head <bookmark> \
  --title "<description first line>" \
  --body "Part of a stack. Base: \`<base-branch>\`"
```
Add `--draft` flag if `--draft` was passed in arguments.

**If PR exists, check and update base:**
```bash
# If the base branch doesn't match what we expect:
gh pr edit <pr-number> --base <correct-base>
```

### 5. Report summary

Show a table of:
| Bookmark | PR | Status | Base | URL |
|----------|-----|--------|------|-----|
| ffarias/TICKET-auth | #123 | Updated base | develop | url |
| ffarias/TICKET-api | #124 | Created | ffarias/TICKET-auth | url |

## Edge Cases

- **Changes without bookmarks:** Skip them but warn the user (these won't get PRs).
- **Multiple bookmarks on one change:** Use the first one, warn about extras.
- **Empty changes:** Skip and warn.
- **Bookmark not pushed yet:** The push in step 3 should handle this. If it fails, report the error.
- **PR already merged:** Skip it, note it in the summary.
- **Divergent bookmarks:** If `jj git push` fails, suggest `jj git fetch` first.

## Dry Run Mode

If `--dry-run` is in arguments, do steps 1-2, then for step 3-4, just print what WOULD happen:
- "Would push bookmarks: ..."
- "Would create PR: base=X, head=Y, title=Z"
- "Would update PR #N: base X → Y"
