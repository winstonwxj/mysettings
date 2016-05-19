. C:\Dropbox\mysettings\PowerShell\variables.ps1

. ($PScript + "\common.functions.ps1")

. ($PScript + ".\git-alias.ps1")

. ($PScript + "\vim-editor.ps1")

. ($PScript + "\events.ps1")


function global:prompt {
  $cdelim = [ConsoleColor]::DarkCyan
  $chost = [ConsoleColor]::Green
  $cloc = [ConsoleColor]::Cyan

  write-host (split-path (pwd) -Qualifier ) -n -f $cloc
  Write-Host "\..\" -n -f $cloc
  write-host (split-path (pwd) -Leaf) -n -f $cloc

  Write-VcsStatus

  $global:LASTEXITCODE = $realLASTEXITCODE
  return "> "
}

if($global:poshSettings.lastDirectory){
    Set-Location $global:poshSettings.lastDirectory
}

Import-Module posh-git

. ($PScript + "\posh-git-config.ps1")

# PSReadline
#
Set-PSReadlineKeyHandler -Key Ctrl+Tab -Function PossibleCompletions
Set-PSReadlineKeyHandler -Key Tab -Function Complete


Write-Host "Dropbox profile loaded..."
