#!/bin/bash

set -e  # Exit immediately if a command fails

echo "🔄 Updating project..."

# Navigate to the script's directory (project root)
cd "$(dirname "$0")"

# Check if venv exists in known location
if [ ! -d "venv" ]; then
    echo "❌ Virtual environment not found. Please run setup.sh first."
    exit 1
fi

# Activate virtual environment
echo "🐍 Activating virtual environment..."
source venv/bin/activate

# Update Git repo safely
echo "📡 Checking Git repository..."
CURRENT_BRANCH=$(git branch --show-current)
if [ "$CURRENT_BRANCH" != "main" ]; then
    echo "⚠️ You are not on the 'main' branch. Currently on '$CURRENT_BRANCH'."
    echo "Please switch to 'main' or pull manually."
    exit 1
fi

echo "📥 Pulling latest changes from 'main'..."
git pull --rebase --autostash origin main

# Update dependencies
echo "📚 Installing updated Python packages..."
pip install --upgrade -r requirements.txt

echo "✅ Update complete!"
