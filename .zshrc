# Here is my .zshrc from scratch

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

autoload -U colors && colors

autoload -Uz vcs_info
#function precmd {
#    if [[ "$NEW_LINE" = true ]] then
#	print ""
#	if [[ "$DONE_PROMPT" != true ]] then
#	    PROMPT=$PROMPT2$PROMPT1
#	    DONE_PROMPT=true
#	    fi
#    else
#	    NEW_LINE=true
#    fi
#        # Load version control information
#	vcs_info
#}

zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' disable-patterns "${(b)HOME}/code/portal(|-ee)(|/*)"
zstyle ':vcs_info:*' stagedstr "%F{green}●%f"
zstyle ':vcs_info:*' unstagedstr "%F{red}●%f"
zstyle ':vcs_info:*' use-simple true
zstyle ':vcs_info:git+set-message:*' hooks git-untracked
#zstyle ':vcs_info:git*:*' formats 'on %b%m '
zstyle ':vcs_info:git*:*' formats 'on %F{61} %b%f%m%c%u'
zstyle ':vcs_info:git*:*' actionformats ' %b %m%u%c '

# Check for untracked files.
function +vi-git-untracked() {
  emulate -L zsh
  if [[ -n $(git ls-files --others --exclude-standard 2> /dev/null) ]]; then
      hook_com[unstaged]+="%F{33}●%f"
  fi
}

PS1="
%B%F{33}%~%f \${vcs_info_msg_0_}
->%b "
#PROMPT1='%B%F{166}%n%F{230}@%F{136}%m%b
#%B%F{230}in%f %F{green}%1~%f%F{230} on%f %F{magenta}${vcs_info_msg_0_}%F{230}$%f%b '
#PROMPT1='%B%F{cyan}${vcs_info_msg_0_}%F{red}%1~%F{white} %# %f%b'
#PROMPT2=$'%F{black}%{\e(0%}${(r:$COLUMNS::q:)}%{\e(B%}'
#PROMPT=$PROMPT1
RPROMPT='%T'

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
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:}=* r:|=*'
setopt completealiases
autoload -Uz compinit
compinit

bindkey -v
bindkey '^[[Z' autosuggest-accept


alias ls='ls -hN --color=auto --group-directories-first'
