#!/bin/bash
# install.sh — Prompt-only CLI Customizer
# Creates a clean backup of ~/.bashrc before modifying and adds a custom prompt

# Add this check to your install script before appending the prompt
if grep -q "# ==== PRETTY PROMPT ====" ~/.bashrc; then
    echo "❌ A custom prompt is already installed. Please run ./uninstall.sh first."
    exit 1
fi


set -e

echo "🌸 Select your terminal prompt style:"
echo "1) Rose      → Bold red username@host with path"
echo "2) Lily      → Bold red/blue username@host + path"
echo "3) Orchid    → Multiline cyan/yellow with path"
echo "4) Tulip     → Green username with timestamp"
echo "5) Daisy     → Purple username with git branch"
echo "6) Sunflower → Blue path with emoji prefix"
echo "7) Violet    → Minimal gray with bold time"
echo "8) Marigold  → Multiline with host and date"

read -p "Enter theme number (1-8): " THEME_CHOICE

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
  4)
    PROMPT='PS1="\[\e[1;32m\]\u@\h\[\e[0m\] \[\e[0;33m\]\t \[\e[0m\]\w\$ "'
    ;;
  5)
    PROMPT='PS1="\[\e[1;35m\]\u@\h\[\e[0m\] \[\e[0;36m\](`git branch 2>/dev/null | grep \"^*\" | cut -d\" \" -f2-`)\[\e[0m\] \w\$ "'
    ;;
  6)
    PROMPT='PS1="\[\e[1;34m\]🌻 \w\[\e[0m\]\$ "'
    ;;
  7)
    PROMPT='PS1="\[\e[1;90m\]\t \u@\h:\w\$\[\e[0m\] "'
    ;;
  8)
    PROMPT='PS1="\[\e[1;31m\]\u@\h\[\e[0m\] \[\e[0;32m\]\D{%Y-%m-%d}\[\e[0m\]\n\w\$ "'
    ;;
  *)
    echo "❌ Invalid choice. Using default (Lily)."
    PROMPT='PS1="\[\e[1;31m\]\u@\h\[\e[0m\]:\[\e[1;34m\]\w\[\e[0m\]\$ "'
    ;;
esac

# Create a clean backup of ~/.bashrc if it doesn't exist
if [ ! -f ~/.bashrc.pretty_prompt_backup ]; then
    echo "💾 Creating clean backup of ~/.bashrc to ~/.bashrc.pretty_prompt_backup..."
    cp -f ~/.bashrc ~/.bashrc.pretty_prompt_backup
else
    echo "ℹ️ Clean backup already exists at ~/.bashrc.pretty_prompt_backup."
fi

# Create a regular backup for this installation
echo "💾 Backing up current .bashrc to .bashrc.backup..."
cp -f ~/.bashrc ~/.bashrc.backup

# Remove any existing custom prompt blocks to prevent duplicates
if grep -q "# ==== PRETTY PROMPT ====" ~/.bashrc; then
    echo "🧹 Removing existing custom prompt blocks..."
    awk '/# ==== PRETTY PROMPT ====/ {skip=1} skip==0 {print} /# ==== END PROMPT ====/ {skip=0}' ~/.bashrc > ~/.bashrc.tmp && mv ~/.bashrc.tmp ~/.bashrc
fi

# Apply the new prompt
echo "🎯 Applying CLI style..."

cat <<EOF >> ~/.bashrc

# ==== PRETTY PROMPT ====
$PROMPT
# ==== END PROMPT ====

EOF

echo "✅ Prompt applied. Run 'source ~/.bashrc' or restart terminal to see changes."
echo "   To revert, run './uninstall.sh' to restore your original ~/.bashrc."
echo "   Note: Run './uninstall.sh' before re-running './install.sh' to avoid duplicate prompts."
