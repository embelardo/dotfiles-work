# Zsh Init ####################################################################

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
	alias-finder
	colored-man-pages
	git
	mercurial
	zsh-autosuggestions
	zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# Plugin Configs ##############################################################

# colorize (ccat, cless)
ZSH_COLORIZE_STYLE="solarized-dark"

# Aliases #####################################################################

DOTFILES=~/git-repos/dotfiles-work
ZSHRC=~/.zshrc

alias b='cd ..'
alias bb='cd ../..'
alias bbb='cd ../../..'
alias bbbb='cd ../../../..'
alias bbbbb='cd ../../../../..'

REPOS=~/repos
alias auto='cd ~/auto'
alias dotfiles="cd ${DOTFILES}"
alias repo="cd ${REPOS}"
alias erepo='cd ~/evolve-repos'
alias grepo='cd ~/git-repos'
alias perftest='cd ~/intelepacs-perftest'

alias trunk="cd ${REPOS}/trunk"
alias 551="cd ${REPOS}/PACS-5-5-1"
alias 541="cd ${REPOS}/PACS-5-4-1"
alias 531="cd ${REPOS}/PACS-5-3-1"
alias 521="cd ${REPOS}/PACS-5-2-1"
alias 511="cd ${REPOS}/PACS-5-1-1"
alias 418="cd ${REPOS}/PACS-4-18-1"
alias 417="cd ${REPOS}/PACS-4-17-1"
alias 416="cd ${REPOS}/PACS-4-16-1"
alias 415="cd ${REPOS}/PACS-4-15-1"
alias 414="cd ${REPOS}/PACS-4-14-1"
alias 412="cd ${REPOS}/PACS-4-12-1"

PIRATES=~/evolve-repos/master-pirates
alias pirates="cd ${PIRATES}"
alias etrunk="cd ${PIRATES}/trunk"
alias e551="cd ${PIRATES}/PACS-5-5-1"
alias e541="cd ${PIRATES}/PACS-5-4-1"
alias e531="cd ${PIRATES}/PACS-5-3-1"
alias e521="cd ${PIRATES}/PACS-5-2-1"
alias e511="cd ${PIRATES}/PACS-5-1-1"
alias e418="cd ${PIRATES}/PACS-4-18-1"
alias e417="cd ${PIRATES}/PACS-4-17-1"
alias e416="cd ${PIRATES}/PACS-4-16-1"
alias e415="cd ${PIRATES}/PACS-4-15-1"
alias e414="cd ${PIRATES}/PACS-4-14-1"
alias e412="cd ${PIRATES}/PACS-4-12-1"

alias af='alias-finder --longer'
alias h='history -t "%Y.%m.%d %H:%M:%S"'
alias hr='fc -R'
alias hw='fc -W'
alias linkm='ln -s ~/auto/makefile makefile'
alias m='make'

alias vncstartfull='vncserver :2 -geometry 3840x1600 &'
alias vncstarthalf='vncserver :2 -geometry 2000x1600 &'
alias vncstop='vncserver -kill :2'

alias szshrc="source ${ZSHRC}"

unalias history

# History #####################################################################

HISTORY_IGNORE="af|b|cd|clear|h|hr|hw|linkm|ll|la|m|szrc"
export HISTORY_IGNORE="${HISTORY_IGNORE}"

export HISTFILE=~/.zsh_history   # Name history file
export HISTSIZE=1000000000       # Number of lines to keep in one session
export SAVEHIST=1000000000       # Number of lines history to save
export HISTTIMEFORMAT="[%F %T] " # Ex: 18.12.2021 06:49

setopt EXTENDED_HISTORY          # Saves time command started and how long it ran
setopt HIST_SAVE_NO_DUPS         # Do not save duplicate line more than once
setopt HIST_FIND_NO_DUPS         # If duplicate lines saved, don't duplicate them in backward search
setopt HIST_IGNORE_SPACE         # Disregard line if it begins with space
setopt HIST_NO_STORE             # Disregard history or fc command
setopt HIST_REDUCE_BLANKS        # Remove excess blanks before saving line
setopt INC_APPEND_HISTORY        # Add line to history upon execution instead of upon exit

unsetopt HIST_FIND_NO_DUPS
unsetopt HIST_IGNORE_ALL_DUPS
unsetopt HIST_IGNORE_DUPS
unsetopt HIST_EXPIRE_DUPS_FIRST
unsetopt SHARE_HISTORY

# SSH Keys ####################################################################

start-agent() {
	eval `ssh-agent`
	ssh-add ~/.ssh/dev_dsa
	ssh-add ~/.ssh/id_rsa
	echo
	echo 'Identities loaded into ssh-agent:'
	ssh-add -l
}

# iTerm2 ######################################################################

source ~/.iterm2_shell_integration.zsh

# Bat #########################################################################

export BAT_THEME="Solarized (dark)"

# Git #########################################################################

export GIT_PAGER="cat"

# Env Variables ###############################################################

export JAVA_HOME=/opt/intelerad/lib/jvm/jdk-1.8-64

# PATH ########################################################################

DCM4CHE=dcm4che-5.25.0
if echo ${PATH} | grep ${DCM4CHE}  > /dev/null
then
	echo "PATH already contains '${DCM4CHE}'. No need to add."
else
	echo "Adding ${DCM4CHE} to PATH."
	export PATH=/usr/local/${DCM4CHE}/bin:${PATH}
fi

JDK=openjdk-11-64
if echo ${PATH} | grep ${JDK}  > /dev/null
then
	echo "PATH already contains '${JDK}'. No need to add."
else
	echo "Adding ${JDK} to PATH."
	export PATH=/opt/intelerad/lib/jvm/${JDK}/bin:${PATH}
fi

EBELARDO=ebelardo
if echo ${PATH} | grep ${EBELARDO}  > /dev/null
then
	echo "PATH already contains '${EBELARDO}'. No need to add."
else
	echo "Adding ${EBELARDO} to PATH."
	export PATH=/home/${EBELARDO}/bin:${PATH}
fi

SBIN=sbin
if echo ${PATH} | grep ${SBIN}  > /dev/null
then
	echo "PATH already contains '${SBIN}'. No need to add."
else
	echo "Adding ${SBIN} to PATH."
	export PATH=/${SBIN}:/usr/${SBIN}:${PATH}
fi

# Functions ###################################################################

AUTO=~/auto
ACKRC=~/.ackrc
HGRC=~/.hgrc
MAKEFILE=~/makefile
TMUX_CONF=~/.tmux.conf
ZSHRC_THEME=~/.zshrc_theme

init-home () {
    if [ -d "${DOTFILES}" ]; then
        echo "Folder ${DOTFILES} exists."
    else
        echo "Cloning ${DOTFILES} repo."
        git clone https://github.com/embelardo/dotfiles-work.git ${DOTFILES}
    fi

    if [ -f "${ZSHRC}" ]; then
        echo "File ${ZSHRC} exists."
    else
        echo "Creating link ${ZSHRC}."
        ln -s ${DOTFILES}/zshrc ${ZSHRC}
    fi

    if [ -f "${ZSHRC_THEME}" ]; then
        echo "File ${ZSHRC_THEME} exists."
    else
        echo "Creating link ${ZSHRC_THEME}."
        ln -s ${DOTFILES}/zshrc_theme ${ZSHRC_THEME}
    fi

    if [ -d "${AUTO}" ]; then
        echo "Folder ${AUTO} exists."
    else
        echo "Creating link ${AUTO}."
        ln -s ${DOTFILES}/auto ${AUTO}
    fi

    if [ -f "${MAKEFILE}" ]; then
        echo "File ${MAKEFILE} exists."
    else
        echo "Creating link ${MAKEFILE}."
        ln -s ${AUTO}/makefile ${MAKEFILE}
    fi

    if [ -f "${ACKRC}" ]; then
        echo "File ${ACKRC} exists."
    else
        echo "Creating link ${ACKRC}."
        ln -s ${DOTFILES}/ackrc ${ACKRC}
    fi

    if [ -f "${HGRC}" ]; then
        echo "File ${HGRC} exists."
    else
        echo "Creating link ${HGRC}."
        ln -s ${DOTFILES}/hgrc ${HGRC}
    fi

    if [ -f "${TMUX_CONF}" ]; then
        echo "File ${TMUX_CONF} exists."
    else
        echo "Creating link ${TMUX_CONF}."
        ln -s ${DOTFILES}/tmux.conf ${TMUX_CONF}
    fi
}

# eof #########################################################################
