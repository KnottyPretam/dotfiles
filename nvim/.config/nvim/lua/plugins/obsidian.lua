return {
  "obsidian-nvim/obsidian.nvim",
  version = "*",                    -- pin to latest release
  lazy = true,
  ft = "markdown",                  -- or use 'event' to load only inside the vault
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim", -- or fzf-lua / mini.pick
  },
  ---@module 'obsidian'
  ---@type obsidian.config
  opts = {
    legacy_commands = false,
    workspaces = {
      {
        name = "knightwerx",
        path = "~/knightwerx-vault",     -- <-- point to YOUR existing vault folder
      },
    },
    completion = {
      nvim_cmp = true,              -- set false if you use blink.cmp
      min_chars = 2,
    },
    picker = { name = "telescope.nvim" },
  },
}
