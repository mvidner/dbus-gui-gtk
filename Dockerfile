FROM registry.opensuse.org/opensuse/leap:15.4

RUN zypper --non-interactive install --no-recommends \
  xev xauth
