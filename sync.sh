#!/bin/bash
# Updates this repository with select system configuration files

cp -f /etc/apk/world ./WORLD
cp -f ~/.config/jj/config.toml jj.toml
cp -f ~/.config/helix/config.toml helix.toml
