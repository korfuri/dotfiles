#!/bin/bash
# Assumes you cloned into ~/.dotfiles
D=~/.dotfiles
TARGET=~/

test -f "${D?}"/install.sh || exit 1
test -d "${TARGET?}" || exit 1

function installfile() {
    F="${1?}"
    test -f "${TARGET?}"/."${F?}" && mv "${TARGET?}"/."${F?}" "${TARGET?}"/."${F?}".old
    ln -s "${D?}"/"${F?}" "${TARGET?}"/."${F?}"
}

installfile tmux.conf
installfile emacs
installfile emacs.d
installfile bashrc