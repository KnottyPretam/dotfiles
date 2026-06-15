return {
  "yetone/avante.nvim",
  event = "VeryLazy",
  lazy = false,
  version = false,
  build = "make",

  -- Explicit lazy.nvim keymap for the Avante panel.
  -- I’m using <leader>at to match Avante’s default “Avante toggle” mapping.
  keys = {
    { "<leader>at", "<cmd>AvanteToggle<CR>", desc = "Avante: toggle panel" },
    { "<leader>as", "<cmd>AvanteStop<CR>", desc = "Avante: stop generation" },
    { "<leader>ac", "<cmd>AvanteClear<CR>", desc = "Avante: clear session" },

    -- If you truly want just <leader>a, use this instead and remove the line above:
    -- { "<leader>a", "<cmd>AvanteToggle<CR>", desc = "Avante: toggle panel" },
  },

  opts = {
    mode = "agentic",

    -- Use Codex via ACP, not the OpenAI API provider.
    provider = "codex",

    -- Explicit Codex ACP setup for ChatGPT-subscription auth.
    -- Do NOT pass OPENAI_API_KEY/CODEX_API_KEY here if you want subscription billing.
    acp_providers = {
      ["codex"] = {
        command = "npx",
        args = { "-y", "-g", "@zed-industries/codex-acp" },
        env = {
          NODE_NO_WARNINGS = "1",
          HOME = os.getenv("HOME"),
          PATH = os.getenv("PATH"),
        },
      },
    },


    -- Traditional API providers. Both Ollama models live here.
    providers = {
      ollama = {
        endpoint = "http://127.0.0.1:11434",  -- no /v1
        model = "gpt-oss:20b",
        timeout = 60000,
        is_env_set = ollama_alive,
        extra_request_body = {
          options = {
            temperature = 0.75,
            num_ctx = 16384,
            keep_alive = "5m",
          },
        },
      },
      ["ollama-gemma"] = {
        __inherited_from = "ollama",
        model = "gemma4:26b",
      },
    },

    mappings = {
      toggle = {
        default = "<leader>at",
      },
    },
  },

  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "stevearc/dressing.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",

    -- optional selectors/completion
    "echasnovski/mini.pick",
    "echasnovski/mini.diff",
    "nvim-telescope/telescope.nvim",
    "hrsh7th/nvim-cmp",
    "ibhagwan/fzf-lua",
    "nvim-tree/nvim-web-devicons",

    -- Not needed for Codex. Keep it only if you use Copilot elsewhere.
    -- "zbirenbaum/copilot.lua",

    {
      -- support for image pasting
      "HakonHarnes/img-clip.nvim",
      event = "VeryLazy",
      opts = {
        default = {
          embed_image_as_base64 = false,
          prompt_for_file_name = false,
          drag_and_drop = {
            insert_mode = true,
          },
          use_absolute_path = true,
        },
      },
    },

    {
      "MeanderingProgrammer/render-markdown.nvim",
      opts = {
        file_types = { "markdown" },
      },
      ft = { "markdown" },
    },
  },
}


-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
