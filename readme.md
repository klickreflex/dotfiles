# Daniel's Dotfiles

Shamelessly copied over from [Rob's Dotfiles](https://github.com/robdekort/dotfiles) and adapted to my needs.

This repository contains my Dotfiles and anything else I use to setup and maintain my Macs. It simplifies the process of installing software on new Macs and it helps to keep my configuration the same on every machine I use.

Feel free to copy parts of this for your own dotfiles!

## Fresh macOS Setup
### Before re-installing
First go through this checklist to make sure you don't forget anything before wiping clean your hard drive.

* [ ] Have you committed and pushed any changes/branches to Github?
* [ ] Has iCloud Drive finished syncing?
* [ ] Have you exported any databases that need to be exported and put them somewhere useful?

### Setting up your Mac
Now that you've made sure you've done all the things, setup your mac!

1. Update macOS to the latest version through the App Store
2. Install the Xcode CLI-tools using `xcode-select --install`
3. Clone this repository to `~/.dotfiles`
4. Run `sh install.sh` for all software
5. Run `sh macos.s`h for sane MacOS defaults
6. Login to all the things
7. Restore SSH key from 1Password
8. Authenticate Composer with GitHub: `composer config [--global] github-oauth.github.com token`
9. Restart Mac

## ❤️
This is 100% inspired by the brilliant [Rob](https://github.com/robdekort/dotfiles) who was inspired by the brilliant [Duncan](https://github.com/duncanmcclean/dotfiles) :)
