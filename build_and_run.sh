#!/bin/bash

# Set strict mode
set -euo pipefail

# Define variables
PROJECT_DIR="/mnt/c/Users/germa/Proyecto/Tizen OP/Tizen-OP"
IMAGE_NAME="moont-project"

# Navigate to the project directory
cd "$PROJECT_DIR" || { echo "Error: Unable to change to project directory"; exit 1; }

# Build the Docker image
echo "Building the Docker image..."
if docker build -t "$IMAGE_NAME" .; then
    echo "The image was built successfully."
    
    # Run the container
    echo "Running the container..."
    docker run -it --rm "$IMAGE_NAME"
else
    echo "Error: Failed to build the image." >&2
    exit 1
fi
