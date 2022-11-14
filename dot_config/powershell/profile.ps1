# -*-mode:powershell-*- vim:ft=ps1

# ~/.config/powershell/profile.ps1
# =============================================================================
# Executed when PowerShell starts.
#
# On Windows, this file will be copied over to these locations after
# running `chezmoi apply` by the script `../../run_powershell.bat.tmpl`:
#     - %USERPROFILE%\Documents\PowerShell
#     - %USERPROFILE%\Documents\WindowsPowerShell
#
# IMPORTANT: do not try to edit $PROFILE or similar as it will be clobbered.
#
# See https://docs.microsoft.com/en/powershell/module/microsoft.powershell.core/about/about_profiles

# Determine user profile parent directory.
$ProfilePath=Split-Path -parent $profile

# Load functions declarations from separate configuration file.
if (Test-Path $ProfilePath\functions.ps1) {
    . "$ProfilePath\functions.ps1"
}

Import-Module DirColors

# Set GNUPGHOME if the gnupg directory exists.
if (Test-Path "$env:AppData\gnupg") {
    $env:GNUPGHOME = "$env:AppData\gnupg"
    [System.Environment]::SetEnvironmentVariable('GNUPGHOME', $env:GNUPGHOME)
}

# Load completion configuration files.
Get-ChildItem -Path $ProfilePath\* -Include *-completion.ps1 -Name | ForEach-Object {
    . "$ProfilePath\$_"
}

# Load alias definitions from separate configuration file.
if (Test-Path $ProfilePath\aliases.ps1) {
    . "$ProfilePath\aliases.ps1"
}

# Configure editor for various tasks
if (Get-Command "nvim" -ErrorAction "Ignore") {
    $env:EDITOR = "nvim"
    $env:VISUAL = "nvim"
}

$env:STARSHIP_CONFIG = "$HOME\.config\starship.toml"

$env:XDG_CACHE_HOME = "$HOME\.cache"
$env:XDG_CONFIG_HOME = "$HOME\.config"
$env:XDG_DATA_HOME = "$HOME\.local\share"
[System.Environment]::SetEnvironmentVariable('XDG_CACHE_HOME', $env:XDG_CACHE_HOME)
[System.Environment]::SetEnvironmentVariable('XDG_CONFIG_HOME', $env:XDG_CONFIG_HOME)
[System.Environment]::SetEnvironmentVariable('XDG_DATA_HOME', $env:XDG_DATA_HOME)

Invoke-Expression (&starship init powershell)
