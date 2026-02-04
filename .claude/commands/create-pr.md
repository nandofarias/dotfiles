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
