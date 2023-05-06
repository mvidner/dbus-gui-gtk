#!/bin/sh
export XAUTHORITY="/host/${XAUTHORITY:-$HOME/.Xauthority}"
dbus-uuidgen --ensure
for D in /checkout /dbus-gui-gtk; do
    pushd $D
    rbenv exec bundle exec bin/dbus-gui-gtk
    test -f Gemfile && break
    popd
done
