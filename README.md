# dotfiles

Personal config, managed with [GNU Stow](https://www.gnu.org/software/stow/).
Each top-level directory is a stow package whose contents mirror `$HOME`.

## Usage

```
sudo apt install stow   # or your distro's equivalent

cd ~/repos/dotfiles
stow bash claude git nvim starship tmux
```

`.stowrc` sets the target to `/home/pchoudhury`, so `stow <package>` run from
the repo root symlinks straight into `$HOME` without needing `-t`.

If a target file already exists (e.g. a fresh `~/.bashrc`), stow will refuse
rather than overwrite it. Move the existing file aside first, or use
`stow --adopt <package>` to pull the live file into the repo, then check
`git diff` before committing.

To remove a package's symlinks: `stow -D <package>`.

## Packages

- **bash** — `.bashrc`
- **claude** — Claude Code global config (`CLAUDE.md`, `settings.json`,
  hand-authored skills, plugin marketplace/install records). See
  `docs/claude.md` for plugin install commands and other notes.
- **git** — global `.config/git/ignore`
- **nvim** — Neovim config (lazy.nvim, LSP, Avante, Obsidian integration)
- **starship** — `starship.toml`
- **tmux** — `.tmux.conf` (uses [tpm](https://github.com/tmux-plugins/tpm) —
  clone it to `~/.config/tmux/plugins/tpm` separately, it isn't vendored here)

## Notes

- Secrets are never committed. `~/.bashrc` sources `~/.bashrc.local`
  (untracked) for anything like `FORGEJO_TOKEN`.
- Claude Code plugin marketplaces/caches aren't vendored — only
  `installed_plugins.json` and `known_marketplaces.json` are tracked as a
  record of what's installed. Re-fetch them with the commands in
  `docs/claude.md`.
- Paths in tracked configs (hooks, permissions, `PATH` exports) are
  hardcoded to this machine's `/home/pchoudhury`, matching the stow target.
