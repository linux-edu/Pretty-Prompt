# Pretty-Prompt

This script lets you apply Linux–inspired prompt styles to your terminal. Clean, fast & safely.

## 🎯 Features

- Works on Debian-based (Ubuntu, Termux, etc.)
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
   ```bash
   git clone https://github.com/linux-edu/Pretty-Prompt.git
   
   cd Pretty-Prompt
   ```

3. Run the script:

   ```bash
   chmod +x install.sh

   ./install.sh
   ```
   
4. To uninstall:
   
   ```bash
   chmod +x uninstall.sh

   ./uninstall.sh
   ```

💖 Sponsor Us

If you find our work useful, consider supporting it.

Your sponsorship helps us:
- Maintain and improve open-source tools like `safe-upgrade`
- Create more scripts for Termux and Linux users
- Dedicate time to education and community projects

Even small contributions go a long way — thank you for helping us keep open-source accessible to everyone. 🙏

[![Sponsor](https://img.shields.io/badge/sponsor-%E2%9D%A4-yellow?logo=github)](https://github.com/sponsors/linux-edu)



