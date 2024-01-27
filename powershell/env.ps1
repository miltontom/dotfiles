### lf ###
$env:EDITOR = "nvim"
#$env:PAGER = "bat"
$env:SHELL = "pwsh"
#$env:VISUAL = "code"    # has more precedence than $EDITOR

### Starship ####
$env:STARSHIP_CONFIG = "$HOME\.config\starship.toml"

### FZF ###
$env:FZF_DEFAULT_OPTS="
    --color=fg:white,fg+:cyan,bg+:-1,gutter:-1,border:black,pointer:white,marker:magenta,hl:red,hl+:red,prompt:green
    --multi
    --header=' '
    --border=rounded
    --border-label=''
    --reverse
    --height=50%
    --margin=5%
    --info=hidden
    --prompt=' '
    --pointer='▶'
    --marker=' •'
    --preview-window=hidden
    --preview='bat --style=numbers --color=always {}'
    --bind='ctrl-p:toggle-preview'
"
#★·•♥ ▍▐✪█❯➽
#--preview-window=70%"

### Git ###
$env:GIT_CONFIG_GLOBAL = "$HOME\.config\.gitconfig"

### Bat ###
$env:BAT_CONFIG_PATH = "$env:APPDATA\bat\config"
$env:BAT_THEME = "OneHalfDark"
$env:BAT_STYLE = "numbers,grid,changes"
