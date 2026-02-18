# jj Stacked PR Workflow — Quick Reference

## Mental Model

In jj, you don't "commit" — you work directly on **changes**. The working copy (`@`) IS a change.
- `jj new` = "I'm done with this change, start a new one on top"
- `jj describe` = set/update the change description (commit message)
- `jj bookmark create/set` = label a change with a branch name
- Bookmarks map to git branches when pushed

## Stack Concept

A stack is a linear chain of changes between `trunk()` (develop) and your working copy (`@`):

```
@ (working copy - might be empty)
|
○ ffarias/TICKET-part-3   ← top of stack
|
○ ffarias/TICKET-part-2
|
○ ffarias/TICKET-part-1   ← bottom of stack
|
◆ develop                  ← trunk
```

## Key Revsets

- `trunk()..@` — all changes in your stack
- `@` — working copy (current change)
- `@-` — parent of working copy
- `@+` — children of working copy (if any)
- `bookmarks() & trunk()..@` — bookmarked changes in your stack

## Common Patterns

### Create a stack
```bash
jj new trunk()                    # start from develop
jj describe -m "feat: first change"
jj bookmark create ffarias/TICKET-first -r @
jj new                            # start next change
jj describe -m "feat: second change"
jj bookmark create ffarias/TICKET-second -r @
```

### Navigate
```bash
jj prev             # go to parent (down toward trunk)
jj next             # go to child (up toward tips)
jj edit <change>    # jump to specific change
```

### Push & submit
```bash
jj git push --all              # push all bookmarks
gh pr create --base develop --head ffarias/TICKET-first
gh pr create --base ffarias/TICKET-first --head ffarias/TICKET-second
```

### Sync with develop
```bash
jj git fetch
jj rebase -b @ -d trunk()
```

### Mid-stack edit
```bash
jj edit <change-id>     # jump to the change
# make your edits (auto-tracked)
jj next                  # or jj edit back to where you were
```

## Slash Commands

| Command | gt equivalent | Description |
|---------|--------------|-------------|
| `/jj-create` | `gt create` | New change + bookmark |
| `/jj-st` | `gt st` | Show stack |
| `/jj-up` | `gt up` | Navigate up |
| `/jj-down` | `gt down` | Navigate down |
| `/jj-submit` | `gt submit` | Push + create PRs |
| `/jj-sync` | `gt sync` | Fetch + rebase |
| `/jj-restack` | `gt restack` | Rebase onto develop |
| `/jj-reorder` | `gt reorder` | Reorder stack |
| `/jj-modify` | `gt modify` | Edit description |
| `/jj-start` | — | Start new ticket |
| `/jj-finish` | — | Post-merge cleanup |
| `/jj-abandon` | — | Abandon changes |
