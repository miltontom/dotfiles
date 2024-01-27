function vf {
    nvim $(fzf)
}

function vp {
    vim $PROFILE
}

function vs {
    vim $env:STARSHIP_CONFIG
}

function src {
    . $PROFILE
}

function restart {
    Restart-Computer    
}

function poweroff {
    Stop-Computer -ComputerName localhost
}

# Reload the shell
function Reload-Powershell {
    $newProcess = new-object System.Diagnostics.ProcessStartInfo "pwsh"
    $newProcess.Arguments = "-nologo"
    [System.Diagnostics.Process]::Start($newProcess)
    exit
}

function CreateAndSet-Directory([String] $path) {
    New-Item $path -ItemType Directory -ErrorAction SilentlyContinue | Out-Null
    Set-Location $path
}

function trash {
  #Start-Process shell:RecycleBinFolder
  Get-RecycledItem | Select-Object Name, ModifyDate, IsFolder
}
