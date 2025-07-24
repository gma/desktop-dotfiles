Desktop dot files
=================

This repository contains config files for many of the apps that I run on the
desktop. I use Ansible to symlink all these files into place when I add new
files, or setup a new computer.

Also see these related repositories:

- [dotfiles] — my shell and command line utilities
- [nvim-config] — my setup for the [Neovim editor]

[dotfiles]: https://github.com/gma/dotfiles
[nvim-config]: https://github.com/gma/nvim-config
[Neovim editor]: https://neovim.io/

Hyprland
--------

When setting up keyboard shortcuts ([binds]) in Hyprland you need to know
how to refer to the keys on your keyboard. Look through the constants defined
in the [xkbcommon project]'s [xkbcommon-keysyms.h] header file, remove the
leading "XKB_KEY_" prefix, and use what's left in your config file.

[binds]: https://wiki.hypr.land/Configuring/Binds/
[xkbcommon project]: https://xkbcommon.org/
[xkbcommon-keysyms.h]: https://github.com/xkbcommon/libxkbcommon/blob/master/include/xkbcommon/xkbcommon-keysyms.h
