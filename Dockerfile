FROM localhost/dbus-gui-gems

# the XAUTHORITY part does not work. see
# https://build.opensuse.org/package/view_file/YaST:Head:Containers/yast-mgmt-qt-container/entrypoint.sh?expand=1
# instead (-e XAUTHORITY and ENTRYPOINT with /host/$XAUTHORITY)
LABEL run sh -c 'echo $XAUTHORITY'; podman run \
      -v .:/checkout \
      -v /var/run/dbus:/var/run/dbus:ro \
      -v /tmp/.X11-unix:/tmp/.X11-unix:ro \
      -v \\$XAUTHORITY:/root/.Xauthority \
      -e DISPLAY -e XAUTHLOCALHOSTNAME \
      --rm \
      -it localhost/dbus-gui-app \
            bash
#      bash -c 'cd /checkout; rbenv exec bundle exec bin/dbus-gui-gtk'
