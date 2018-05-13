# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples
#####################
# Bash initialization
#
# LOGIN:
# /etc/profile
#   /etc/profile.env (if exists)
#   /etc/bash/bashrc (if exists)
#   /etc/profile.d/*.sh (if exists)
#
# ~/.bash_profile
#   /etc/bashrc
#   ~/.bashrc (if exists)
# if( ~/.bash_profile doesn't exist)
#   ~/.bash_login
#
# NON-LOGIN
# /etc/bash/bashrc
# ~/.bashrc

######################


# Color definitions (taken from Color Bash Prompt HowTo).
# Some colors might look different of some terminals.
# For example, I see 'Bold Red' as 'orange' on my screen,
# hence the 'Green' 'BRed' 'Red' sequence I often use in my prompt.


# Normal Colors
Black='\e[0;30m'        # Black
Red='\e[0;31m'          # Red
Green='\e[1;32m'        # Green
Yellow='\e[0;33m'       # Yellow
Blue='\e[0;34m'         # Blue
Purple='\e[0;35m'       # Purple
Cyan='\e[0;36m'         # Cyan
White='\e[0;37m'        # White

# Bold
BBlack='\e[1;30m'       # Black
BRed='\e[1;31m'         # Red
BGreen='\e[1;32m'       # Green
BYellow='\e[1;33m'      # Yellow
BBlue='\e[1;34m'        # Blue
BPurple='\e[1;35m'      # Purple
BCyan='\e[1;36m'        # Cyan
BWhite='\e[1;37m'       # White

# Background
On_Black='\e[40m'       # Black
On_Red='\e[41m'         # Red
On_Green='\e[42m'       # Green
On_Yellow='\e[43m'      # Yellow
On_Blue='\e[44m'        # Blue
On_Purple='\e[45m'      # Purple
On_Cyan='\e[46m'        # Cyan
On_White='\e[47m'       # White

NC="\e[m"               # Color Reset

# define Vars
BASH_ALIASES_DIR=~/.bash/aliases

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)

stty -ixon
HISTSIZE=4000
HISTFILESIZE=5000
HISTCONTROL=ignoredups:ignorespace
HISTIGNORE=":pwd:id:uptime:resize:ls:clear:history:"
# append to the history file, don't overwrite it
shopt -s histappend
# export PKG_CONFIG_PATH="/opt/local/lib/pkgconfig:$PKG_CONFIG_PATH"

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

export EDITOR=vim
PS1="\[${Yellow}\]\u@\h\[${BBlue}\]\w\[$txtcyn\]:\[$Green\]"
export PS1="$PS1\$(git-radar --bash --fetch) "
#PS1="\[${Yellow}\]\u@\h\[${BBlue}\]\w\[$txtcyn\]:\[$Green\]\$(git_branch) "

# If this is an xterm set the title to user@host:dir
# case "$TERM" in
# xterm*|rxvt*)
  # PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
  # ;;
# *)
  # ;;
# esac

# bash_aliases
if [ -d $BASH_ALIASES_DIR ]; then
  for alias_def in $BASH_ALIASES_DIR/*; do
    . $alias_def
  done
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
  . /etc/bash_completion
fi

export PATH=$HOME/bin:$HOME/.dotfiles/.git-radar:$PATH

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
# For JDownloader2
#export _JAVA_OPTIONS='-Dsun.java2d.uiScale=2 -Dawt.useSystemAAFontSettings=on -Dswing.aatext=true -Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel'
export _JAVA_OPTIONS='-Dsun.java2d.uiScale=2 -Dawt.useSystemAAFontSettings=on -Dswing.aatext=true -Dsun.java2d.dpiaware=false'

#eval `dircolors ~/.dircolors`
