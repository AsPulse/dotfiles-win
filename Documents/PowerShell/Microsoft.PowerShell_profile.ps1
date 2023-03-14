Set-PSReadLineKeyHandler -Key Tab -Function MenuComplete

$NVIM = "$HOME\AppData\Local\nvim"
$REPODIR = "$HOME\Repositories"
$CHEZMOI= "$HOME\.local\share\chezmoi"

$ENV:HOME = $HOME
$ENV:POSH_PROFILE = $PROFILE
$ENV:NVIM = $NVIM
$ENV:REPODIR = $REPODIR
$ENV:CHEZMOI = $CHEZMOI

$ENV:STARSHIP_CONFIG = "$HOME\.config\starship.toml"
$ENV:STARSHIP_DISTRO = "者"
$ENV:GH_EDITOR = "nvim"

$ENV:Path="C:\Users\aspulse\scoop\apps\gcloud\420.0.0\bin;"+$ENV:Path

$ENV:NEOVIDE_MULTIGRID = "true"

Invoke-Expression (&starship init powershell)

Import-Module 'C:\Users\aspulse\bin\posh-git\src\posh-git.psd1'
Import-Module yarn-completion
Import-Module Terminal-Icons

Set-Alias v neovide
Set-Alias vim nvim
function dotfiles {
  chezmoi add "~\.skk\CorvusSKK\userdict.txt"
  chezmoi add "~\.skk\neovim-userdict.txt"
  chezmoi apply
}
Set-Alias touch New-Item
function importgconfig {
  git config --local include.path ../.gitconfig
}


Set-Alias grep mygrep #Select-String
function mygrep {
  $OutputEncoding = [Console]::InputEncoding = [Console]::OutputEncoding = [Text.Encoding]::GetEncoding('sjis')
  $input | findstr /n /i $args
}


function power-silent {
  powercfg /S 57008c12-aa5e-44bc-b0e9-672b7838ce56
  echo "PowerConfig is now Silent mode!"
}

function power-normal {
  powercfg /S 04bd114b-dafa-4090-bc3b-6841c767808d
  echo "PowerConfig is now Normal mode!"
}
