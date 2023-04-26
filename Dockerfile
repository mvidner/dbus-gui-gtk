# podman run --name dbus-gui-app \
#      -v /var/run/dbus:/var/run/dbus:ro \
#      -v /tmp/.X11-unix:/tmp/.X11-unix:ro \
#      -v $XAUTHORITY:/root/.Xauthority \
#      -e DISPLAY -e XAUTHLOCALHOSTNAME \
#      -it localhost/dbus-gui-app:1 bash
# copy /usr/bin/joe to /tmp/.X11-unix and edit the app to sessionbus if false

FROM localhost/dbus-gui-ruby:1

# Install Bundler for each version of ruby
RUN echo 'gem: --no-rdoc --no-ri' >> /.gemrc
#RUN bash -c 'for v in $(cat /root/versions.txt); do rbenv global $v; gem install bundler; done'
RUN rbenv global 3.1.4
RUN git clone https://github.com/mvidner/dbus-gui-gtk.git
# don't collide on zypp locks
RUN cd dbus-gui-gtk; rbenv exec bundle install -j1
# ruby-gnome2.gem uses zypper to install dependencies. 200M of cache.
RUN zypper clean --all
