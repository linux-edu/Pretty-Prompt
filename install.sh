#!/bin/bash
# install.sh — Prompt-only CLI Customizer

set -e

echo "🎨 Select your terminal prompt style:"
echo "1) Minimal    → \[\e[1;31m\]\u@\h:\w\$"
echo "2) Classic    → Bold, Red/Blue username@host + path"
echo "3) Pro        → Multiline, Bold, Cyan/Yellow"

read -p "Enter theme number (1-3): " THEME_CHOICE

case $THEME_CHOICE in
  1)
    PROMPT='PS1="\[\e[1;31m\]\u@\h:\w\$ \[\e[0m\]"'
    ;;
  2)
    PROMPT='PS1="\[\e[1;31m\]\u@\h\[\e[0m\]:\[\e[1;34m\]\w\[\e[0m\]\$ "'
    ;;
  3)
    PROMPT='PS1="\[\e[1;36m\]\u@\h\[\e[0m\] \[\e[1;33m\]\w\[\e[0m\]\n\$ "'
    ;;
  *)
    echo "❌ Invalid choice. Using default (Classic)."
    PROMPT='PS1="\[\e[1;31m\]\u@\h\[\e[0m\]:\[\e[1;34m\]\w\[\e[0m\]\$ "'
    ;;
esac

echo "💾 Backing up current .bashrc to .bashrc.backup..."
cp -f ~/.bashrc ~/.bashrc.backup

# Apply the prompt
echo "🎯 Applying CLI style..."

cat <<EOF >> ~/.bashrc

# ==== PRETTY PROMPT ====
$PROMPT
# ==== END PROMPT ====
EOF

echo "✅ Prompt applied. Run: source ~/.bashrc or restart terminal."
