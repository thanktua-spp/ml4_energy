# Dockerfile
FROM python:3.10-slim

# Set working directory
WORKDIR /app

# Copy all project files
COPY . .

# Ensure setup script is executable
RUN chmod +x setup/setup.sh

# Run the setup script to create virtual environment and install dependencies
RUN bash setup/setup.sh

# Activate the venv on container startup
CMD ["bash", "-c", "source venv/bin/activate && exec bash"]
