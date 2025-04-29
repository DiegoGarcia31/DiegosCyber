<#
.SYNOPSIS
    This PowerShell script ensures that camera access from the Windows lock screen is disabled by setting the "NoLockScreenCamera" registry value to 1

.NOTES
    Author          : Diego Garcia
    LinkedIn        : https://www.linkedin.com/in/diego-garcia-022b802b1/
    GitHub          : https://github.com/DiegoGarcia31
    Date Created    : 2025-04-29
    Last Modified   : 2025-04-29
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000005

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\__remediation_template(STIG-ID-WN10-CC-000005).ps1 
#>

 Define the registry path
$registryPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Personalization"

# Check if the registry path exists, if not, create it
if (-not (Test-Path $registryPath)) {
    New-Item -Path $registryPath -Force
}

# Set the NoLockScreenCamera value to 1 (disable camera on lock screen)
New-ItemProperty -Path $registryPath -Name "NoLockScreenCamera" -PropertyType DWord -Value 1 -Force
