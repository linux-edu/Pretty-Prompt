#!/bin/bash
# uninstall.sh — Reverts CLI prompt customization

set -e

echo "♻️ Uninstalling custom CLI prompt..."

if [ -f ~/.bashrc.backup ]; then
    echo "🔄 Restoring .bashrc from backup..."
    cp -f ~/.bashrc.backup ~/.bashrc
    echo "✅ Backup restored."
else
    echo "⚠️ No backup found. Attempting to clean custom prompt manually..."
    
    sed -i '/# ==== CUSTOM PROMPT ====/,/^# ==== END PROMPT ====/{d}' ~/.bashrc

    echo "✅ Custom prompt lines removed."
fi

echo "🧹 Done. Run: source ~/.bashrc or restart terminal."
