Move up in the stack (to the next child change). Run:

```bash
jj next --edit
```

If there are multiple children, `jj next` will show options. Help the user pick the right one.

After moving, show the current position:
```bash
jj log -r 'trunk()..@ | @' --limit 10
```

If already at the top of the stack (no children, or only empty working copy above), inform the user.
