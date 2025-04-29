<#
.SYNOPSIS
    This PowerShell script ensures that the system audits Account Management - User Account Management failures by enabling failure auditing for this subcategory.

.NOTES
    Author          : Diego Garcia
    LinkedIn        : https://www.linkedin.com/in/diego-garcia-022b802b1/
    GitHub          : https://github.com/DiegoGarcia31
    Date Created    : 2025-04-29
    Last Modified   : 2025-04-29
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-AU-000035

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\__remediation_template(STIG-ID-WN10-AU-000035).ps1 
#>

 Ensure the system audits User Account Management failures

# Check the current audit policy setting
$currentSetting = (AuditPol /get /subcategory:"User Account Management" | Select-String "User Account Management").ToString()

# If Failure auditing is not enabled, set it
if ($currentSetting -notmatch "Failure") {
    AuditPol /set /subcategory:"User Account Management" /failure:enable
    Write-Output "User Account Management failure auditing enabled."
} else {
    Write-Output "User Account Management failure auditing is already enabled."
}
