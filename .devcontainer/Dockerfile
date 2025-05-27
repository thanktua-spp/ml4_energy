# Use official Ubuntu as base
FROM ubuntu:22.04

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive

# Update and install Python 3.10 and venv tools
RUN apt-get update && apt-get install -y \
    python3.10 \
    python3.10-venv \
    python3.10-dev \
    curl \
    git \
    bash \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Set Python 3.10 as default
RUN update-alternatives --install /usr/bin/python python /usr/bin/python3.10 1 \
    && update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.10 1

# Set working directory
WORKDIR /app

# Copy all files into container
COPY . .

# Make the setup script executable
RUN chmod +x setup/setup.sh

# Run the setup script (creates venv and installs deps)
RUN bash setup/setup.sh

# Automatically activate the venv in every shell
RUN echo "source /app/venv/bin/activate" >> /root/.bashrc
