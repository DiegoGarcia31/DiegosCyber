<#
.SYNOPSIS
    This PowerShell script ensures that Windows 10 systems require a BitLocker PIN for pre-boot authentication by setting the necessary BitLocker policy registry values.

.NOTES
    Author          : Diego Garcia
    LinkedIn        : https://www.linkedin.com/in/diego-garcia-022b802b1/
    GitHub          : https://github.com/DiegoGarcia31
    Date Created    : 2025-04-29
    Last Modified   : 2025-04-29
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-00-000031

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\__remediation_template(STIG-ID-WN10-00-000031).ps1 
#>
# Define the registry path
$registryPath = "HKLM:\SOFTWARE\Policies\Microsoft\FVE"

# Check if the registry path exists, if not, create it
if (-not (Test-Path $registryPath)) {
    New-Item -Path $registryPath -Force
}

# Set UseAdvancedStartup to 1
New-ItemProperty -Path $registryPath -Name "UseAdvancedStartup" -PropertyType DWord -Value 1 -Force

# Set UseTPMPIN to 1
New-ItemProperty -Path $registryPath -Name "UseTPMPIN" -PropertyType DWord -Value 1 -Force

# Set UseTPMKeyPIN to 1
New-ItemProperty -Path $registryPath -Name "UseTPMKeyPIN" -PropertyType DWord -Value 1 -Force

Write-Output "BitLocker registry settings applied successfully."
