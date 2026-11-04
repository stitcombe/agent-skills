[CmdletBinding()]
param()

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

function Test-Command {
    param(
        [Parameter(Mandatory = $true)]
        [string]$Name
    )

    return $null -ne (Get-Command $Name -ErrorAction SilentlyContinue)
}

function Invoke-Az {
    param(
        [Parameter(Mandatory = $true)]
        [string[]]$Arguments
    )

    Write-Host "Running: az $($Arguments -join ' ')"
    & az @Arguments
    if ($LASTEXITCODE -ne 0) {
        throw "Azure CLI command failed with exit code $LASTEXITCODE."
    }
}

if (-not (Test-Command -Name 'az')) {
    throw 'Azure CLI is not installed or not on PATH. Install Azure CLI before installing the azure-devops extension.'
}

$needsInstall = $false

try {
    & az extension show --name azure-devops | Out-Null
    if ($LASTEXITCODE -ne 0) {
        $needsInstall = $true
    }
} catch {
    $needsInstall = $true
}

if ($needsInstall) {
    Invoke-Az -Arguments @('extension', 'add', '--name', 'azure-devops')
} else {
    Invoke-Az -Arguments @('extension', 'update', '--name', 'azure-devops')
}

Invoke-Az -Arguments @('extension', 'show', '--name', 'azure-devops')
Write-Host 'Azure DevOps Azure CLI extension is installed and resolvable.'
