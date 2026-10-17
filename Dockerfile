FROM ubuntu:22.04

# Prevent interactive prompts during package installation
ENV DEBIAN_FRONTEND=noninteractive

# Install build dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    libpng-dev \
    make \
    gcc \
    git \
    wget \
    xz-utils \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

# Install RGBDS (version 1.0.3)
ARG RGBDS_VERSION=1.0.3
RUN wget -q "https://github.com/gbdev/rgbds/releases/download/v${RGBDS_VERSION}/rgbds-linux-x86_64.tar.xz" \
    && mkdir -p /tmp/rgbds \
    && tar -xJf rgbds-linux-x86_64.tar.xz -C /tmp/rgbds \
    && if [ -f /tmp/rgbds/install.sh ]; then /tmp/rgbds/install.sh; else find /tmp/rgbds -type f \( -name rgbasm -o -name rgblink -o -name rgbfix -o -name rgbgfx \) -exec cp {} /usr/local/bin/ \;; fi \
    && rm -rf rgbds-linux-x86_64.tar.xz /tmp/rgbds

WORKDIR /app

# Copy repository files
COPY . .

# Build ROMs by default
CMD ["make", "-j"]

