# macOS Setup Checklist

Non-default system preferences to configure on a fresh Mac.

## Desktop & Dock

- [ ] Size: **42px** (drag slider left from default 48)
- [ ] Position on screen: **Right**
- [ ] Minimize windows into application icon: **on**
- [ ] Animate opening applications: **off**
- [ ] Automatically hide and show the Dock: **on**
- [ ] Show suggested and recent apps in Dock: **off**
- [ ] Tiled window margins: **off**

## Desktop & Dock > Mission Control

- [ ] Automatically rearrange Spaces based on most recent use: **off**

## Finder

- [ ] Show path bar (View > Show Path Bar): **on**
- [ ] Keep folders on top when sorting by name: **on**
- [ ] When performing a search, search the: **Current Folder**
- [ ] Default view style: **List view**
- [ ] Disable warning when changing a file extension: **on** (Finder > Settings > Advanced)

## Keyboard

- [ ] Keyboard navigation: **on**
- [ ] Press fn key to: **Do Nothing**

## Keyboard > Text Input > Input Sources (Edit…)

- [ ] Add period with double-space: **off** (on by default)
- [ ] Use smart quotes and dashes: **off**
- [ ] Correct spelling automatically: **off**

## Screenshots

- [ ] Disable shadow: **on** (Options menu in screenshot toolbar)
- [ ] Show floating thumbnail: **off** (Options menu in screenshot toolbar)

## Activity Monitor

- [ ] Dock icon: **Show CPU Usage** (Activity Monitor > View > Dock Icon)

## Photos

- [ ] Don't open when devices are plugged in: **on** (Photos > Settings > General)

## TextEdit

- [ ] Format > Make Plain Text: **on** (for new documents)

## Terminal commands (no GUI equivalent)

```bash
# Highlight hover effect for grid view of a stack in the Dock
defaults write com.apple.dock mouse-over-hilite-stack -bool true && killall Dock

# Expand save panel by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

# Expand print panel by default
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true

# Save to disk (not iCloud) by default
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

# Avoid creating .DS_Store files on network or USB volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# Prevent Time Machine from prompting to use new hard drives as backup volume
defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true
```

## References

- [macos-defaults.com](https://macos-defaults.com/) — browsable list of `defaults write` commands with screenshots
- [Mathias Bynens' .macos](https://mths.be/macos) — comprehensive collection of macOS defaults commands
- [SS64 macOS defaults reference](https://ss64.com/mac/syntax-defaults.html) — categorised reference of `defaults` settings by application
