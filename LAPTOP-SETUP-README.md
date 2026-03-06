# 💻 Laptop Setup Instructions

## Quick Start

Copy the `laptop-setup.sh` file to your MacBook Pro, then:

1. **Transfer the script** to your laptop (USB drive, AirDrop, email, etc.)

2. **Open Terminal** on your laptop (⌘+Space, type "Terminal")

3. **Navigate to where you saved the script:**
   ```bash
   cd ~/Downloads
   ```

4. **Make it executable:**
   ```bash
   chmod +x laptop-setup.sh
   ```

5. **Run it:**
   ```bash
   ./laptop-setup.sh
   ```

6. **Follow the prompts!** The script will install everything and guide you through the manual steps.

---

## What Gets Automated ✅

The script automatically installs and configures:
- ✅ Homebrew (package manager)
- ✅ Git 
- ✅ VS Code
- ✅ Git configuration (name, email)
- ✅ Clone your portfolio repository
- ✅ Open VS Code with your project

---

## What Requires Your Input 👤

You'll need to:
1. **Enter your name and email** for Git commits (prompted during script)
2. **Authenticate with GitHub** when cloning the repo
3. **Install GitHub Copilot extension** in VS Code (2 minutes)
4. **Sign in to Copilot** with your GitHub account

---

## After Setup

### To Start Working:
1. Open Terminal
2. Navigate to project: `cd ~/Documents/Portfolio/connohubin-demo`
3. Open in VS Code: `code .`
4. Start chatting with Copilot (Cmd+Shift+I)

### To Save Changes:
```bash
git add -A
git commit -m "describe your changes"
git push
```

### To Pull Latest Changes:
```bash
git pull
```

---

## Troubleshooting

**"Permission denied" error:**
```bash
chmod +x laptop-setup.sh
```

**Git asks for password repeatedly:**
The script sets up macOS Keychain to remember your credentials after first use.

**VS Code 'code' command not found:**
Restart Terminal or run:
```bash
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
```

**Need to switch between laptop and desktop:**
Always pull before starting work:
```bash
git pull
```
Always push when finished:
```bash
git push
```

---

## Repository URLs

- **Main Repo:** https://github.com/connorindustrialdesign-lang/connohubin-demo
- **Live Site:** https://connorindustrialdesign-lang.github.io/connohubin-demo/

---

## Quick Reference

**Open project:**
```bash
cd ~/Documents/Portfolio/connohubin-demo
code .
```

**Check status:**
```bash
git status
```

**View recent changes:**
```bash
git log --oneline -5
```

**Create new branch (optional):**
```bash
git checkout -b feature-name
```

---

Ready to code anywhere! 🚀
