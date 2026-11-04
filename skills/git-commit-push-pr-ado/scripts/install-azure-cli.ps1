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

function Invoke-Install {
    param(
        [Parameter(Mandatory = $true)]
        [string]$Command,

        [Parameter(Mandatory = $true)]
        [string[]]$Arguments
    )

    Write-Host "Running: $Command $($Arguments -join ' ')"
    & $Command @Arguments
    if ($LASTEXITCODE -ne 0) {
        throw "Installation command failed with exit code $LASTEXITCODE."
    }
}

if (Test-Command -Name 'az') {
    try {
        & az --version | Out-Null
        if ($LASTEXITCODE -eq 0) {
            Write-Host 'Azure CLI is already installed and runnable.'
            exit 0
        }
    } catch {
        Write-Warning "Azure CLI is present but not runnable: $($_.Exception.Message)"
    }
}

$installed = $false

if (Test-Command -Name 'winget') {
    Invoke-Install -Command 'winget' -Arguments @(
        'install',
        '--exact',
        '--id', 'Microsoft.AzureCLI',
        '--accept-package-agreements',
        '--accept-source-agreements'
    )
    $installed = $true
} elseif (Test-Command -Name 'choco') {
    Invoke-Install -Command 'choco' -Arguments @(
        'install',
        'azure-cli',
        '-y'
    )
    $installed = $true
}

if (-not $installed) {
    throw 'Azure CLI installation failed: no supported package manager was found. Expected winget or choco.'
}

$azCommand = Get-Command az -ErrorAction SilentlyContinue
if (-not $azCommand) {
    throw 'Azure CLI installation reported success, but `az` is still not on PATH in the current session.'
}

& az --version
if ($LASTEXITCODE -ne 0) {
    throw 'Azure CLI installation completed, but `az --version` still failed.'
}

Write-Host 'Azure CLI installed successfully.'
