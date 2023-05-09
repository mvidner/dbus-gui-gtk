#!/bin/sh
export XAUTHORITY="/host/${XAUTHORITY:-$HOME/.Xauthority}"
dbus-uuidgen --ensure
for D in /checkout /dbus-gui-gtk; do
    pushd $D
    rbenv exec ruby -e 'system %(bundle exec sh -xc "bin/dbus-gui-gtk; echo \$SHLVL; E=\$?; echo GUI exit: \$E; exit \$E"); e = $?.exitstatus; puts "Bundler exit #{e}"; exit e'
    echo Rbenv exit: $?
    test -f Gemfile && break
    popd
done
