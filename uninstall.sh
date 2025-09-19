#!/bin/bash
# uninstall.sh - Removes the custom prompt and restores original .bashrc

set -e

echo "🔄 Uninstalling Pretty Prompt..."

# Check if the clean backup exists
if [ -f ~/.bashrc.pretty_prompt_backup ]; then
    echo "💾 Restoring from clean backup..."
    cp -f ~/.bashrc.pretty_prompt_backup ~/.bashrc
    echo "✅ Original .bashrc restored from clean backup."
else
    # Fallback: Remove just the custom prompt section
    if grep -q "# ==== PRETTY PROMPT ====" ~/.bashrc; then
        echo "🧹 Removing custom prompt section..."
        awk '/# ==== PRETTY PROMPT ====/ {skip=1} skip==0 {print} /# ==== END PROMPT ====/ {skip=0}' ~/.bashrc > ~/.bashrc.tmp && mv ~/.bashrc.tmp ~/.bashrc
        echo "✅ Custom prompt removed from .bashrc."
    else
        echo "ℹ️ No custom prompt found in .bashrc."
    fi
fi

echo "🎉 Uninstallation complete! Run 'source ~/.bashrc' or restart your terminal."
