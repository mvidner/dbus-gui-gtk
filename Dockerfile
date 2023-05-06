FROM localhost/dbus-gui-gems

COPY entrypoint.sh /entrypoint.sh
# ENTRYPOINT /entrypoint.sh

LABEL run podman run \
      -v /:/host:ro \
      -v .:/checkout \
      -v /var/run/dbus:/var/run/dbus:ro \
      -v /tmp/.X11-unix:/tmp/.X11-unix:ro \
      -e XAUTHORITY \
      -e DISPLAY -e XAUTHLOCALHOSTNAME \
      --rm \
      -it IMAGE \
      sh /entrypoint.sh
