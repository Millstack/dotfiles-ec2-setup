#!/bin/bash
echo "🧹 Cleaning up credentials..."

# 1. Log out of GitHub CLI (removes token)
gh auth logout --hostname github.com

# 2. Remove SSH keys
rm -f ~/.ssh/id_ed25519 ~/.ssh/id_ed25519.pub

# 3. Kill the SSH agent
ssh-agent -k

echo "✅ Credentials removed. Safe to terminate instance."
