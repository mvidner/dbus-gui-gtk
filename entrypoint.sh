#!/bin/sh
export XAUTHORITY="/host/${XAUTHORITY:-$HOME/.Xauthority}"
dbus-uuidgen --ensure
for D in /checkout /dbus-gui-gtk; do
    pushd $D
    rbenv exec sh -c "bundle exec sh -c 'bin/dbus-gui-gtk; echo GUI exit: $?'; echo Bundler exit: \$?"
    echo Rbenv exit: $?
    test -f Gemfile && break
    popd
done
