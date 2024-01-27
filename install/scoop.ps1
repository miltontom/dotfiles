# Install Scoop (if not already installed)
if (-not (Get-Command scoop -ErrorAction SilentlyContinue)) {
    Write-Host "Installing Scoop..."
    Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression
}

# setup scoop buckets before installing

$packages = @(
    '7zip' 
    'adb' 
    'broot'
    'chatgpt' 
    'cpufetch'
    'cwrsync'
    'delta'
    'duf'
    'dust'
    'fd'
    'figlet'
    'focus'
    'fzf'
    'gdb'
    'gh'
    'gibo'
    'glow'
    'gtypist'
    'hyperfine'
    'jdupes'
    'jq'
    'just'
    'lazygit'
    'lf' 
    'ln'
    'lua'
    'make'
    'meow'
    'nano'
    'neo-cowsay'
    'nodejs'
    'procs'
    'ripgrep'
    'runat' 
    'say'
    'sd'
    'speedtest-cli'
    'starship'
    'sudo'
    'touch'
    'tre-command'
    'unzip'
    'winfetch'
    'zip'
)

Write-Host "Checking if packages are already installed..."

$params = @{
    FilePath = "powershell"
    ArgumentList = "-Command $($PSScriptRoot)\private\get-scoop-apps.ps1"
    Wait = $true
    WindowStyle = "Hidden"
}
Start-Process @params

$installedLocalPackages = Get-Content $PSScriptRoot\apps
$installedPackagesCount = 0
foreach ($packageKey in $packages.Keys) {
    $isInstalled = $installedLocalPackages -contains $packageKey

    if ($packages[$packageKey] -and !$isInstalled) {
        $installedPackagesCount++
        $packageKey
    }
}

Remove-Item $PSScriptRoot\apps

Write-Host "Installed $installedPackagesCount/$($packages.Count) packages"
