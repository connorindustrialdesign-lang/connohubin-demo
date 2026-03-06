#!/bin/bash

# Portfolio Development Environment Setup Script
# For 2016 MacBook Pro - Connor Hubin
# Run this on your laptop to get everything ready

echo "🚀 Starting Portfolio Development Setup..."
echo ""

# Check if running on macOS
if [[ "$OSTYPE" != "darwin"* ]]; then
    echo "❌ This script is for macOS only"
    exit 1
fi

echo "📋 This script will install:"
echo "  - Homebrew (package manager)"
echo "  - Git"
echo "  - VS Code"
echo "  - GitHub Copilot (requires login)"
echo "  - Your portfolio repository"
echo ""
read -p "Continue? (y/n) " -n 1 -r
echo ""
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    exit 1
fi

# Install Homebrew if not already installed
echo ""
echo "📦 Checking for Homebrew..."
if ! command -v brew &> /dev/null; then
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    
    # Add Homebrew to PATH for Apple Silicon Macs
    if [[ $(uname -m) == 'arm64' ]]; then
        echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
        eval "$(/opt/homebrew/bin/brew shellenv)"
    fi
else
    echo "✅ Homebrew already installed"
fi

# Install Git
echo ""
echo "📦 Checking for Git..."
if ! command -v git &> /dev/null; then
    echo "Installing Git..."
    brew install git
else
    echo "✅ Git already installed"
fi

# Install VS Code
echo ""
echo "📦 Checking for VS Code..."
if ! command -v code &> /dev/null; then
    echo "Installing Visual Studio Code..."
    brew install --cask visual-studio-code
    
    # Add code command to PATH
    cat << 'EOF' >> ~/.zshrc

# Add VS Code to PATH
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
EOF
    export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
else
    echo "✅ VS Code already installed"
fi

# Configure Git
echo ""
echo "⚙️  Configuring Git..."
read -p "Enter your full name for Git commits: " git_name
read -p "Enter your email for Git commits: " git_email

git config --global user.name "$git_name"
git config --global user.email "$git_email"
git config --global init.defaultBranch main

echo "✅ Git configured"

# Create workspace directory
echo ""
echo "📁 Creating workspace..."
WORKSPACE_DIR="$HOME/Documents/Portfolio"
mkdir -p "$WORKSPACE_DIR"
cd "$WORKSPACE_DIR"

# Clone repositories
echo ""
echo "📥 Cloning your repository..."
echo "You'll need to authenticate with GitHub"
echo ""

if [ ! -d "connohubin-demo" ]; then
    git clone https://github.com/connorindustrialdesign-lang/connohubin-demo.git
    echo "✅ Repository cloned to $WORKSPACE_DIR/connohubin-demo"
else
    echo "✅ Repository already exists"
fi

# Set up GitHub credentials helper
echo ""
echo "🔐 Setting up GitHub credentials..."
git config --global credential.helper osxkeychain

# Open VS Code with the project
echo ""
echo "🎨 Opening VS Code..."
code "$WORKSPACE_DIR/connohubin-demo"

# Instructions for Copilot
echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "✅ SETUP COMPLETE!"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "📌 NEXT STEPS (Manual - will take 2-3 minutes):"
echo ""
echo "1. In VS Code, click the Extensions icon (left sidebar, squares icon)"
echo "   or press Cmd+Shift+X"
echo ""
echo "2. Search for 'GitHub Copilot'"
echo ""
echo "3. Click 'Install' on the official GitHub Copilot extension"
echo ""
echo "4. Click 'Sign in to use GitHub Copilot' when prompted"
echo "   - This will open your browser"
echo "   - Log in with your GitHub account"
echo "   - Authorize the extension"
echo ""
echo "5. Once signed in, click the chat icon in the left sidebar"
echo "   or press Cmd+Shift+I to start chatting with me!"
echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "📍 Your project location: $WORKSPACE_DIR/connohubin-demo"
echo ""
echo "🔗 Your live site: https://connorindustrialdesign-lang.github.io/connohubin-demo/"
echo ""
echo "💡 Test the setup by making a small change to index.html,"
echo "   then run: git add -A && git commit -m 'test' && git push"
echo ""
echo "Happy coding! 🚀"
echo ""
