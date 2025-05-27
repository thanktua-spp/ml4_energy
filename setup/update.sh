#!/bin/bash
set -e

echo "🔄 Updating project..."

# If you want to ensure running from project root, uncomment the next line:
# cd "$(dirname "$0")/.."

if [ ! -d "venv" ]; then
    echo "❌ Virtual environment not found. Please run setup.sh first."
    exit 1
fi

echo "🐍 Activating virtual environment..."
source venv/bin/activate

CURRENT_BRANCH=$(git branch --show-current)
if [ "$CURRENT_BRANCH" != "main" ]; then
    echo "⚠️ You are not on the 'main' branch. Currently on '$CURRENT_BRANCH'."
    echo "Please switch to 'main' or pull manually."
    exit 1
fi

echo "📥 Pulling latest changes from 'main'..."
git pull --rebase --autostash origin main

echo "📚 Installing updated Python packages..."
pip install --upgrade -r requirements.txt

echo "✅ Update complete!"
