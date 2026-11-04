---
name: git-commit-push-pr-ado
description: Commit local changes, push the branch to origin, and open a pull request with Azure CLI, including optional Azure CLI and Azure DevOps bootstrap when required. Use when the user asks to take current repo changes through branch setup, commit, push, and PR creation in one workflow.
---

# Commit, Push, and PR

## Context Commands

- `git status`
- `git diff HEAD`
- `git branch --show-current`
- `git remote get-url origin`
- `Get-Command az -ErrorAction SilentlyContinue` (Windows) or `command -v az` (macOS/Linux)
- `az --version`
- `az extension show --name azure-devops`
- `az devops configure --list`
- A lightweight Azure DevOps validation command such as `az repos pr list --top 1`

## Workflow

1. Inspect repository state with `git status`, `git diff HEAD`, `git branch --show-current`, and the `origin` remote URL.
2. Check whether Azure CLI is installed and runnable.
3. If Azure CLI bootstrap may be needed, read [references/azure-devops-bootstrap.md](references/azure-devops-bootstrap.md).
4. If the current branch is `main`, create a new branch.
5. Create a single commit with an appropriate message.
6. Push the branch to `origin`.
7. Create a pull request with `az repos pr create`, passing explicit Azure DevOps context when remote inference or configured defaults require it.

## Bootstrap Trigger

Read the bootstrap reference only when at least one of these is true:

- `az` is missing.
- `az --version` fails.
- The `azure-devops` extension is missing or unusable.
- Azure DevOps authentication is invalid or missing.
- Azure DevOps org or project context cannot be derived from the remote and is not already configured.

Treat Azure CLI as configured properly only when all of the following are true:

- The `az` executable is present and runnable.
- The `azure-devops` extension is installed.
- Authentication is valid for Azure DevOps commands.
- The org and project context needed for `az repos pr create` is available through remote inference, configured defaults, or explicit command arguments.

## Constraints

- Prefer only the commands required for this task: git branch or checkout creation commands, `git add`, `git status`, `git diff`, `git commit`, `git push`, Azure CLI commands required to validate or bootstrap Azure DevOps, and package-manager commands required to install Azure CLI when missing.
- Keep the workflow narrowly scoped to commit, push, PR creation, and the minimum Azure CLI or Azure DevOps setup required to make `az repos pr create` succeed.
- Perform the full workflow in one execution pass when possible.
- Write the commit message using Conventional Commits format (`type(scope): summary`).
- In tool-call mode, return only the required tool calls and no extra prose.
- If installation, login, or permissions issues require user interaction or approval, surface that blocker explicitly rather than fabricating a fully automatic path.
