# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Shell Prompt (Clean & Minimal)
export PS1='\[\e[1;32m\]\u@\h\[\e[m\]:\[\e[1;34m\]\w\[\e[m\]\$ '

# History Settings
export HISTSIZE=10000
export HISTCONTROL=ignoredups

# Load custom aliases
if [ -f ~/aliases.sh ]; then
    . ~/aliases.sh
fi

# --- SSH Agent Auto-Start ---
# To make terminal remember your key, so you don't have to restart the agent manually
if [ -z "$SSH_AUTH_SOCK" ]; then
   eval "$(ssh-agent -s)" > /dev/null
   ssh-add ~/.ssh/id_ed25519 2>/dev/null
fi
