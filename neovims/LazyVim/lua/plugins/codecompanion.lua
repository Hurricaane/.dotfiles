return {
  -- "olimorris/codecompanion.nvim",
  -- dependencies = {
  --   "nvim-lua/plenary.nvim",
  --   "nvim-treesitter/nvim-treesitter",
  --   {
  --     "OXY2DEV/markview.nvim",
  --     ft = { "markdown", "codecompanion" },
  --     opts = {
  --       filetypes = { "markdown", "codecompanion" },
  --     },
  --   },
  -- },
  -- opts = {
  --   adapters = {
  --     ollama = function()
  --       return require("codecompanion.adapters").extend("ollama", {
  --         env = {
  --           url = "https://c445-35-229-44-95.ngrok-free.app/",
  --         },
  --         headers = {
  --           ["Content-Type"] = "application/json",
  --         },
  --         parameters = {
  --           sync = true,
  --         },
  --       })
  --     end,
  --   },
  --   strategies = {
  --     chat = {
  --       adapter = "gemini",
  --     },
  --     inline = {
  --       adapter = "gemini",
  --     },
  --   },
  -- },
  -- config = function(_, opts)
  --   require("codecompanion").setup(opts)
  --   local map = vim.keymap.set
  --   map("n", "<leader>Cc", "<cmd>CodeCompanionChat Toggle<CR>", { desc = "Toggle CodeCompanion chat" })
  --   map({ "n", "v" }, "<leader>Ca", "<cmd>CodeCompanionActions Toggle<CR>", { desc = "Toggle CodeCompanion actions" })
  --
  --   vim.cmd([[cab cc CodeCompanion]])
  -- end,
}
