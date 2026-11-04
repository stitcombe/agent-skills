# Azure DevOps Bootstrap

Read this file only when `az` is missing, broken, unauthenticated, missing the `azure-devops` extension, or missing org or project context.

## Bootstrap Order

1. Check for `az` with `Get-Command az -ErrorAction SilentlyContinue` on Windows, or `command -v az` on macOS and Linux.
2. If `az` is missing:
   - On Windows, run [scripts/install-azure-cli.ps1](../scripts/install-azure-cli.ps1).
   - On macOS and Linux, run `bash scripts/install-azure-cli.sh` ([scripts/install-azure-cli.sh](../scripts/install-azure-cli.sh)). It uses `brew`, then `apt-get`; the `apt-get` path needs `sudo`, so surface a password prompt as a user blocker.
   - If no supported package manager is available, stop and report that manual Azure CLI installation is required.
3. Verify `az --version` succeeds.
4. Ensure the Azure DevOps extension exists:
   - `az extension show --name azure-devops`
   - If missing or broken, on Windows run [scripts/install-azure-devops-extension.ps1](../scripts/install-azure-devops-extension.ps1). On macOS and Linux, run `az extension add --name azure-devops` if it is missing, or `az extension update --name azure-devops` if it is broken, then re-run `az extension show --name azure-devops`.
5. Ensure authentication is valid for Azure DevOps commands.
   - Prefer validating with a lightweight Azure DevOps command before invoking the PR command.
   - If interactive login is required, initiate the supported `az` login flow and state that user interaction is required.
6. Resolve Azure DevOps org and project context.
   - Prefer inferring them from `git remote get-url origin`.
   - Fall back to Azure DevOps defaults only when remote inference is insufficient.
   - If neither inference nor defaults provide the required context, stop and report the missing values.
7. Perform a lightweight Azure DevOps validation command before `az repos pr create`.

## Remote Handling

Only continue automatically when the `origin` remote is an Azure DevOps remote. If the remote points somewhere else, stop with a precise incompatibility message instead of attempting Azure DevOps PR creation.

When remote parsing is possible, prefer passing explicit org or project arguments to Azure CLI if defaults are absent or ambiguous.

## Failure Handling

- If `az --version` fails because Azure CLI config or profile files are unreadable, treat this as a configuration failure and report it clearly.
- If Azure CLI can be found but not executed successfully, treat it as broken and repair it if possible instead of assuming it is usable.
- If login, device code flow, or browser auth is required, surface that pause explicitly.
- If the Azure DevOps extension install fails, stop and report the failing command rather than continuing with partial setup.
- If package-manager installation cannot be completed automatically, stop and report that manual installation is required.

## Windows Install Helper

For Windows environments, use [scripts/install-azure-cli.ps1](../scripts/install-azure-cli.ps1) to install Azure CLI with the first supported package manager found:

- `winget`
- `choco`

The script should only be used for installation and post-install validation. It does not handle Azure DevOps login or default configuration.

Use [scripts/install-azure-devops-extension.ps1](../scripts/install-azure-devops-extension.ps1) to install or update the `azure-devops` Azure CLI extension and validate that Azure CLI can resolve it afterward.
