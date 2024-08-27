#!/bin/bash

echo "Generating a new SSH key for GitHub..."

if [[ -z "$1" ]]; then
    echo "Email is required"
    exit 1
fi

KEY_NAME="id_ed25519_github"

# Generating a new SSH key
# https://docs.github.com/en/github/authenticating-to-github/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent#generating-a-new-ssh-key
ssh-keygen -t ed25519 -C "$1" -f "$HOME/.ssh/$KEY_NAME"

# Adding your SSH key to the ssh-agent
# https://docs.github.com/en/github/authenticating-to-github/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent#adding-your-ssh-key-to-the-ssh-agent
eval "$(ssh-agent -s)"

touch ~/.ssh/config
echo "Host *\n AddKeysToAgent yes\n UseKeychain yes\n IdentityFile ~/.ssh/$KEY_NAME" | tee ~/.ssh/config

ssh-add -K "$HOME/.ssh/$KEY_NAME"

# Adding your SSH key to your GitHub account
# https://docs.github.com/en/github/authenticating-to-github/adding-a-new-ssh-key-to-your-github-account
echo "run 'pbcopy < ~/.ssh/$KEY_NAME.pub' and paste that into GitHub"
