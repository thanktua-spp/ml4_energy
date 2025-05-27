#!/bin/bash

echo "🟢 Starting project setup..."

# Check python3.10
if ! command -v python3.10 &>/dev/null; then
  echo "❌ Python 3.10 is missing."
  exit 1
fi

echo "📦 Creating virtual environment in ./venv..."
python3.10 -m venv venv

echo "📚 Installing dependencies..."
./venv/bin/pip install --upgrade pip
./venv/bin/pip install -r requirements.txt

echo "🐍 Python version in venv:"
./venv/bin/python --version

echo "📦 Pip version in venv:"
./venv/bin/pip --version

PY_VER=$("./venv/bin/python" -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')
if [ "$PY_VER" != "3.10" ]; then
  echo "❌ Venv Python is not 3.10 (found $PY_VER)"
  exit 1
fi

echo "✅ Setup complete!"
