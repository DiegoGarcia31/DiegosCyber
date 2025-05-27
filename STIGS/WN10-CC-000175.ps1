<#
.SYNOPSIS
    This PowerShell script ensures that Windows Compatibility Telemetry Inventory is disabled by setting a specific registry key.

.NOTES
    Author          : Diego Garcia 
    LinkedIn        : https://www.linkedin.com/in/diego-garcia-022b802b1/
    GitHub          : https://github.com/DiegoGarcia31
    Date Created    : 2025-26-05
    Last Modified   : 2025-26-05
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000175

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\__remediation_template(WN10-CC-000175).ps1 
#>

# YOUR CODE GOES HERE# Define the registry path
$registryPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\AppCompat"

# Create the registry key if it doesn't exist
if (-not (Test-Path $registryPath)) {
    New-Item -Path $registryPath -Force
}

# Set the DisableInventory DWORD value to 1
New-ItemProperty -Path $registryPath -Name "DisableInventory" -PropertyType DWord -Value 1 -Force

