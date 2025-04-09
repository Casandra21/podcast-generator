FROM ubuntu:22.04

# Avoid interactive prompts during package install
ENV DEBIAN_FRONTEND=noninteractive

# Install Python 3.10, pip, and git
RUN apt-get update && apt-get install -y \
    software-properties-common \
    python3.10 \
    python3.10-venv \
    python3-pip \
    git

# Set python3.10 as default
RUN update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.10 1

# Install PyYAML
RUN pip3 install PyYAML

# Copy source files
COPY feed.py /usr/bin/feed.py
COPY entrypoint.sh /entrypoint.sh

# Make entrypoint script executable
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
