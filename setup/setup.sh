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

# Upgrade pip and install dependencies using full path to venv pip
echo "📚 Installing required Python packages from requirements.txt..."
./venv/bin/pip install --upgrade pip
./venv/bin/pip install -r requirements.txt

# Show Python and Pip version from the virtual environment
echo "🐍 Python version in venv:"
./venv/bin/python --version

echo "📦 Pip version in venv:"
./venv/bin/pip --version

# Optional: sanity check Python version
PY_VER=$(./venv/bin/python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')
if [ "$PY_VER" != "3.10" ]; then
    echo "❌ Virtual environment was not created with Python 3.10 (found: $PY_VER)"
    exit 1
fi

# Activate venv for interactive shells (ignored in CI)
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
