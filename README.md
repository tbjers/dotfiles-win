# Powershell dotfiles

Chezmoi-based dotfiles for Windows PowerShell, Starship, and Scoop.

## installation

Run the following command to set up a new system:

```powershell
iwr -useb https://raw.githubusercontent.com/tbjers/dotfiles-win/main/dot_config/powershell/setup.ps1 | iex
```

Once the prerequisite tools have been installed, restart the terminal and run the following:

```powershell
chezmoi init tbjers/dotfiles-win --apply
```
