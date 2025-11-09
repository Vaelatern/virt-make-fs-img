# Use Ubuntu as base (libguestfs-tools is well-supported)
FROM ubuntu:24.04

# Install libguestfs-tools which includes virt-make-fs
# linux-image-generic is because virt-make-fs uses the system kernel for the microvm
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        libguestfs-tools \
        qemu-utils \
        linux-image-generic \
    && rm -rf /var/lib/apt/lists/*

# Create input and output directories
RUN mkdir -p /input /output
VOLUME ["/input", "/output"]

# Copy entrypoint script
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Set entrypoint
ENTRYPOINT ["/entrypoint.sh"]
