# Chimera Linux Config

Having recently discovered and switching to [Chimera Linux](https://chimera-linux.org/) on my laptop, this repository contains
my configuration files for apk's world, dotfiles, etc.

## Impressions

Having come from NixOS, Chimera is a nice middle-ground of being modern (musl, clang, etc.) and deterministic (apk world constriants).

- `apk` being able to search for, and install, packages based on a `cmd:` or `so:` prefix is amazing.
- The plug-and-play functionality on a musl-based distro is very welcome.
- Use `chsh` to change the login shell for a user.
- The documentation, while quite brief, is very well written.
