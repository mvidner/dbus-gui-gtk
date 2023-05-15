FROM mvidner/dbus-gui-gems

COPY entrypoint.sh /entrypoint.sh
# ENTRYPOINT /entrypoint.sh

LABEL run podman run \
      -v /:/host:ro \
      -v .:/checkout \
      -v /var/run/dbus:/var/run/dbus:ro \
      -v /tmp/.X11-unix:/tmp/.X11-unix:ro \
      -e XAUTHORITY \
      -e DISPLAY -e XAUTHLOCALHOSTNAME \
      -e DBUS_SESSION_BUS_ADDRESS \
      --rm \
      -it IMAGE \
      sh /entrypoint.sh
