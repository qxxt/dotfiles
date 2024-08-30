#!/usr/bin/env bash

# ls aliases
alias ls='ls --color=auto --group-directories-first --time-style=long-iso -Fhv1'
alias l='ls -AgG'
alias ll='ls -Al'

# Sort by size
alias lsize='ls -AsS1'

# Sort by time
alias ltime='l -t'

# Copy with progress bar
alias cpv='rsync -ah --info=progress2'

# Go tour
alias tour="tour -openbrowser=f"
alias godoc="GOROOT=/usr/local/go godoc"

# Emacs
alias et="emacsclient"
alias ec="emacsclient -c"
alias er="emacsclient -r"

alias reboot="prompt reboot now? && reboot"

alias sbcl="rlwrap sbcl"

alias python="python3"
