# Dotfiles Configuration

This repository contains personal configuration (dotfiles) for:

- **Zsh** (`.zshrc`)
- **Git** (`.gitconfig`, `.gitignore`)
- **Various applications** under the `~/.config/` directory

A helper script (`setup.sh`) makes it easy to install or update these configs on any machine.

---

## Table of Contents

1. [Prerequisites](#prerequisites)
2. [Installation](#installation)
3. [Usage](#usage)
4. [Backup Behavior](#backup-behavior)
5. [Adding or Updating Configs](#adding-or-updating-configs)
6. [Troubleshooting](#troubleshooting)
7. [Contributing](#contributing)
8. [License](#license)

---

## Prerequisites

Before running the installation script, ensure you have:

- **Zsh** (tested on Zsh 5.8+)
- **Git** (for version control)
- A Unix‑like operating system (macOS, Linux)

---

## Installation

1. **Clone this repository** to your home directory (or wherever you keep dotfiles):

   ```bash
   git clone https://github.com/<your-username>/dotfiles.git ~/dotfiles
   cd ~/dotfiles
   ```

2. **Make the setup script executable**:

   ```bash
   chmod +x setup.sh
   ```

3. **Run the setup script**:

   ```bash
   ./setup.sh
   ```

This will:

- Create a timestamped backup of any existing dotfiles in your home directory (`~/dotfiles_backup_YYYYMMDD_HHMMSS`).
- Symlink all files (`.zshrc`, `.gitconfig`, `.gitignore`) and contents of `~/.config/` from this repo into your home directory.

---

## Usage

After setup, your shell and applications will immediately pick up the new configurations. To apply changes to Zsh without restarting your terminal, run:

```bash
source ~/.zshrc
```

---

## Backup Behavior

- The script moves existing files/dirs to a backup folder in your home:
  ```text
  ~/dotfiles_backup_20250716_002230
  ```
- You can restore any file by copying it back from the backup directory.

---

## Adding or Updating Configs

1. **Add or modify** your config files in this repository.
2. **Commit & push** your changes.
3. **Re-run** `./setup.sh` on any machine to pull in updates.

---

## Troubleshooting

- **Permission errors**: Ensure `setup.sh` is executable and you have write access to your home directory.
- **Symlink errors**: Remove old symlinks or backups in `~/dotfiles_backup_*` if necessary.

If you encounter other issues, feel free to open an issue in this repository.

---

## Contributing

Contributions are welcome! Feel free to:

- Improve or extend the scripts
- Add new application configs under `~/.config/`
- Fix typos and bugs

Please submit a pull request or open an issue.

---

## License

This dotfiles repo is provided under the [MIT License](LICENSE). Feel free to use or modify it for your own setup.

