---
description: Create a new branch, commit changes, and submit a pull request with automatic commit splitting
category: version-control-git
allowed-tools: Bash(git *), Bash(gh *), Bash(biome *)
---

# Create Pull Request Command

Create a new branch, commit changes, and submit a pull request.

## Behavior

- Creates a new branch based on current changes, only if in develop, master or main
- Formats modified files
- Analyzes changes and automatically splits into logical commits when appropriate
- Each commit focuses on a single logical change or feature
- Creates descriptive commit messages for each logical unit
- Pushes branch to remote
- Creates pull request with proper summary and description

## Guidelines for Automatic Commit Splitting

- Split commits by feature, component, or concern
- Keep related file changes together in the same commit
- Separate refactoring from feature additions
- Ensure each commit can be understood independently
- Multiple unrelated changes should be split into separate commits

## Guidelines for Creating Pull Requests

- Use Jira ticket number in pull request title if available in branch name
- Check for pull request template, and fill all the requirements
- If in a stack, use `git stack` to find the base branch for the pull request, and put the stack in the description in a nice format
- Assign the PR to me
- Add reviewers: include CODEOWNERS for modified files AND any teams referenced in the changes
- Add labels: use `team/<team-name>` for the owning team, `chore` for non-functional changes

## Stack Detection (REQUIRED before creating PR)

- ALWAYS run `git stack` first to check if the branch is part of a stack
- If `git stack` shows multiple branches, the PR base should be the branch ABOVE the current branch in the stack output (the parent)
- Use `--base <parent-branch>` flag with `gh pr create`
- If not in a stack (or git stack fails), use the default base branch (develop/main/master)

## Branch Creation Rules (REQUIRED)

1. ALWAYS run `git stack` first to understand the current stack state
2. Check if current branch already has an open PR: `gh pr list --head <current-branch>`
3. If the branch already has a PR:

- Create a NEW branch from the current branch for new changes
- Use the current branch as the `--base` for the new PR

4. If NOT in a stack and no existing PR, use develop/main as base
5. NEVER commit directly to a branch that already has an open PR
