return {
  "saghen/blink.cmp",
  dependencies = {
    "saghen/blink.compat",
    "petertriho/cmp-git",
    "hrsh7th/cmp-emoji",
    "davidsierradz/cmp-conventionalcommits",
    "mikavilpas/blink-ripgrep.nvim",
  },
  opts = {
    keymap = {
      preset = "default",
      ["<C-p>"] = {},
      ["<C-n>"] = {},
      ["<C-k>"] = { "select_prev", "fallback" },
      ["<C-j>"] = { "select_next", "fallback" },
      ["<C-h>"] = { "snippet_backward", "fallback" },
      ["<C-l>"] = { LazyVim.cmp.map({ "snippet_forward", "ai_accept" }), "fallback" },
      ["<C-e>"] = { "cancel", "hide", "fallback" },
      ["<C-c>"] = { "cancel", "hide", "fallback" },
    },
    completion = {
      list = {
        selection = "auto_insert",
      },
      menu = {
        border = "rounded",
        scrollbar = false,
        draw = {
          columns = { { "label", "label_description", gap = 1 }, { "kind_icon", "kind" } },
        },
      },
      documentation = {
        window = {
          border = "rounded",
        },
      },
    },
    sources = {
      default = { "ripgrep" },
      compat = { "git", "emoji", "conventionalcommits" },
      providers = {
        git = { kind = "Git" },
        emoji = { kind = "Emoji" },
        conventionalcommits = { kind = "ConventionalCommits" },
        codeium = {
          kind = "Codeium",
          score_offset = 100,
          async = true,
          ignored_filetypes = {
            "oil",
            "AvanteInput",
          },
        },
        ripgrep = {
          module = "blink-ripgrep",
          name = "Ripgrep",
          kind = "Ripgrep",
          opts = {
            prefix_min_len = 3,
            context_size = 5,
            max_filesize = "1M",
            additional_rg_options = {},
          },
        },
      },
    },
  },
}