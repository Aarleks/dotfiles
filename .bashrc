stty -ixon
shopt -s autocd #Allows you to cd into directory merely by typing the directory name.

BASE03=$(tput setaf 8)
BASE02=$(tput setaf 0)
BASE01=$(tput setaf 10)
BASE00=$(tput setaf 11)
BASE0=$(tput setaf 12)
BASE1=$(tput setaf 14)
BASE2=$(tput setaf 7)
BASE3=$(tput setaf 15)
YELLOW=$(tput setaf 3)
ORANGE=$(tput setaf 9)
RED=$(tput setaf 1)
MAGENTA=$(tput setaf 5)
VIOLET=$(tput setaf 13)
BLUE=$(tput setaf 4)
CYAN=$(tput setaf 6)
GREEN=$(tput setaf 2)
BOLD=$(tput bold)
WHITE=$(tput setaf 15)
RESET=$(tput sgr0)

# Highlight the user name when logged in as root.
if [[ "${USER}" == "root" ]]; then
	userStyle="${RED}";
else
	userStyle="${ORANGE}";
fi;

# Highlight the hostname when connected via SSH.
if [[ "${SSH_TTY}" ]]; then
	hostStyle="${BOLD}${RED}";
else
	hostStyle="${YELLOW}";
fi;

# Set the terminal title and prompt.
PS1="\[${BOLD}\]"; # newline
PS1+="\[${hostStyle}\]\h: "; # host
PS1+="\[${userStyle}\]\u\n"; # username
PS1+="\[${WHITE}\] in ";
PS1+="\[${GREEN}\]\W"; # working directory abbreviated path
PS1+="\$(prompt_git \"\[${WHITE}\] on \[${VIOLET}\]\" \"\[${BLUE}\]\") "; # Git repository details
PS1+="\[${WHITE}\]\$ \[${RESET}\]"; # `$` (and reset color)
export PS1;

PS2="\[${yellow}\]→ \[${reset}\]";
export PS2;

# Some aliases
alias gitpass="git config --global credential.helper cache"
weath() { curl wttr.in/$1 ;} # Check the weather (give city or leave blank).

export VISUAL="nvim"
shdl() { curl -O $(curl -s http://sci-hub.tw/"$@" | grep location.href | grep -o http.*pdf) ;}
source /home/alex/.bash_shortcuts
source "$HOME/.cargo/env"
