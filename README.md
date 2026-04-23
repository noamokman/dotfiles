# Dotfiles

Personal dotfiles managed with [Dotbot](https://github.com/anishathalye/dotbot), supporting both macOS and Linux.

## What's Included

| Category | Details |
| --- | --- |
| **Shell** | [Zsh](https://www.zsh.org/) with [Oh My Zsh](https://ohmyz.sh/) (agnoster theme) |
| **Plugins** | zsh-autosuggestions, zsh-syntax-highlighting, you-should-use |
| **Node** | [nvm](https://github.com/nvm-sh/nvm), npmrc defaults |
| **Git** | gitconfig, global gitignore, pull rebase, auto push upstream |
| **macOS packages** | Homebrew formulae & casks (see `darwin.conf.yaml`) |
| **Linux packages** | apt-get essentials (see `linux.conf.yaml`) |

### Custom Zsh Functions

- `gsync [message]` — stage all, commit, and push to the current branch (guards against committing to the default branch)
- `gsyncf [message]` — like `gsync` but defaults the message to "fix"
- `gcln` — checkout the default branch, prune remotes, and delete all other local branches
- `gqpr [message]` — create a branch, push, and open a GitHub PR in one shot

### Aliases

- `frk` — open the current directory in Fork
- `idcp` — generate a UUID and copy it to the clipboard
- `gpr` — `gh pr create --fill`

## Installation

Clone to `~/.dotfiles`:

```sh
git clone https://github.com/noamokman/dotfiles.git ~/.dotfiles
```

Run the install script:

```sh
cd ~/.dotfiles && ./install
```

The install script auto-detects the OS and runs the appropriate config:

1. **base.conf.yaml** — symlinks (gitconfig, zshrc, npmrc, nvm, oh-my-zsh, etc.)
2. **darwin.conf.yaml** — Homebrew formulae & casks (macOS only)
3. **linux.conf.yaml** — apt-get packages (Linux only)
4. **post.conf.yaml** — sets Zsh as the default shell, installs global Node modules

### Local Overrides

Source machine-specific config by creating `~/.zshrc.local.sh` — it is automatically loaded if present.

## Dotbot Plugins

- [dotbot-brew](https://github.com/d12frosted/dotbot-brew) — Homebrew support
- [dotbot-apt](https://github.com/bryant1410/dotbot-apt) — apt support

## License

Released into the public domain. See `LICENSE.md` for details.
