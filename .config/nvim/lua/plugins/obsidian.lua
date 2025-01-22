return {
  "epwalsh/obsidian.nvim",
  version = "*",  -- recommended, use latest release instead of latest commit
  lazy = true,

  -- Only load obsidian.nvim for markdown files in vault.
  event = {
    "BufReadPre /root/notes/*.md",
    "BufNewFile /root/notes/*.md",
  },

  dependencies = {
    -- Required.
    "nvim-lua/plenary.nvim",

    -- Recommended optional.
    "hrsh7th/nvim-cmp",
    "ibhagwan/fzf-lua",
    "nvim-treesitter",
  },
  opts = {
    workspaces = {
      {
        name = "notes",
        path = "/root/notes",
      },
    },
  },
}
