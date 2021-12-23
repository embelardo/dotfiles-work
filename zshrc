# Path to your oh-my-zsh installation.
export ZSH="/home/ebelardo/.oh-my-zsh"

source /home/ebelardo/.zshrc_theme

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="spaceship"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder
ZSH_CUSTOM=/home/ebelardo/.zsh

plugins=(
	aliases
	colored-man-pages
	git
	mercurial
	zsh-autosuggestions
	zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# Plugin configs ##############################################################

# colorize (ccat, cless)
ZSH_COLORIZE_STYLE="solarized-dark"

# SSH Keys ####################################################################

eval `ssh-agent`
ssh-add ~/.ssh/dev_dsa
ssh-add ~/.ssh/id_rsa
echo
echo 'Identities loaded into ssh-agent:'
ssh-add -l

# Aliases #####################################################################

alias b='cd ..'
alias bb='cd ../..'
alias bbb='cd ../../..'
alias bbbb='cd ../../../..'
alias bbbbb='cd ../../../../..'

alias auto='cd ~/auto'
alias perftest='cd ~/intelepacs-perftest'

alias m='make'
alias r='source ~/.zshrc'

alias vncstartfull='vncserver :2 -geometry 3840x1600 &'
alias vncstarthalf='vncserver :2 -geometry 2000x1600 &'
alias vncstop='vncserver -kill :2'

# Bat #########################################################################

export BAT_THEME="Solarized (dark)"

# Git #########################################################################

export GIT_PAGER="cat"

# History #####################################################################

HISTORY_IGNORE="b|cd|ll|la|m"
export HISTORY_IGNORE="${HISTORY_IGNORE}"

export HISTFILE=~/.zsh_history   # Name history file
export HISTSIZE=1000000000       # Number of lines to keep in one session
export SAVEHIST=1000000000       # Number of lines history to save
export HISTTIMEFORMAT="[%F %T] " # Ex: 18.12.2021 06:49

setopt EXTENDED_HISTORY          # Saves time command started and how long it ran
setopt HIST_SAVE_NO_DUPS         # Do not save duplicate line more than once
setopt HIST_FIND_NO_DUPS         # If duplicate lines saved, don't duplicate them in backward search
setopt HIST_IGNORE_ALL_DUPS      # Disregard line if already in history
setopt HIST_IGNORE_SPACE         # Disregard line if it begins with space
setopt HIST_NO_STORE             # Disregard history or fc command
setopt HIST_REDUCE_BLANKS        # Remove excess blanks before saving line
setopt INC_APPEND_HISTORY        # Add line to history upon execution instead of upon exit

unsetopt HIST_IGNORE_DUPS        # Unset option set by unknown actor
unsetopt HIST_EXPIRE_DUPS_FIRST  # Unset option set by unknown actor
unsetopt SHARE_HISTORY

# PATH ########################################################################

DCM4CHE=dcm4che-5.25.0
if echo ${PATH} | grep ${DCM4CHE}  > /dev/null
then
	echo "PATH contains '${DCM4CHE}'. Nothing to do."
else
	echo "Adding ${DCM4CHE} to PATH."
	export PATH=/usr/local/${DCM4CHE}/bin:${PATH}
fi

# Env Variables ###############################################################

export JAVA_HOME=/opt/intelerad/lib/jvm/jdk-1.8-64

# eof #########################################################################