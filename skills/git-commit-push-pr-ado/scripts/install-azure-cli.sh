#!/usr/bin/env bash
# Install Azure CLI on macOS or Linux with the first supported package manager:
# Homebrew (macOS or Linux), then apt (Debian/Ubuntu, via Microsoft's install script).
# Installation and post-install validation only; no login or Azure DevOps configuration.
set -euo pipefail

if command -v az >/dev/null 2>&1; then
  if az --version >/dev/null 2>&1; then
    echo 'Azure CLI is already installed and runnable.'
    exit 0
  fi
  echo 'Warning: Azure CLI is present but not runnable. Reinstalling.' >&2
fi

if command -v brew >/dev/null 2>&1; then
  echo 'Running: brew install azure-cli'
  brew install azure-cli || brew reinstall azure-cli
elif command -v apt-get >/dev/null 2>&1; then
  # Microsoft's documented Debian/Ubuntu installer; needs sudo (may prompt for a password).
  echo 'Running: curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash'
  curl -fsSL https://aka.ms/InstallAzureCLIDeb | sudo bash
else
  echo 'Azure CLI installation failed: no supported package manager was found. Expected brew or apt-get.' >&2
  exit 1
fi

hash -r
if ! command -v az >/dev/null 2>&1; then
  echo 'Azure CLI installation reported success, but `az` is still not on PATH in the current session.' >&2
  exit 1
fi

if ! az --version; then
  echo 'Azure CLI installation completed, but `az --version` still failed.' >&2
  exit 1
fi

echo 'Azure CLI installed successfully.'
