#!/usr/bin/env zsh
set -euo pipefail

# Determine repo root (where this script lives)
DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"
TIMESTAMP="$(date +%Y%m%d_%H%M%S)"
BACKUP_DIR="$HOME/dotfiles_backup_$TIMESTAMP"

echo "→ Backing up existing dotfiles to $BACKUP_DIR"
mkdir -p "$BACKUP_DIR"

# Helper to backup and symlink a single file
link_dotfile() {
  local src="$DOTFILES_DIR/$1"
  local dest="$HOME/$1"

  if [[ -e "$dest" || -L "$dest" ]]; then
    mv "$dest" "$BACKUP_DIR/"
    echo "  • Moved existing $dest → $BACKUP_DIR/"
  fi

  ln -s "$src" "$dest"
  echo "  ✓ Linked $src → $dest"
}

# 1) Dotfiles in home
for f in .zshrc .gitconfig .gitignore; do
  link_dotfile "$f"
done

# 2) Everything under .config/
if [[ -d "$DOTFILES_DIR/.config" ]]; then
  mkdir -p "$HOME/.config"
  for cfg in "$DOTFILES_DIR/.config"/*; do
    cfgname="$(basename "$cfg")"
    link_dotfile ".config/$cfgname"
  done
fi

echo "✅  Dotfiles setup complete!"

