Clear-Host

. $PSScriptRoot\env.ps1
. $PSScriptRoot\aliases.ps1
. $PSScriptRoot\functions.ps1

Import-Module PSFzf
Import-Module Terminal-Icons
Import-Module PSReadLine

# Get-Content $HOME\art.txt | Write-Host -ForegroundColor Magenta

#C:\Users\Milton\Desktop\PowerShell\PSArt\amongus.ps1

#oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\fishmod.omp.json" | Invoke-Expression

### PSReadLine ###
#Set-PSReadLineKeyHandler -Chord 'Ctrl+d' -Function Deletechar
Set-PSReadLineKeyHandler -Key Tab -Function MenuComplete
# Shows navigable menu of all options when hiting tab
Set-PSReadLineKeyHandler -Key Tab -Function Complete

Set-PSReadLineOption -EditMode Windows

#Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward
#Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward
Set-PSReadLineKeyHandler -Key 'Ctrl+p' -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Key 'Ctrl+n' -Function HistorySearchForward

# Make it bash
Set-PSReadLineKeyHandler -Key 'Ctrl+u' -Function BackwardDeleteInput
Set-PSReadLineKeyHandler -Key 'Ctrl+k' -Function ForwardDeleteInput
Set-PSReadLineKeyHandler -Key 'Ctrl+a' -Function BeginningOfLine
Set-PSReadLineKeyHandler -Key 'Ctrl+e' -Function EndOfLine
#Set-PSReadLineKeyHandler -Key 'Ctrl+k' -Function ForwardChar
#Set-PSReadLineKeyHandler -Key 'Ctrl+j' -Function BackwardChar

Set-PSReadLineOption -ShowToolTips
Set-PSReadLineOption -PredictionSource History
#Set-PSReadLineOption -PredictionSource None
# User F2 to switch between view style
Set-PSReadLineOption -PredictionViewStyle ListView
#Set-PSReadLineOption -PredictionViewStyle InlineView

Set-PSReadLineOption -Colors @{InlinePrediction = "`e[38;2;75;82;99m`e[4m"}
Set-PSReadLineOption -Colors @{ListPrediction = '#98c379'}
Set-PSReadLineOption -Colors @{ListPredictionSelected = "`e[38;2;171;178;191m`e[48;2;62;68;82m"}
#ListPredictionSelectedColor            : "`e[48;5;238m"

### PSFzf ###
Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+f' -PSReadlineChordReverseHistory 'Ctrl+r'
$commandOverride = [ScriptBlock]{ param($Location) Set-Location $Location }
Set-PsFzfOption -AltCCommand $commandOverride

# Starship prompt
Invoke-Expression (&starship init powershell)

winfetch
