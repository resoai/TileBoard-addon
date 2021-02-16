ARG BUILD_FROM
FROM $BUILD_FROM

# Build arguments
ARG BUILD_ARCH
ARG BUILD_DATE
ARG BUILD_REF
ARG BUILD_VERSION
ARG TILEBOARD_VERSION

ENV LANG C.UTF-8

# Set shell
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

# Setup base
RUN \
    set -x \
    && apk add --no-cache \
        curl \
        nginx \
        unzip \
    && apk del --no-cache

# Fetch and unpack TileBoard
RUN \
    set -x \
    && curl -v -L -o /tileboard.zip https://github.com/resoai/TileBoard/releases/download/v${TILEBOARD_VERSION}/TileBoard.zip \
    && unzip /tileboard.zip -d /var/www/tileboard \
    && rm -f /tileboard.zip

# Copy root filesystem
COPY rootfs /

# Labels
LABEL \
    io.hass.name="TileBoard" \
    io.hass.description="Home Assistant TileBoard addon" \
    io.hass.arch="${BUILD_ARCH}" \
    io.hass.type="addon" \
    io.hass.version=${BUILD_VERSION} \
    maintainer="rchl" \
    org.label-schema.description="Home Assistant TileBoard addon" \
    org.label-schema.build-date=${BUILD_DATE} \
    org.label-schema.name="TileBoard" \
    org.label-schema.schema-version=${BUILD_VERSION} \
    org.label-schema.url="https://github.com/resoai/TileBoard" \
    org.label-schema.usage="https://github.com/resoai/TileBoard/README.md" \
    org.label-schema.vcs-ref=${BUILD_REF} \
    org.label-schema.vcs-url="https://github.com/resoai/TileBoard" \
    org.label-schema.vendor="TileBoard Addons"
