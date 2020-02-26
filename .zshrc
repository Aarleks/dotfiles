# Hand rolled .zsh

# Features:
#   - Autocompletion
#   - Syntax highlighting
#   - Git branch info in the promp

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

autoload -U colors && colors

autoload -Uz vcs_info

zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' disable-patterns "${(b)HOME}/code/portal(|-ee)(|/*)"
zstyle ':vcs_info:*' stagedstr "%F{green}● %f"
zstyle ':vcs_info:*' unstagedstr "%F{red}● %f"
zstyle ':vcs_info:*' use-simple true
zstyle ':vcs_info:git+set-message:*' hooks git-untracked
zstyle ':vcs_info:git*:*' formats '%F{61} %b%f%m%c%u'
zstyle ':vcs_info:git*:*' actionformats ' %b %m%u%c'

# Check for untracked files.
function +vi-git-untracked() {
  emulate -L zsh
  if [[ -n $(git ls-files --others --exclude-standard 2> /dev/null) ]]; then
      hook_com[unstaged]+="%F{33}● %f"
  fi
}

# Prompt
PS1="
%B%F{166}%n%f%F{white}@%f%F{136}%m%f %F{33}%1~%f
\${vcs_info_msg_0_} ->%b "

RPROMPT='%F{33}%~'

setopt PROMPT_SUBST

add-zsh-hook precmd vcs_info

HISTSIZE=10000
if (( ! EUID )); then
    HISTFILE=~/.historyroot
else
    HISTFILE=~/.history
    fi

SAVEHIST=5000
setopt SHARE_HISTORY
setopt HIST_IGNORE_ALL_DUPS

setopt auto_cd
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=yellow'
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:}=* r:|=*'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
setopt completealiases
zstyle ':completion:*' menu select
zmodload zsh/complist
_comp_options+=(globdots)		# Include hidden files.
autoload -Uz compinit
compinit

bindkey -v
export KEYTIMEOUT=1

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char
bindkey '^[[Z' autosuggest-accept

# Use lf to switch directories and bind it to ctrl-o
lfcd () {
    tmp="$(mktemp)"
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp"
        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
    fi
}
bindkey -s '^o' 'lfcd\n'

alias ls='ls -hN --color=auto --group-directories-first'

# Functions
[ -f "$HOME/.config/functionsrc" ] && source "$HOME/.config/functionsrc"

# Aliases
[ -f "$HOME/.config/aliasrc" ] && source "$HOME/.config/aliasrc"

# Shortcuts
[ -f "$HOME/.config/shortcutsrc" ] && source "$HOME/.config/shortcutsrc"

# fff stuffs
export FFF_COL1=4 # directory colour = blue
export FFF_COL2=6 # status colour = light blue
export FFF_COL4=4 # cursor colour = blue
export FFF_FILE_FORMAT="\t%f"

# nnn stuffs
export NNN_BMS="D:~/Downloads"
