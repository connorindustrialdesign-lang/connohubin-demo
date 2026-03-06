#!/bin/bash

# Create portable laptop package
# This creates a compressed archive of your entire portfolio project

echo "📦 Creating portable laptop package..."
echo ""

# Set package name with date
PACKAGE_NAME="portfolio-laptop-package-$(date +%Y%m%d)"
TEMP_DIR="/tmp/$PACKAGE_NAME"

# Clean up any existing temp directory
rm -rf "$TEMP_DIR"

# Create temp directory
mkdir -p "$TEMP_DIR"

echo "📋 Copying project files..."

# Copy everything except git files and system files
rsync -av \
  --exclude='.git' \
  --exclude='.DS_Store' \
  --exclude='node_modules' \
  --exclude='*.pyc' \
  --exclude='__pycache__' \
  --exclude='ocr_*' \
  --exclude='*.code-search' \
  ./* "$TEMP_DIR/"

# Make sure setup script is executable
chmod +x "$TEMP_DIR/laptop-setup.sh"

echo "🗜️  Compressing package..."
echo ""

# Create compressed archive on Desktop
cd /tmp
tar -czf "$HOME/Desktop/$PACKAGE_NAME.tar.gz" "$PACKAGE_NAME"

# Get file size
SIZE=$(du -h "$HOME/Desktop/$PACKAGE_NAME.tar.gz" | cut -f1)

# Clean up temp directory
rm -rf "$TEMP_DIR"

echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "✅ PACKAGE CREATED!"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "📍 Location: ~/Desktop/$PACKAGE_NAME.tar.gz"
echo "📊 Size: $SIZE"
echo ""
echo "📤 TO TRANSFER TO LAPTOP:"
echo ""
echo "Option 1 - AirDrop (Easiest):"
echo "  Right-click the file → Share → AirDrop to laptop"
echo ""
echo "Option 2 - USB Drive:"
echo "  Copy the .tar.gz file to a USB drive"
echo ""
echo "Option 3 - Cloud (Dropbox, Google Drive, iCloud):"
echo "  Upload the file and download on laptop"
echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "💻 ON YOUR LAPTOP, EXTRACT WITH:"
echo ""
echo "  cd ~/Downloads"
echo "  tar -xzf $PACKAGE_NAME.tar.gz"
echo "  cd $PACKAGE_NAME"
echo "  ./laptop-setup.sh"
echo ""
echo "🚀 Then follow the setup script instructions!"
echo ""
