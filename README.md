# Pretty-Prompt

A simple Bash-based CLI installer that applies Linux–inspired prompt styles to your terminal. Clean, fast.

## 🎯 Features

- No package installation or updates
- Prompt-only customization (no `figlet`, `lolcat`, or `neofetch`)
- Three color themes based on Linux CLI aesthetics
- Safe `.bashrc` backup and easy uninstall

## 📦 Files

- `install.sh` – Install and choose your CLI prompt style
- `uninstall.sh` – Restore your original `.bashrc` or remove custom section1. Clone the repo or download the script:
- `.gitignore` – Ignore temporary files
- `LICENSE` – MIT License

## 🎨 Prompt Styles

1. **Minimal** – Red prompt: `user@host:/path$`
2. **Classic** – Red + Blue (Bold): `user@host:/path$`
3. **Pro** – Multiline with Cyan/Yellow path

## 🛠️ Installation

1. Clone the repo or download the script:
   git clone https://github.com/linux-edu/Pretty-Prompt.git
   cd Pretty-Prompt

2. Run the script:
   chmod +x install.sh
   ./install.sh
   
4. To uninstall
   chmod +x uninstall.sh
   ./uninstall.sh
