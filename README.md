# Damian's Dotfiles

This repository helps set up a fresh macOS installation.

## What's included

| Path                  | Purpose                                          |
|-----------------------|--------------------------------------------------|
| `bin/install`         | Main setup script                                |
| `bin/update`          | Update dotfiles, Homebrew, and global packages   |
| `bin/setup-ssh`       | SSH key setup for GitHub                         |
| `bin/macos-defaults`  | macOS terminal defaults commands                 |
| `shell/.zshrc`        | Zsh configuration (plugins, theme, editor)       |
| `shell/aliases.zsh`   | Shell aliases (auto-loaded by Oh My Zsh)         |
| `shell/path.zsh`      | `$PATH` modifications (auto-loaded by Oh My Zsh) |
| `shell/functions.zsh` | Shell functions (auto-loaded by Oh My Zsh)       |
| `config/Brewfile`     | Homebrew packages, casks, and Mac App Store apps |
| `config/git/`         | Git configuration and global gitignore           |
| `config/spaceship.zsh`| Spaceship prompt configuration                   |
| `docs/`               | Manual setup guides (macOS preferences)          |
| `work/`               | Work-specific setup (private submodule)          |

## Setting up a new Mac

### Before re-installing macOS

Go through the checklist below to make sure you didn't forget anything before you wipe your hard drive.

- Did you commit and push any changes/branches to your git repositories?
- Did you remember to save all important documents from non-iCloud directories?
- Did you save all of your work from apps which aren't synced through iCloud?
- Did you remember to export important data from your local database?

### Installing macOS cleanly

After going through the checklist above, cleanly install macOS with the latest release.

### Setting up your Mac

Once all the above is complete follow the instructions below to setup a new Mac.

1. Check Software Update and update macOS to the latest version
2. Clone this repo to `~/Code/config/dotfiles` with:

    ```sh
    git clone https://github.com/damianlewis/dotfiles.git ~/Code/config/dotfiles
    ```

3. Run the install script:

   ```sh
   cd ~/Code/config/dotfiles && ./bin/install
   ```

   The script will install Homebrew and Oh My Zsh, symlink config files, install Brewfile dependencies, and prompt to set up SSH and work tools.

4. Start `Herd.app` and run its install process
5. Apply macOS preferences from [`docs/macos-setup.md`](docs/macos-setup.md)
6. Restart your computer

## Updating

Run the update alias to pull the latest changes and update all packages:

```sh
dotup
```

Or re-run the install script to apply updates:

```sh
cd ~/Code/config/dotfiles && ./bin/install
```

Symlinks are created with force (`-swf`), so re-running is safe.

## Work setup

The `work/` directory is a private submodule ([dotfiles-work](https://github.com/damianlewis/dotfiles-work)) containing work-specific setup scripts and tools. It is cloned automatically when the install script initialises submodules (requires SSH access to GitHub).

## Additional configurations

The following need to be configured manually.

1. Configure the AWS CLI tool

    ```sh
    aws configure
    ```
