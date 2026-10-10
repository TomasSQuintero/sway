#
# ~/.zshrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return


# ----------------------------------------------------------------------------
# PATH / environment
# ----------------------------------------------------------------------------
typeset -U path   # keep PATH free of duplicates

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# Created by `pipx` on 2026-01-17 21:57:56
export PATH="$PATH:/home/tom/.local/bin"
# (these two are binaries, not directories, so they have no effect on PATH)
export PATH="$PATH:/usr/bin/cava"
export PATH="$PATH:/usr/bin/ffmpeg"


# ----------------------------------------------------------------------------
# History (single shared history, no duplicates)
# ----------------------------------------------------------------------------
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000

setopt SHARE_HISTORY            # share history live across all terminals
setopt EXTENDED_HISTORY         # store timestamps and durations
setopt HIST_IGNORE_ALL_DUPS     # remove older copy when a command is repeated
setopt HIST_FIND_NO_DUPS        # don't show duplicates when searching
setopt HIST_IGNORE_SPACE        # commands starting with a space aren't saved
setopt HIST_REDUCE_BLANKS       # trim extra whitespace


# ----------------------------------------------------------------------------
# Completion
# ----------------------------------------------------------------------------
autoload -Uz compinit && compinit

# Case-insensitive tab completion ("documents" matches "Documents")
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

# Case-insensitive globbing: ls doc* matches Documents
setopt NO_CASE_GLOB


# ----------------------------------------------------------------------------
# Prompt and cursor
# ----------------------------------------------------------------------------
# Option 1: ~/.config/sway>
PROMPT='%~ > '
# To trim long paths (like PROMPT_DIRTRIM=3 in bash), use: PROMPT='%3~ > '

# Underscore cursor (3 = blinking underscore, 4 = steady underscore)
_set_cursor() { printf '\e[3 q' }
precmd_functions+=(_set_cursor)


# ----------------------------------------------------------------------------
# Colors
# ----------------------------------------------------------------------------
# export LS_COLORS='di=36:fi=0:ln=0:pi=0:so=0:do=0:bd=0:cd=0:or=0:mi=0:su=0:sg=0:tw=0:ow=0:st=0:ex=0'
alias ls='ls --color=auto --group-directories-first'
alias grep='grep --color=auto'


# ----------------------------------------------------------------------------
# Aliases: apps
# ----------------------------------------------------------------------------
alias n='nvim'
alias zedit='nvim ~/.zshrc'
alias neofetch='fastfetch'
alias cmatrix='unimatrix -s 90 -f -a -l nk'
alias fastfetchimage='fastfetch --logo-type kitty-icat --logo "$(find ~/.config/fastfetch/ -type f | fzf)" --logo-width 23 --logo-height 13'
alias clip='wl-copy'


# ----------------------------------------------------------------------------
# fzf
# ----------------------------------------------------------------------------
source <(fzf --zsh)
export FZF_DEFAULT_OPTS='-m --style full --bind ctrl-space:accept'
# bindkey -r '^T'
# alias ffzf='fzf -m --preview "bat --style=numbers --color=always {}" --layout reverse'
# alias nv='nvim "$(fzf -m --preview "bat --style=numbers --color=always {} | head -n 100" --layout reverse)"'
# alias mmpv='mpv "$(fzf --query ".mp4$ | .mkv$ " --layout reverse)"'
# alias headlessmmpv='mpv --audio-display=no "$(fzf)"'


# ----------------------------------------------------------------------------
# Git
# ----------------------------------------------------------------------------
# git add, commit, push. takes input for commit message
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

# git add, commit, push. commit message is date and time
sync() {
    git add .
    git commit -m "$(date '+%Y-%m-%d %H:%M:%S')"
    git push
}


# ----------------------------------------------------------------------------
# Dotfiles: copy to repo directory
# ----------------------------------------------------------------------------
dotdirs=(
    ~/.zshrc
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


# ----------------------------------------------------------------------------
# Drives
# ----------------------------------------------------------------------------
alias mounthdd='sudo mount -t ntfs-3g /dev/sda2 /mnt/hdd/; cd /mnt/hdd'
alias umounthdd='cd && sudo umount /mnt/hdd/'
alias hdd='cd /mnt/hdd'

alias mountssd='sudo mount /dev/sdb2 /mnt/ssd/; cd /mnt/ssd'
alias ssd='cd /mnt/ssd'

alias mountssdstorage='sudo mount /dev/sdb4 /mnt/ssd-storage; cd /mnt/ssd-storage'

alias mountgames='sudo mount /dev/sdb4 /home/tom/games/steamLibrary'
# alias mountgames='sudo mount /dev/sdb4 /mnt/ssd'
alias umountgames='sudo umount /home/tom/games/steamLibrary'


# ----------------------------------------------------------------------------
# SSH
# ----------------------------------------------------------------------------
alias conectarssh='eval "$(ssh-agent -s)"; ssh-add ~/.ssh/id_ed25519'


# ----------------------------------------------------------------------------
# Misc functions
# ----------------------------------------------------------------------------
# restart hyprpaper
rhp() {
    killall hyprpaper
    nohup hyprpaper > /dev/null 2>&1 &!
}

# restart hyprsunset
rhs() {
    killall hyprsunset
    nohup hyprsunset > /dev/null 2>&1 &!
}

# open pdf, cbr, cbz, epub
pdf() {
    local file
    local SEARCH_DIR="${1:-.}"
    file=$(find "$SEARCH_DIR" -type f \( -iname "*.pdf" -o -iname "*.cbr" -o -iname "*.cbz" -o -iname "*.epub" \) | fzf)
    if [[ -n "$file" ]]; then
        nohup zathura "$file" >/dev/null 2>&1 &!
    fi
}


# ----------------------------------------------------------------------------
# yazi (cd to the directory you quit in)
# ----------------------------------------------------------------------------
y() {
    local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
    yazi "$@" --cwd-file="$tmp"
    IFS= read -r -d '' cwd < "$tmp"
    [ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
    rm -f -- "$tmp"
}


# ----------------------------------------------------------------------------
# Notes / temp
# ----------------------------------------------------------------------------
alias empty='rm -rf ~/.local/share/Trash/*'


# ----------------------------------------------------------------------------
# zoxide (needs compinit to have run first)
# ----------------------------------------------------------------------------
eval "$(zoxide init --cmd cd zsh)"


# ----------------------------------------------------------------------------
# Plugins (keep syntax-highlighting LAST)
# ----------------------------------------------------------------------------
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
