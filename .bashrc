#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export LS_COLORS='di=36:fi=0:ln=0:pi=0:so=0:do=0:bd=0:cd=0:or=0:mi=0:su=0:sg=0:tw=0:ow=0:st=0:ex=0'
alias ls='ls --color=auto --group-directories-first'
alias grep='grep --color=auto'
PS1='\w > '

# scripts
# --------------------------------------------------------------------------

# copy dotfiles to repo directory
# --------------------------------------------------------------------------
dotdirs=(
    ~/.bashrc
    ~/.config/dunst/
    ~/.config/fastfetch/
    ~/.config/kitty/
    ~/.config/mpd/
    ~/.config/mpv/
    ~/.config/nvim/
    ~/.config/qimgv/
    ~/.config/rmpc/
    ~/.config/rofi
    ~/.config/sioyek/
    ~/.config/sway/
    ~/.config/tmux/
    ~/.config/waybar/
    ~/.config/yazi/
    ~/.config/zathura/
    ~/.inputrc
)

dots() {
    local target=~/sway

    mkdir -p "$target"

    for dir in "${dotdirs[@]}"; do
        if [ -e "$dir" ]; then
            # Remove only the stale copy of this dir, leaving .git, README, etc. alone
            rm -rf "${target:?}/$(basename "$dir")"
            cp -r "$dir" "$target/"
        else
            echo "Warning: '$dir' does not exist or is not a directory"
        fi
    done
}
# rename apps
# --------------------------------------------------------------------------
alias neofetch='fastfetch'
alias cmatrix='unimatrix -s 90 -f -a -l nk'
alias fastfetchimage='fastfetch --logo-type kitty-icat --logo "$(find ~/.config/fastfetch/ -type f | fzf)" --logo-width 23 --logo-height 13'
alias bedit='nvim ~/.bashrc'
alias n='nvim'

# git add, commit, push. takes input for commit message
# --------------------------------------------------------------------------
gacp() {
    if [ -z "$1" ]; then
        echo "❌ Commit message required."
        echo "Usage: gacp \"your commit message\""
        return 1
    fi

    git add .
    git commit -m "$1"
    git push
}

sync() {
    git add .
    git commit -m "$(date '+%Y-%m-%d %H:%M:%S')"
    git push
}

# fzf
# --------------------------------------------------------------------------
eval "$(fzf --bash)"
export FZF_DEFAULT_OPTS='-m --style full --bind 'ctrl-space:accept''
# bind -r '"\C-t"'

alias ffzf='fzf -m --preview "bat --style=numbers --color=always {}" --layout reverse'
alias nv='nvim "$(fzf -m --preview "bat --style=numbers --color=always {} | head -n 100" --layout reverse)"'
alias mmpv='mpv "$(fzf --query ".mp4$ | .mkv$ " --layout reverse)"'
alias headlessmmpv='mpv --audio-display=no "$(fzf)"'

# hdd
# --------------------------------------------------------------------------
alias mounthdd='sudo mount -t ntfs-3g /dev/sda2 /mnt/hdd/; cd /mnt/hdd'
alias umounthdd='cd && sudo umount /mnt/hdd/'
alias hdd='cd /mnt/hdd'
alias mountssd='sudo mount /dev/sdb2 /mnt/ssd/; cd /mnt/ssd'
alias ssd='cd /mnt/ssd'

alias mountssdstorage='sudo mount /dev/sdb4 /mnt/ssd-storage; cd /mnt/ssd-storage'

alias mountgames='sudo mount /dev/sdb4 /home/tom/games/steamLibrary'
# alias mountgames='sudo mount /dev/sdb4 /mnt/ssd'
alias umountgames='sudo umount /home/tom/games/steamLibrary'

# ssh
# --------------------------------------------------------------------------
alias conectarssh='eval "$(ssh-agent -s)"; ssh-add ~/.ssh/id_ed25519'

# clipboard
# --------------------------------------------------------------------------
alias clip='wl-copy'

# misc
# --------------------------------------------------------------------------
## restart hyprpaper
rhp() {
    killall hyprpaper
    nohup hyprpaper > /dev/null 2>&1 &
}

## restart hyprsunset
rhs() {
    killall hyprsunset
    nohup hyprsunset > /dev/null 2>&1 &
}

## app setups
eval "$(zoxide init --cmd cd bash)"
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

## opening pdf, cbr, cbz, etc
pdf() {
    local file
    local SEARCH_DIR="${1:-.}"
    file=$(find "$SEARCH_DIR" -type f \( -iname "*.pdf" -o -iname "*.cbr" -o -iname "*.cbz" -o -iname "*.epub" \) | fzf)
    if [[ -n "$file" ]]; then
        nohup zathura "$file" >/dev/null 2>&1 &
    fi
}

# yazi setup
# --------------------------------------------------------------------------
function y() {
    local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
    yazi "$@" --cwd-file="$tmp"
    IFS= read -r -d '' cwd < "$tmp"
    [ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
    rm -f -- "$tmp"
}

# temp
# --------------------------------------------------------------------------
alias cn='cd ~/notes && y'
alias notes='cd ~/notes && nvim'
alias links='cd ~/notes && nvim links.md'
alias later='cd ~/notes/later/ && yazi'
alias empty='rm -rf ~/.local/share/Trash/*'

# Created by `pipx` on 2026-01-17 21:57:56
export PATH="$PATH:/home/tom/.local/bin"
export PATH="$PATH:/usr/bin/cava"
export PATH="$PATH:/usr/bin/ffmpeg"

compare() {
    if [ "$#" -ne 2 ]; then
        echo "Uso: compare archivo1 archivo2"
        return 1
    fi
    
    diff -u "$1" "$2" | bat -l diff
}
#sudo pacman -S bash-completion
[[ -r /usr/share/bash-completion/bash_completion ]] && . /usr/share/bash-completion/bash_completion

# history
# ---------------------------------------------------------------------------
# dont record duplicate lines
HISTCONTROL=ignoreboth:erasedups
# large history
HISTSIZE=100000
HISTFILESIZE=200000
# single shared history
# PROMPT_COMMAND="history -a; history -c; history -r${PROMPT_COMMAND:+; $PROMPT_COMMAND}"

# to trim the path:
# PROMPT_DIRTRIM=3
