---
name: git-commit
description: Create a single git commit from current repository changes. Use when the user asks to commit local work, finalize staged/unstaged edits, or produce one commit message from the current git state.
---

# Git Commit

## Workflow

1. Gather repository context:
   - `git status`
   - `git diff HEAD`
   - `git branch --show-current`
   - `git log --oneline -10`
2. Determine the commit scope from current changes.
3. Stage required files with `git add`.
4. Create exactly one commit with `git commit`.

## Constraints

- Create a single commit only.
- Stage and commit in one execution pass when possible.
- Write the commit message using Conventional Commits format (`type(scope): summary`).
- Use only git commands required for this task.
- Do not run unrelated tools or perform unrelated actions.
- In tool-call mode, return only the required tool calls and no extra prose.
