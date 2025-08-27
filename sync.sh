#!/bin/bash
# Updates this repository with select system configuration files

cp -f ~/.bash_profile .
cp -f /etc/apk/world .
cp -f ~/.config/jj/config.toml jj.toml
cp -f ~/.config/helix/config.toml helix.toml
