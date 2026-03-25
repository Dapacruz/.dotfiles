# .dotfiles

Personal dotfiles for macOS, Linux, and DevContainer/DevPod environments. Uses [Ansible](https://www.ansible.com/) for automated provisioning and [GNU Stow](https://www.gnu.org/software/stow/) for symlink management.

## Table of Contents

- [Overview](#overview)
- [Repository Structure](#repository-structure)
- [What's Included](#whats-included)
- [Prerequisites](#prerequisites)
- [Bootstrap](#bootstrap)
  - [macOS](#bootstrap-macos)
  - [Linux](#bootstrap-linux)
  - [DevPod / DevContainer](#bootstrap-devpod--devcontainer)
- [Post-Installation](#post-installation)
- [Customization](#customization)
- [Updating Dotfiles](#updating-dotfiles)

---

## Overview

Running the bootstrap script for your platform will:

1. Install **Homebrew** (if not already present)
2. Install **Ansible** and required Galaxy collections
3. Run an `ansible-pull` playbook that installs packages and applications
4. Install **Oh My Zsh**
5. Use **GNU Stow** to symlink all configuration files into `$HOME`
6. Clone the **Tmux Plugin Manager (TPM)**

---

## Repository Structure

```
.dotfiles/
├── common/
│   └── stow/               # Configs shared across all platforms
│       ├── git/
│       ├── kitty/
│       ├── lazygit/
│       ├── nvim/
│       ├── starship.toml/
│       └── tmux/
├── devcontainer/
│   ├── ansible/playbooks/  # Ansible playbook for DevContainer
│   ├── stow/               # DevContainer-specific configs
│   └── bootstrap.sh
├── linux/
│   ├── ansible/playbooks/  # Ansible playbook for Linux
│   ├── stow/               # Linux-specific configs
│   └── bootstrap.sh
├── macos/
│   ├── ansible/playbooks/  # Ansible playbook for macOS
│   ├── packages/           # Supplementary install scripts
│   ├── stow/               # macOS-specific configs
│   └── bootstrap.sh
└── setup/
    └── setup               # Minimal DevContainer setup script
```

---

## What's Included

### Shared Configurations (all platforms)

| Config | Description |
|--------|-------------|
| `git` | Git config and aliases |
| `kitty` | Kitty terminal emulator config |
| `lazygit` | LazyGit TUI config |
| `nvim` | Neovim config |
| `starship.toml` | Starship cross-shell prompt |
| `tmux` | Tmux config + TPM plugin setup |

### macOS-Specific Configurations

| Config | Description |
|--------|-------------|
| `zshrc` | Zsh shell config |
| `zsh.d` | Zsh plugins and extras |
| `zsh.funcs` | Custom Zsh functions |
| `bin` | Personal scripts (`~/.local/bin`) |
| `cheat` | `cheat` community cheatsheets config |
| `karabiner` | Karabiner-Elements key remapping |
| `lf` | `lf` terminal file manager config |
| `neofetch` | Neofetch system info config |

### macOS Applications (Homebrew Casks)

AeroSpace, AnythingLLM, Bartender, BetterTouchTool, CleanShot, DevPod, Ghostty, Google Chrome, Karabiner-Elements, KeePassXC, Kitty, LM Studio, Maccy, Obsidian, Ollama, Postman, Rancher Desktop, Raycast, Stats, Swish, Vagrant, Vivaldi, VLC, and more.

### Linux / DevContainer Applications

Vivaldi, KeePassXC, Kitty terminal (Linux bootstrap only), and a curated set of Homebrew formulae mirroring the macOS setup.

### Key CLI Tools (all platforms)

`bat`, `btop`, `dust`, `fd`, `fzf`, `gh`, `go`, `jq`, `k9s`, `lazygit`, `lsd`, `neovim`, `procs`, `ripgrep`, `starship`, `tmux`, `tokei`, `uv`, `yq`, `zoxide`, and more.

---

## Prerequisites

### macOS

- macOS (Apple Silicon or Intel)
- Internet access
- An admin account (sudo access required)

> Homebrew and Ansible are installed automatically by the bootstrap script.

### Linux

- Debian/Ubuntu-based distribution
- `sudo` privileges
- Internet access

> Ansible, `curl`, `git`, and `stow` are installed automatically.

### DevPod / DevContainer

- [DevPod](https://devpod.sh/) installed locally
- A configured provider (e.g., Kubernetes, Docker)

---

## Bootstrap

### Bootstrap macOS

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Dapacruz/.dotfiles/master/macos/bootstrap.sh)"
```

You will be prompted for your sudo password. The password is temporarily written to `become_pass.txt` (deleted automatically at the end) and used by Ansible's become mechanism.

### Bootstrap Linux

```bash
/bin/bash -c "$(wget -O- https://raw.githubusercontent.com/Dapacruz/.dotfiles/master/linux/bootstrap.sh)"
```

This installs Ansible, `curl`, `git`, and `stow` via APT, then runs the Ansible playbook.

### Bootstrap DevPod / DevContainer

```bash
devpod up . --dotfiles https://github.com/Dapacruz/.dotfiles.git --provider kubernetes --ide none
```

Replace `--provider kubernetes` with your configured DevPod provider (e.g., `docker`, `ssh`).

---

## Post-Installation

### Install Tmux Plugins

After the bootstrap completes, open a Tmux session and press `prefix + I` (capital I) to fetch and install all plugins defined in `~/.config/tmux/tmux.conf` via TPM.

### Zsh Local Config

A `~/.zshrc.local` file is created from the template at first stow. Use it for machine-specific settings that should not be committed to the repository (custom `PATH` entries, credentials, work-specific aliases, etc.):

```bash
# ~/.zshrc.local
export MY_WORK_TOKEN="..."
export PATH="$HOME/projects/bin:$PATH"
```

---

## Customization

### Adding or Removing Stowed Configs

Each platform's `stow/configs.sh` defines which paths are managed. Edit the relevant file to add or remove entries:

- macOS: `macos/stow/configs.sh`
- Linux: `linux/stow/configs.sh`
- DevContainer: `devcontainer/stow/configs.sh`

### Re-stowing After Changes

Use the provided helper scripts from the platform's `stow/` directory:

```bash
# Re-stow all configs
~/.dotfiles/macos/stow/restow.sh

# Remove all symlinks
~/.dotfiles/macos/stow/unstow.sh

# Create/update all symlinks
~/.dotfiles/macos/stow/stow.sh
```

---

## Updating Dotfiles

Pull the latest changes and re-stow:

```bash
cd ~/.dotfiles
git pull
~/.dotfiles/macos/stow/restow.sh   # or linux/ or devcontainer/
```

To re-run the full Ansible playbook (e.g., to install newly added packages):

```bash
# macOS
ansible-pull -i $HOSTNAME, --limit=localhost,$HOSTNAME \
  -U https://github.com/Dapacruz/.dotfiles \
  macos/ansible/playbooks/deploy-dotfiles.yml

# Linux
ansible-pull -i $HOSTNAME, --limit=localhost,$HOSTNAME \
  -U https://github.com/Dapacruz/.dotfiles \
  linux/ansible/playbooks/deploy-dotfiles.yml
```
