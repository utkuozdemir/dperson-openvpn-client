# Docker OpenVPN Client

This project is a fork of [dperson/openvpn-client](https://github.com/dperson/openvpn-client)
with the following changes:

- Periodically builds a new image with the latest `alpine` and `openvpn` versions
- Produce `ghcr.io/utkuozdemir/dperson-openvpn-client` images with the following tags:
  - combination of `alpine` and `openvpn` versions in different formats,
    e.g. `alpine-3.18.4-openvpn-2.6.5` and `2.6.5-alpine-3.18.4` (semver-compatible)
  - only the `openvpn version`, e.g. `2.6.5`
  - `latest`

This way:
- We keep it up to date so we avoid the security vulnerabilities (CVEs) -
  i.e., at the time of writing, OpenVPN version in upstream is `2.4.9`
  while the latest version here is `2.6.5`
- We offer tagged versions
- We use `ghcr.io` which is not subject to the Docker Hub pull rate limits

Supported Architectures:
- `linux/amd64`
- `linux/arm64`
- `linux/arm/v7`

See the [package](https://github.com/utkuozdemir/dperson-openvpn-client/pkgs/container/dperson-openvpn-client)
for the list of available tags.

This project aims to do minimal changes on the upstream code.

To read the actual README of the project, see [README.dperson.md](README.dperson.md).
