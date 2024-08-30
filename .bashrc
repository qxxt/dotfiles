#!/usr/bin/env bash
# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# Disable caching recent files
if [ ! -e ~/.local/share/recently-used.xbel ]; then
    touch ~/.local/share/recently-used.xbel
    chmod 0444 ~/.local/share/recently-used.xbel
elif [ -s ~/.local/share/recently-used.xbel ]; then
    rm ~/.local/share/recently-used.xbel
    touch ~/.local/share/recently-used.xbel
    chmod 0444 ~/.local/share/recently-used.xbel
fi

# don't put duplicate lines in the history. See bash(1) for more options
# don't overwrite GNU Midnight Commander's setting of `ignorespace'.
HISTCONTROL=$HISTCONTROL${HISTCONTROL+:}ignoredups
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

if [ "$UID" = 0 ]; then
    PS1="\[\e[1;36m\]\w\[\e[0m\]\[\e[0;31m\] #\[\e[0m\] "
else
    PS1="\[\e[1;32m\]\w\[\e[0m\] $ "
fi

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;\w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    # alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
    alias rg='rg --color=auto'
fi

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Default parameter to send to the "less" command
# -R: show ANSI colors correctly; -i: case insensitive search
LESS="-R -i"

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

# Local bin
export PATH="$PATH:$HOME/bin"

# Go
# Go env
export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
export PATH="$PATH:$GOBIN"

# Rust
[[ -f ~/.cargo/env ]] && . ~/.cargo/env
# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

# Run if Termux
if [[ -n "$TERMUX_VERSION" ]]; then
    [[ -f ~/.termux ]] && . ~/.termuxrc
else
    # Add sbin directories to PATH.  This is useful on systems that have sudo
    echo $PATH | grep -Eq "(^|:)/sbin(:|)" || PATH=$PATH:/sbin
    echo $PATH | grep -Eq "(^|:)/usr/sbin(:|)" || PATH=$PATH:/usr/sbin

    # Disable stupid dialog on Gnome
    [[ -n "$SSH_CONNECTION" ]] && unset SSH_ASKPASS
    export GIT_ASKPASS=
fi
