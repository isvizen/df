#!/usr/bin/env sh

nix-shell -p xdg-user-dirs git dotter --run "
  xdg-user-dirs-update
  git clone https://github.com/isvizen/df ~/.df
  cd ~/.df && dotter --force
"

sudo ln -sf ~/.df/configuration.nix /etc/nixos/configuration.nix
sudo nix-channel --add https://nixos.org/channels/nixos-unstable nixos
sudo nixos-rebuild switch --upgrade

echo '#'
echo "# Installation complete! Reboot to see the result!"
echo '#'
