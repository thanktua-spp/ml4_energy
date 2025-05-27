#!/bin/bash

# Build the docker image (only runs if image doesn't exist or Dockerfile changed)
docker build -t my-python310-app .

# Run the container interactively with the current folder mounted
docker run -it --rm -v "$(pwd)":/app my-python310-app
