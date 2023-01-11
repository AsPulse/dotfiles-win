Set-PSReadLineKeyHandler -Key Tab -Function MenuComplete

$NVIM = "$HOME\AppData\Local\nvim"
$GHDEV = "E:\Persistent\GitHub-Develops"
$CHEZMOI= "$HOME\.local\share\chezmoi"

$ENV:POSH_PROFILE = $PROFILE
$ENV:NVIM = $NVIM
$ENV:GHDEV = $GHDEV
$ENV:CHEZMOI = $CHEZMOI

$ENV:STARSHIP_CONFIG = "$HOME\.config\starship.toml"
$ENV:STARSHIP_DISTRO = "者"
$ENV:GH_EDITOR = "nvim"

$ENV:NEOVIDE_MULTIGRID = "true"

Invoke-Expression (&starship init powershell)

Import-Module 'C:\Users\aspulse\bin\posh-git\src\posh-git.psd1'
Import-Module yarn-completion
Import-Module Terminal-Icons

Set-Alias v neovide
Set-Alias vim nvim

Set-Alias touch New-Item
function importgconfig {
  git config --local include.path ../.gitconfig
}


Set-Alias grep mygrep #Select-String
function mygrep {
    $OutputEncoding = [Console]::InputEncoding = [Console]::OutputEncoding = [Text.Encoding]::GetEncoding('sjis')
    $input | findstr /n /i $args
}

