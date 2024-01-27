# Install PowerShell Modules
$modules = @(
    'PSReadLine',
    'PoshGram',
    'z',
    'Recycle',
    'PSCalendar',
    'PSFzf',
    'Terminal-Icons',
    'MyTasks',
    'interval-timer',
    'PsIni'
)

foreach ($module in $modules) {
    $moduleExist = Get-Module -ListAvailable -Name $module

    if (!$moduleExist) {
        Install-Module -Name $module
    } else {
        Write-Host "The module $module exists"
    }
}