#!/bin/bash

echo "🟢 Starting project setup..."

# Check if Python 3.10 is installed
if ! command -v python3.10 &> /dev/null; then
    echo "❌ Python 3.10 is not installed. Please install it and rerun this script."
    exit 1
fi

# Create virtual environment
echo "📦 Creating virtual environment in ./venv..."
python3.10 -m venv venv

# Upgrade pip and install dependencies using full path
echo "📚 Installing required Python packages from requirements.txt..."
./venv/bin/pip install --upgrade pip
./venv/bin/pip install -r requirements.txt

# Optional: Activate venv for interactive shells (ignored in CI)
if [ -n "$PS1" ]; then
    echo "✅ Activating virtual environment for interactive shell..."
    source venv/bin/activate
    echo "🎉 Setup complete! Virtual environment activated."
else
    echo "✅ Setup complete! (CI detected, skipping shell activation)"
fi

# Sync with main branch (optional in CI)
echo "🔄 Syncing with latest main branch..."
git fetch origin main
git merge origin/main || echo "Already up to date with main."

