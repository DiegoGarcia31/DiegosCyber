<#
.SYNOPSIS
    This PowerShell script enables auditing with subcategories by setting the "SCENoApplyLegacyAuditPolicy" registry value to 1, enforcing granular audit policies on Windows systems.

.NOTES
    Author          : Diego Garcia
    LinkedIn        : https://www.linkedin.com/in/diego-garcia-022b802b1/
    GitHub          : https://github.com/DiegoGarcia31/DiegosCyber/new/main
    Date Created    : 2025-04/28
    Last Modified   : 2054-04-28
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-SO-000030 

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\__remediation_template(STIG-ID-WN10-SO-000030 ).ps1 
#>

Define the registry path
$registryPath = "HKLM:\SYSTEM\CurrentControlSet\Control\Lsa"

# Check if the registry path exists, if not, create it
if (-not (Test-Path $registryPath)) {
    New-Item -Path $registryPath -Force
}

# Set the SCENoApplyLegacyAuditPolicy value to 1
New-ItemProperty -Path $registryPath -Name "SCENoApplyLegacyAuditPolicy" -PropertyType DWord -Value 1 -Force
