<#
.SYNOPSIS
    This PowerShell script ensures that Structured Exception Handling Overwrite Protection (SEHOP) is enabled by setting the "DisableExceptionChainValidation" registry value to 0.

.NOTES
    Author          : Diego Garcia
    LinkedIn        : https://www.linkedin.com/in/diego-garcia-022b802b1/
    GitHub          : https://github.com/DiegoGarcia31
    Date Created    : 2025-04-28
    Last Modified   : 2025-04-28
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-00-000150 

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\__remediation_template(STIG-ID-WN10-AU-000500).ps1 
#>

 Define the registry path
$registryPath = "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Kernel"

# Check if the registry path exists, if not, create it
if (-not (Test-Path $registryPath)) {
    New-Item -Path $registryPath -Force
}

# Set the DisableExceptionChainValidation value to 0 (SEHOP enabled)
New-ItemProperty -Path $registryPath -Name "DisableExceptionChainValidation" -PropertyType DWord -Value 0 -Force
