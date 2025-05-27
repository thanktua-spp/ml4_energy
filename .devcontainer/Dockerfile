FROM python:3.10-slim

WORKDIR /app

# Install git for your setup.sh script (optional)
RUN apt-get update && apt-get install -y git && rm -rf /var/lib/apt/lists/*

COPY requirements.txt setup/setup.sh /app/

RUN chmod +x setup/setup.sh

# Run your setup script to create venv and install packages
RUN ./setup/setup.sh

COPY . /app

# Use bash as default shell
SHELL ["/bin/bash", "-c"]

# Make container always activate venv on startup
ENV VIRTUAL_ENV=/app/venv
ENV PATH="$VIRTUAL_ENV/bin:$PATH"

# By default open a bash shell with venv activated
CMD ["bash", "--rcfile", "/app/.bashrc"]

# Ensure .bashrc activates venv
RUN echo "source /app/venv/bin/activate" >> /app/.bashrc
