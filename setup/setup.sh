#!/bin/bash

echo "🟢 Starting project setup..."

# Check if Python is installed
if ! command -v python3 &> /dev/null
then
    echo "❌ Python3 is not installed. Please install Python 3.10+ and rerun this script."
    exit 1
fi

# Create virtual environment
echo "📦 Creating virtual environment in ./venv..."
python3 -m venv venv

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
