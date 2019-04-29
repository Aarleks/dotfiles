# Here is my .zshrc from scratch

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

autoload -U colors && colors

autoload -Uz vcs_info
setopt prompt_subst
function precmd {
    if [[ "$NEW_LINE" = true ]] then
	print ""
	if [[ "$DONE_PROMPT" != true ]] then
	    PROMPT=$PROMPT2$PROMPT1
	    DONE_PROMPT=true
	    fi
    else
	    NEW_LINE=true
    fi
        # Load version control information
	vcs_info
}


zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git:*' check-for-changes 'true'
zstyle ':vcs_info:git:*' formats ' %b %F{yellow}%m%f %u %c'
zstyle ':vcs_info:git:*' stagedstr '%F{blue} '
zstyle ':vcs_info:git:*' unstagedstr '%F{red}'
zstyle ':vcs_info:git*+set-message:*' hooks git-untracked

# Check for untracked files.
+vi-git-untracked() {
  if [[ -n "$(git ls-files --others --exclude-standard)" ]]; then
      hook_com[misc]=''
  else
      hook_com[misc]=''
      fi;
  }

PROMPT1='%B%F{red}%n%F{white}@%F{yellow}%m%b
%B%F{white}in%f %F{green}%1~%f%F{white} on%f %F{magenta}${vcs_info_msg_0_}%F{white}$%f%b '
#PROMPT1='%B%F{cyan}${vcs_info_msg_0_}%F{red}%1~%F{white} %# %f%b'
PROMPT2=$'%F{black}%{\e(0%}${(r:$COLUMNS::q:)}%{\e(B%}'
PROMPT=$PROMPT1
RPROMPT='%T'

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
