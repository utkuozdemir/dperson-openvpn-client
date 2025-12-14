FROM alpine
LABEL org.opencontainers.image.authors="utkuozdemir@gmail.com"

# The first upgrade below is a workaround for "execve: No such file or directory" issue introduced in alpine 3.23.
# See: https://gitlab.alpinelinux.org/alpine/aports/-/issues/17775?__goaway_challenge=cookie&__goaway_id=556dce04aa417438e8079cd4064374a6
RUN apk upgrade --scripts=no apk-tools && \
    apk --no-cache --no-progress upgrade && \
    apk --no-cache --no-progress add bash curl ip6tables iptables openvpn \
                shadow tini tzdata shadow-login && \
    addgroup -S vpn && \
    rm -rf /tmp/*

COPY openvpn.sh /usr/bin/

HEALTHCHECK --interval=60s --timeout=15s --start-period=120s \
             CMD curl -LSs 'https://api.ipify.org'

VOLUME ["/vpn"]

ENTRYPOINT ["/sbin/tini", "--", "/usr/bin/openvpn.sh"]
