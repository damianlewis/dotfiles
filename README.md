# Damian's Dotfiles

Configuration and setup scripts for a fresh macOS installation.

## What's included

| Path                   | Purpose                                                    |
|------------------------|------------------------------------------------------------|
| `bin/install`          | Main setup script                                          |
| `bin/update`           | Update dotfiles, Homebrew, and global packages             |
| `bin/setup-ssh`        | SSH key setup for GitHub                                   |
| `bin/macos-defaults`   | Apply preferred macOS system defaults                      |
| `lib/`                 | Shared logging and style utilities                         |
| `shell/.zshrc`         | Zsh configuration (plugins, theme, editor)                 |
| `shell/aliases.zsh`    | Shell aliases (auto-loaded by Oh My Zsh)                   |
| `shell/path.zsh`       | `$PATH` modifications (auto-loaded by Oh My Zsh)           |
| `shell/functions.zsh`  | Shell functions (auto-loaded by Oh My Zsh)                 |
| `shell/fzf.zsh`        | fzf defaults and Tokyo Night palette (auto-loaded)         |
| `config/Brewfile`      | Homebrew packages, casks, and Mac App Store apps           |
| `config/git/`          | Git configuration, global gitignore, and pre-commit hooks  |
| `config/bat/`          | bat config (Monokai Extended Bright theme)                 |
| `config/eza/`          | eza theme (Tokyo Night)                                    |
| `config/ripgrep/`      | ripgrep defaults (smart-case, type aliases)                |
| `config/ghostty/`      | Ghostty terminal config                                    |
| `config/spaceship.zsh` | Spaceship prompt configuration                             |
| `docs/`                | Manual setup guides (macOS preferences)                    |
| `work/`                | Work-specific setup (private submodule)                    |

## Setup

### Before re-installing macOS

- Commit and push any changes/branches to git repositories
- Save all important documents from non-iCloud directories
- Save all work from apps not synced through iCloud
- Export important data from local databases

### Installing macOS

Cleanly install macOS with the latest release.

### Setting up a new Mac

1. Update macOS to the latest version via Software Update
2. Clone this repo:

    ```sh
    git clone https://github.com/damianlewis/dotfiles.git ~/Code/config/global/dotfiles
    ```

3. Run the install script:

    ```sh
    cd ~/Code/config/global/dotfiles && ./bin/install
    ```

4. Start `Herd.app` and run its install process
5. Apply macOS preferences from [`docs/macos-setup.md`](docs/macos-setup.md)
6. Restart the computer

## Updating

Pull latest changes and update all packages:

```sh
dotup
```

Or re-run the install script:

```sh
cd ~/Code/config/global/dotfiles && ./bin/install
```

Symlinks are created with force (`-swf`), so re-running is safe.

## Work setup

The `work/` directory is a private submodule ([dotfiles-work](https://github.com/damianlewis/dotfiles-work)) containing work-specific setup. Cloned automatically when the install script initialises submodules (requires SSH access to GitHub).

## Additional configuration

Configure the AWS CLI:

```sh
aws configure
```
