<#
.SYNOPSIS
    This PowerShell script ensures that Windows Telemetry is not configured to Full by setting the "AllowTelemetry" registry value to 0, restricting data collection to Security-only.

.NOTES
    Author          : Diego Garcia
    LinkedIn        : https://www.linkedin.com/in/diego-garcia-022b802b1/
    GitHub          : https://github.com/DiegoGarcia31
    Date Created    : 2025-04-28
    Last Modified   : 2025-04-28
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000205 

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\__remediation_template(STIG-ID-WN10-CC-000205).ps1 
#>

 Define the registry path
$registryPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection"

# Check if the registry path exists, if not, create it
if (-not (Test-Path $registryPath)) {
    New-Item -Path $registryPath -Force
}

# Set the AllowTelemetry value to 0 (Security)
New-ItemProperty -Path $registryPath -Name "AllowTelemetry" -PropertyType DWord -Value 0 -Force
