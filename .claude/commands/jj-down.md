Move down in the stack (to the parent change). Run:

```bash
jj prev --edit
```

After moving, show the current position:
```bash
jj log -r 'trunk()..@ | @' --limit 10
```

If already at the bottom of the stack (parent is trunk), inform the user.
