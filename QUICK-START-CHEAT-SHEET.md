# ⚡ Quick Start Cheat Sheet

## 🏃 First Time Setup (One Time Only)

```bash
# 1. Download and navigate to the setup script
cd ~/Downloads

# 2. Make it executable
chmod +x laptop-setup.sh

# 3. Run it!
./laptop-setup.sh
```

**Then in VS Code:**
- Install GitHub Copilot extension (Cmd+Shift+X, search "GitHub Copilot")
- Sign in when prompted
- Start chat with Cmd+Shift+I

---

## 💼 Daily Workflow

### Starting Work
```bash
cd ~/Documents/Portfolio/connohubin-demo
git pull                    # Get latest changes
code .                      # Open VS Code
```

### While Working
- **Chat with AI:** Cmd+Shift+I
- **Test locally:** Just open HTML files in browser
- **Check changes:** `git status`

### Saving Work
```bash
git add -A
git commit -m "describe what you changed"
git push
```

---

## 🔥 Most Used Commands

```bash
# Open project
cd ~/Documents/Portfolio/connohubin-demo && code .

# Save all changes
git add -A && git commit -m "your message" && git push

# See what changed
git status

# Get latest from desktop
git pull

# View recent commits
git log --oneline -5

# Undo last commit (keep changes)
git reset --soft HEAD~1
```

---

## 🌐 Important URLs

**Live Site:**  
https://connorindustrialdesign-lang.github.io/connohubin-demo/

**GitHub Repo:**  
https://github.com/connorindustrialdesign-lang/connohubin-demo

---

## 🆘 Quick Fixes

**Changes not showing on live site?**
- Hard refresh: Cmd+Shift+R
- Wait 1-2 minutes for GitHub Pages to deploy

**"Permission denied" when pushing?**
```bash
git config credential.helper osxkeychain
git push  # Will ask for password once, then remember
```

**Merge conflict?**
```bash
git pull
# Fix conflicts in VS Code (look for <<<<<<< markers)
git add -A
git commit -m "fix conflicts"
git push
```

**Need to start fresh?**
```bash
cd ~/Documents/Portfolio
rm -rf connohubin-demo
git clone https://github.com/connorindustrialdesign-lang/connohubin-demo.git
```

---

## 🎨 Project Structure

```
connohubin-demo/
├── index.html              # Homepage
├── portfolio-wheel.html    # Main portfolio page
├── about.html              # About page
├── styles.css              # Main stylesheet
├── script.js               # JavaScript
├── assets/
│   └── images/            # All images
│       ├── sculptures/    # Fine Arts 1
│       ├── mountain/      # Fine Arts 2
│       ├── wave/          # Fine Arts 3
│       └── paintings/     # Fine Arts 4
└── project-*-detail.html  # Individual projects
```

---

## ⌨️ VS Code Shortcuts

- **Copilot Chat:** Cmd+Shift+I
- **Extensions:** Cmd+Shift+X
- **Terminal:** Ctrl+`
- **Find in Files:** Cmd+Shift+F
- **Go to File:** Cmd+P
- **Save:** Cmd+S
- **Save All:** Cmd+K S

---

## 🚀 Pro Tips

1. **Always pull before starting work** to avoid conflicts
2. **Commit often** with descriptive messages
3. **Test in browser** before pushing (open HTML files directly)
4. **Use Copilot chat** - just ask questions like you're asking me now!
5. **Keep messages clear** in commits: "Add hover colors" not "changes"

---

## 📱 Contact/Recovery

If something breaks badly:
1. Take a screenshot
2. Copy any error messages
3. Ask Copilot chat: "I got this error: [paste error]"
4. Worst case: Clone fresh from GitHub

---

**You got this! Happy coding!** 🎉
