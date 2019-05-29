stty -ixon
shopt -s autocd #Allows you to cd into directory merely by typing the directory name.

function ahead_behind {
	local count='';
	curr_branch=$(git rev-parse --abbrev-ref HEAD);
	curr_remote=$(git config branch.$curr_branch.remote);
	curr_merge_branch=$(git config branch.$curr_branch.merge | cut -d / -f 3);
	master_branch=$(git rev-list --left-right --count $curr_branch...$curr_remote/$curr_merge_branch | tr -s '\t' '|');
	if [ $(git rev-list upstream/master 2> /dev/null | wc -l; echo "$1") -gt 1 ]; then
		upstream="$(git rev-list --left-right --count master...upstream/master | awk '{print $2}')";
		if [ ${upstream} -gt 0 ]; then
			count+="$upstream|";
		fi;
	fi;
	if [ ${master_branch:0:1} -gt 0 ] || [ ${master_branch:2:3} -gt 0 ]; then
		count+="$master_branch";
	fi;
	echo $count;
}

prompt_git() {
	local s='';
	local branchName='';

	# Check if the current directory is in a Git repository.
	if [ $(git rev-parse --is-inside-work-tree &>/dev/null; echo "${?}") == '0' ]; then

		# check if the current directory is in .git before running git checks
		if [ "$(git rev-parse --is-inside-git-dir 2> /dev/null)" == 'false' ]; then

			# Ensure the index is up to date.
			git update-index --really-refresh -q &>/dev/null;

			# Check for uncommitted changes in the index.
			if ! $(git diff --quiet --ignore-submodules --cached); then
				s+='+';
				s+="$(git diff --cached --stat | awk '{print $1}' | tail -1) ";
			fi;

			# Check for unstaged changes.
			if ! $(git diff-files --quiet --ignore-submodules --); then
				s+='!';
			fi;

			# Check for untracked files.
			if [ -n "$(git ls-files --others --exclude-standard)" ]; then
			    s+="$(tput setaf 9)?";
			fi;

			# Check for stashed files.
			if $(git rev-parse --verify refs/stash &>/dev/null); then
				s+='$';
			fi;

		fi;

		# Get the short symbolic ref.
		# If HEAD isn’t a symbolic ref, get the short SHA for the latest commit
		# Otherwise, just give up.
		branchName="$(git symbolic-ref --quiet --short HEAD 2> /dev/null || \
			git rev-parse --short HEAD 2> /dev/null || \
			echo '(unknown)')";

		[ -n "${s}" ] && s="$(tput setaf 10) [${s}$(tput setaf 10)]";

		echo -e "${1}${branchName}${2}${s}";
	else
		return;
	fi;
}

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
