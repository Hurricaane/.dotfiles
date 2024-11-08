return {
  "ziontee113/icon-picker.nvim",
  config = function()
    require("icon-picker").setup({ disable_legacy_commands = true })

    local opts = { noremap = true, silent = true }

    vim.keymap.set("n", "<leader>ip", "<cmd>IconPickerNormal<cr>", opts)
    vim.keymap.set("n", "<leader>iy", "<cmd>IconPickerYank<cr>", opts) --> Yank the selected icon into register
  end,
}
