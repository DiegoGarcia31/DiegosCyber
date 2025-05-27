<#
.SYNOPSIS
   This PowerShell script disables automatic installation of Windows consumer apps and features like suggested apps and games to streamline and harden the system.

.NOTES
    Author          : Diego Garcia
    LinkedIn        : https://www.linkedin.com/in/diego-garcia-022b802b1/
    GitHub          : https://github.com/DiegoGarcia31
    Date Created    : 2025-27-05
    Last Modified   : 2025-27-05
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000197

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\__remediation_template(STIG-ID-WN10-CC-000197).ps1 
#>

 Define the registry path
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\CloudContent"

# Create the key if it doesn't exist
if (-not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force | Out-Null
}

# Set the DisableWindowsConsumerFeatures DWORD to 1
New-ItemProperty -Path $regPath -Name "DisableWindowsConsumerFeatures" -PropertyType DWord -Value 1 -Force
