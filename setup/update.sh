#!/bin/bash

echo "🔄 Updating project..."

# Ensure Python venv is activated
if [ ! -d "venv" ]; then
    echo "❌ Virtual environment not found. Please run setup.sh first."
    exit 1
fi

# Activate environment
source venv/bin/activate

# Pull latest main branch changes
echo "📡 Pulling latest changes from main..."
git pull origin main

# Reinstall updated dependencies
echo "📚 Updating Python packages..."
pip install -r requirements.txt

echo "✅ Update complete!"
