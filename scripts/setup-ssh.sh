#!/bin/bash

echo "Generating a new SSH key for GitHub..."

if [[ -z "$1" ]]; then
  echo "Email is required"
  return 1 2>/dev/null || exit 1
fi

KEY_NAME="id_ed25519_github"

# Generating a new SSH key
mkdir -p "$HOME/.ssh"
ssh-keygen -t ed25519 -C "$1" -f "$HOME/.ssh/$KEY_NAME"
chmod 600 "$HOME/.ssh/$KEY_NAME"

# Adding your SSH key to the ssh-agent
eval "$(ssh-agent -s)"

if ! grep -q "Host github.com" "$HOME/.ssh/config" 2>/dev/null; then
  cat >> "$HOME/.ssh/config" <<EOF

Host github.com
  AddKeysToAgent yes
  UseKeychain yes
  IdentityFile ~/.ssh/$KEY_NAME
EOF
fi

ssh-add --apple-use-keychain "$HOME/.ssh/$KEY_NAME"

# Adding your SSH key to your GitHub account
gh auth login
gh ssh-key add "$HOME/.ssh/$KEY_NAME.pub" --title "$(scutil --get ComputerName)"
