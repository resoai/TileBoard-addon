ARG BUILD_FROM
FROM $BUILD_FROM

# Build arguments
ARG BUILD_ARCH
ARG BUILD_DATE
ARG BUILD_DESCRIPTION
ARG BUILD_NAME
ARG BUILD_REF
ARG BUILD_REPOSITORY
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
        python3 \
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
    io.hass.name="${BUILD_NAME}" \
    io.hass.description="${BUILD_DESCRIPTION}" \
    io.hass.arch="${BUILD_ARCH}" \
    io.hass.type="addon" \
    io.hass.version=${BUILD_VERSION} \
    maintainer="rchl" \
    org.opencontainers.image.title="${BUILD_NAME}" \
    org.opencontainers.image.description="${BUILD_DESCRIPTION}" \
    org.opencontainers.image.vendor="TileBoard Addons" \
    org.opencontainers.image.authors="Rafal Chlodnicki <rchl2k+tileboard@gmail.com>" \
    org.opencontainers.image.licenses="MIT" \
    org.opencontainers.image.url="https://github.com/resoai/TileBoard" \
    org.opencontainers.image.source="https://github.com/${BUILD_REPOSITORY}" \
    org.opencontainers.image.documentation="https://github.com/${BUILD_REPOSITORY}/blob/main/README.md" \
    org.opencontainers.image.created=${BUILD_DATE} \
    org.opencontainers.image.revision=${BUILD_REF} \
    org.opencontainers.image.version=${BUILD_VERSION}
