#!/bin/bash

echo "🟢 Starting project setup..."

# Required Python version
REQUIRED_PYTHON="3.10"

# Check if Python 3.10 is installed
if ! command -v python3.10 &> /dev/null; then
    echo "❌ Python $REQUIRED_PYTHON is not installed. Please install it before running this setup."
    exit 1
fi

# Create virtual environment
echo "📦 Creating virtual environment in ./venv using Python $REQUIRED_PYTHON..."
python3.10 -m venv venv

# Activate virtual environment
echo "✅ Activating virtual environment..."
source venv/bin/activate

# Install dependencies
echo "📚 Installing required Python packages from requirements.txt..."
pip install --upgrade pip
pip install -r requirements.txt

# Sync with main branch
echo "🔄 Syncing with latest main branch..."
git fetch origin main
git merge origin/main || echo "Already up to date with main."

echo "🎉 Setup complete! Run 'source venv/bin/activate' to activate your environment anytime."
