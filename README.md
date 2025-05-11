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

After going through the checklist above, cleanly install macOS with the latest release.

### Setting up your Mac

Once all the above is complete follow the instructions below to setup a new Mac.

1. Check Software Update and update macOS to the latest version
[//]: # (2. Sign into the Mac App Store, so that mas can download apps)
[//]: # (3. Make sure iCloud Drive is enabled, so that Mackup can restore settings)
4. Setup an SSH key by using one of the two following methods:
   4.1. If you use 1Password, install it with the 1Password [SSH agent](https://developer.1password.com/docs/ssh/get-started/#step-3-turn-on-the-1password-ssh-agent) and sync your SSH keys locally.  
   4.2. Otherwise [generate a new public and private SSH key](https://docs.github.com/en/github/authenticating-to-github/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent) by running:

   ```sh
   curl https://raw.githubusercontent.com/damianlewis/dotfiles/HEAD/ssh.sh | sh -s "<your-email-address>"
   ```

[//]: # (5. Install Command Line Developer Tools, required before running git command)

[//]: # ()
[//]: # (    ```sh)

[//]: # (    xcode-select --install)

[//]: # (    ```)

5. Clone this repo to `~/.dotfiles` with:

    ```sh
    git clone --recursive git@github.com:damianlewis/dotfiles.git ~/.dotfiles
    ```

6. Run the installation with:

   ```sh
   cd ~/.dotfiles && ./fresh.sh
   ```
7. Start `Herd.app` and run its install process
8. After Mackup is synced with your cloud storage, restore preferences by running `mackup restore`
9. Restart your computer

## First time installation

When installing these dotfiles for the first time you'll need to backup all of your settings with Mackup. Install Mackup and backup your settings with the commands below. Settings will be synced to iCloud so you can use them to sync between computers and reinstall them when reinstalling your Mac. Make sure your `.zshrc` file is symlinked from your dotfiles repo to your home directory. 

```sh
brew install mackup
mackup backup
```

## Additional configurations

I'm not using Mackup to backup settings with senstive data, so they need to be configured manually.

1. Configure the AWS CLI tool

    ```sh
    aws configure
    ```
