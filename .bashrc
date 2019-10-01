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

#Generic shortcuts:
alias music="ncmpcpp"
alias clock="ncmpcpp -s clock"
alias visualizer="ncmpcpp -s visualizer"
alias news="newsboat"
alias email="neomutt"
alias audio="ncpamixer"
alias getmail="offlineimap && notmuch new"

# System Maintainence
alias progs="pacman -Qet" # List programs I've installed
alias orphans="pacman -Qdt" # List orphan programs
alias upgr="neofetch && sudo pacman -Syyu --noconfirm && echo Update complete."
alias sydtime="sudo timedatectl set-timezone Australia/Sydney && i3 restart" # Eastcoast time
alias sdn="sudo shutdown now"
alias newnet="sudo systemctl restart NetworkManager" # Refresh wifi
alias nf="clear && neofetch" # Le Redditfetch
#Install an AUR package manually (for Parabola to get AUR access):
aurinstall() { curl -O https://aur.archlinux.org/cgit/aur.git/snapshot/$1.tar.gz && tar -xvf $1.tar.gz && cd $1 && makepkg --noconfirm -si && cd .. && rm -rf $1 $1.tar.gz ;}
alias psref="gpg-connect-agent RELOADAGENT /bye" # Refresh gpg

# Some aliases
alias r="ranger"
alias sr="sudo ranger"
alias ka="killall"
alias g="git"
alias gitup="git push origin master"
alias gitpass="git config --global credential.helper cache"
alias bars="bash ~/.config/polybar/launch.sh" # Run Polybar relaunch script
weath() { curl wttr.in/$1 ;} # Check the weather (give city or leave blank).

# Adding color
alias ls='ls -hN --color=auto --group-directories-first'
alias grep="grep --color=always" # Color grep - highlight desired sequence.
alias ccat="highlight --out-format=xterm256" #Color cat - print file with syntax highlighting.

# Laptop management
alias lsc="screen.sh l" # Use laptop screen only
alias vsc="screen.sh v" # Use VGA only
alias dsc="screen.sh d" # Use both laptop and VGA screen
alias debase="sudo umount /home/Shared/Videos & screen.sh l && i3 restart" # Prep for taking my ThinkPad off Ultrabase

# Internet
alias yt="youtube-dl --add-metadata -ic" # Download video link
alias yta="youtube-dl --add-metadata -xic" # Download only audio
alias YT="youtube-viewer"
alias ethspeed="speedometer -r enp2s0"
alias wifispeed="speedometer -r wlp1s0"
alias starwars="telnet towel.blinkenlights.nl"

# Audio and Music
alias mute="pamixer -m"
alias unmute="pamixer -u"
alias vu="pamixer --allow-boost -i 5"
alias vd="pamixer --allow-boost -d 5"
alias pause="mpc toggle"
alias next="mpc next"
alias prev="mpc prev"
alias trupause="mpc pause"
alias beg="mpc seek 0%"
alias lilbak="mpc seek -10"
alias lilfor="mpc seek +10"
alias bigbak="mpc seek -120"
alias bigfor="mpc seek +120"

export TIMEWARRIORDB=~/Dropbox/.timewarrior
export VISUAL="nvim"
shdl() { curl -O $(curl -s http://sci-hub.tw/"$@" | grep location.href | grep -o http.*pdf) ;}
source /home/alex/.bash_shortcuts
