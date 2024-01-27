# Create symlinks for all the config files

$configPaths = Get-Content $PSScriptRoot\links.json | ConvertFrom-Json

foreach ($config in $configPaths) {
    foreach ($file in $config.files) {
        $target = $file.target_path -replace '\$PSScriptRoot', $PSScriptRoot
        $link = "$(Invoke-Expression $file.link_path)"

        New-Item -Path $link -ItemType SymbolicLink -Value $target -Force | Out-Null
    }
}
