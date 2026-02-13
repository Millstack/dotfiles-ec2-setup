#!/bin/bash

# 1. Variables
DOTFILES_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
FILES=".vimrc .bashrc .gitconfig aliases.sh"
GITHUB_EMAIL="fullstackwithmilind@gmail.com"

echo "🚀 Starting Cloud Engineer Environment Setup..."

# 2. Install GitHub CLI (For Ubuntu/Debian EC2)
if ! command -v gh &> /dev/null; then
    echo "Installing GitHub CLI..."
    type -p curl >/dev/null || (sudo apt update && sudo apt install curl -y)
    curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg \
    && sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg \
    && echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
    && sudo apt update \
    && sudo apt install gh -y
fi

# 3. Create Symlinks
echo "Linking dotfiles..."
for file in $FILES; do
    if [ -f ~/$file ] && [ ! -L ~/$file ]; then
        mv ~/$file ~/$file.bak
    fi
    ln -sf "$DOTFILES_DIR/$file" ~/"$file"
done

# 4. One-Time GitHub Login & SSH Setup
echo "Checking GitHub Authentication..."
if ! gh auth status &> /dev/null; then
    echo "Please follow the prompts to log in to GitHub."
    # This command generates an SSH key, uploads it to GitHub, and logs you in.
    gh auth login --hostname github.com --git-protocol ssh --web
else
    echo "✅ Already logged into GitHub."
fi

# 5. Finalize SSH Agent in .bashrc (if not already there)
if ! grep -q "ssh-agent" ~/.bashrc; then
    echo "Adding SSH agent auto-start to .bashrc..."
    echo -e "\n# Auto-start SSH Agent\neval \$(ssh-agent -s) > /dev/null\nssh-add ~/.ssh/id_ed25519 2>/dev/null" >> ~/.bashrc
fi

echo "✨ Setup Complete! Run 'source ~/.bashrc' to begin."
