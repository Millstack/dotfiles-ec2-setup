# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Shell Prompt (Clean & Minimal)
export PS1='\[\e[1;32m\]\u@\h\[\e[m\]:\[\e[1;34m\]\w\[\e[m\]\$ '

# History Settings
export HISTSIZE=10000
export HISTCONTROL=ignoredups

# Load custom aliases
if [ -f ~/.aliases.sh ]; then
    . ~/.aliases.sh
fi
