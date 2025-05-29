
.SYNOPSIS
    This PowerShell script ensures that Windows 10 systems require a BitLocker PIN for pre-boot authentication by setting the necessary BitLocker policy registry values.

.NOTES
    Author          : Diego Garcia
    LinkedIn        : https://www.linkedin.com/in/diego-garcia-022b802b1/
    GitHub          : https://github.com/DiegoGarcia31
    Date Created    : 2025-05-29
    Last Modified   : 2025-05-29
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000230

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\__remediation_template(STIG-ID-WN10-CC-000230).ps1 
#># Define registry paths and values
$basePath = "HKLM:\SOFTWARE\Policies\Microsoft\MicrosoftEdge"
$phishingPath = "$basePath\PhishingFilter"
$name = "PreventOverride"
$value = 1

# Create the registry path if it doesn't exist
if (-not (Test-Path $phishingPath)) {
    New-Item -Path $phishingPath -Force | Out-Null
}

# Set the registry value
Set-ItemProperty -Path $phishingPath -Name $name -Value $value -Type DWord
