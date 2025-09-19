#!/bin/bash
# uninstall.sh - Removes the custom prompt and restores original .bashrc

set -e

echo "🔄 Uninstalling Pretty Prompt..."

# First, try to remove just the prompt section (clean approach)
if grep -q "# ==== PRETTY PROMPT ====" ~/.bashrc; then
    echo "🧹 Removing custom prompt section..."
    awk '/# ==== PRETTY PROMPT ====/ {skip=1} skip==0 {print} /# ==== END PROMPT ====/ {skip=0}' ~/.bashrc > ~/.bashrc.tmp && mv ~/.bashrc.tmp ~/.bashrc
    echo "✅ Custom prompt removed from .bashrc."
    
    # Offer to restore from clean backup if desired
    read -p "Restore original .bashrc from clean backup? (y/N): " RESTORE_CHOICE
    if [[ $RESTORE_CHOICE == "y" || $RESTORE_CHOICE == "Y" ]]; then
        if [ -f ~/.bashrc.pretty_prompt_backup ]; then
            cp -f ~/.bashrc.pretty_prompt_backup ~/.bashrc
            echo "✅ Original .bashrc restored from clean backup."
        else
            echo "ℹ️ No clean backup found. Using current modified .bashrc."
        fi
    fi
else
    echo "ℹ️ No custom prompt found in .bashrc."
    
    # If no prompt but backup exists, offer to restore
    if [ -f ~/.bashrc.pretty_prompt_backup ]; then
        read -p "Restore original .bashrc from clean backup? (y/N): " RESTORE_CHOICE
        if [[ $RESTORE_CHOICE == "y" || $RESTORE_CHOICE == "Y" ]]; then
            cp -f ~/.bashrc.pretty_prompt_backup ~/.bashrc
            echo "✅ Original .bashrc restored from clean backup."
        fi
    fi
fi

echo "🎉 Uninstallation complete! Run 'source ~/.bashrc' or restart your terminal."
