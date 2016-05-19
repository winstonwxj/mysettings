﻿. C:\Dropbox\mysettings\PowerShell\variables.ps1

$quickHelperLinkName ="QuickHelper.lnk"

IF(-not (Test-Path "${env:StartUpDirectory}\${quickHelperLinkName}")){
    New-Item -ItemType SymbolicLink `
        -Path "${env:StartUpDirectory}" `
        -Name "${quickHelperLinkName}"`
        -Value "${env:DropboxTools}\QuickHelper\QuickHelper.exe"
}

IF(-not (Test-Path "${env:USERPROFILE}\Documents\WindowsPowerShell\")){
	New-Item -ItemType directory -Path "${env:USERPROFILE}\Documents\WindowsPowerShell\"
}

Copy-Item "${env:DropboxSettingsPSHost}\profile.ps1" `
    -Destination "${env:USERPROFILE}\Documents\WindowsPowerShell\profile.ps1" `
    -Force

Copy-Item "${env:DropboxSettingsPSHost}\Microsoft.PowerShell_profile.ps1" `
    -Destination "${env:USERPROFILE}\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1" `
    -Force

Copy-Item "${env:DropboxSettingsVim}\host_vimrc"`
    -Destination "${env:USERPROFILE}\_vimrc" `
    -Force

Copy-Item "${env:DropboxSettingsVim}\host_vsvimrc" `
    -Destination "${env:USERPROFILE}\_vsvimrc" `
    -Force

Copy-Item "${env:DropboxSettingsVim}\host_gvimrc" `
    -Destination "${env:USERPROFILE}\_gvimrc" `
    -Force

if ($host.Name -eq 'ConsoleHost')
{
    Import-Module PSReadline -Force
}

Install-Module posh-git

