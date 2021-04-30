# Damian's Dotfiles

This repository helps set up a fresh macOS installation.

### Before re-installing macOS

Go through the checklist below to make sure you didn't forget anything before you wipe your hard drive.

- Did you commit and push any changes/branches to your git repositories?
- Did you remember to save all important documents from non-iCloud directories?
- Did you save all of your work from apps which aren't synced through iCloud?
- Did you remember to export important data from your local database?
- Did you update [mackup](https://github.com/lra/mackup) to the latest version and ran `mackup backup`?

### Installing macOS cleanly

After going through the checklist above, cleanly install macOS with the latest release. Follow [this article](https://www.imore.com/how-do-clean-install-macos) and [this article](https://www.macrumors.com/how-to/reinstall-macos-m1-apple-silicon-macs/) to cleanly install the latest macOS version. There's also [this video](https://www.youtube.com/watch?v=lBiUSnrYyFM) about reinstalling macOS on M1 Macs.

### Setting up your Mac

Once all the above is complete follow the instructions below to setup a new Mac.

1. Check Software Update and update macOS to the latest version
2. Sign into the Mac App Store, so that mas can download apps
3. Make sure iCloud Drive is enabled, so that Mackup can restore settings
4. Generate a new SSH key and add it to ssh-agent:

   ```zsh
   # Generate a new SSH key
   ssh-keygen -t ed25519

   # Add the SSH key to ssh-agent
   eval "$(ssh-agent -s)"
   ssh-add -K ~/.ssh/id_ed25519
   ```

5. Add SSH key to GitHub account

   ```zsh
   cat ~/.ed255519.pub | pbcopy
   ```

6. Install Command Line Developer Tools, required before running git command

    ```zsh
    xcode-select --install
    ```

7. Clone this repo to `~/.dotfiles` with:

    ```zsh
    git clone git@github.com:damianlewis/dotfiles.git ~/.dotfiles
    ```

8. Run `~/.dotfiles/install.sh` to start the installation
9. Restart your computer

## First time installation

When installing these dotfiles for the first time you'll need to backup all of your settings with Mackup. Install Mackup and backup your settings with the commands below. Settings will be synced to iCloud so you can use them to sync between computers and reinstall them when reinstalling your Mac. Make sure your `.zshrc` file is symlinked from your dotfiles repo to your home directory. 

```zsh
brew install mackup
mackup backup
```

### Initial configurations

Configure SSH before using Mackup backup for the first time, these settings will then be included with the initial backup.

```zsh
echo 'Host *\n\tAddKeysToAgent yes\n\tUseKeychain yes' > ~/.ssh/config
```

## Additional configurations

I'm not using Mackup to backup settings with senstive data, so they need to be configured manually.

1. Configure the StyleCI CLI tool with [your API key](https://gitlab.styleci.io/profile)

    ```zsh
    styleci config auth.github YOUR-API-KEY-GOES-HERE
    ```

2. Configure the AWS CLI tool

    ```zsh
    aws configure
    ```