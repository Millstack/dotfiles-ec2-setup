#!/bin/bash

# Get the directory where this script is located
DOTFILES_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

# List of files to symlink
files=".vimrc .bashrc .gitconfig aliases.sh"

echo "Starting dotfiles installation..."

for file in $files; do
    # 1. Back up existing files if they aren't already symlinks
    if [ -f ~/$file ] && [ ! -L ~/$file ]; then
        echo "Backing up existing $file to $file.bak"
        mv ~/$file ~/$file.bak
    fi

    # 2. Create the Symlink
    echo "Creating symlink for $file"
    ln -sf "$DOTFILES_DIR/$file" ~/"$file"
done

# --- NEW: SSH KEY AUTOMATION ---
if [ ! -f ~/.ssh/id_ed25519 ]; then
    echo "No SSH key found. Generating one for GitHub..."
    # Generates a key without asking for a passphrase
    ssh-keygen -t ed25519 -C "fullstackwithmilind@gmail.com" -N "" -f ~/.ssh/id_ed25519
    
    echo "*******************************************************"
    echo "-------------------------------------------------------"
    echo "COPY THIS KEY TO GITHUB (Settings > SSH and GPG keys):"
    cat ~/.ssh/id_ed25519.pub
    echo "-------------------------------------------------------"
    echo "*******************************************************"
else
    echo "------------------------"
    echo "SSH key already exists."
    cat ~/.ssh/id_ed25519.pub
    echo "------------------------"
fi

echo "Installation complete! Please run 'source ~/.bashrc'"
