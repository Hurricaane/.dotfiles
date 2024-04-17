return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = function()
    local lazy_status = require("lazy.status")

    return {
      options = {
        theme = "auto",
        -- globalstatus = true,
        component_separators = "",
        section_separators = { left = "", right = "" },
        disabled_filetypes = { statusline = { "dashboard", "alpha", "starter" } },
      },
      sections = {
        lualine_a = { { "mode", separator = { left = "" }, right_padding = 2 } },
        lualine_b = { "branch" },
        lualine_c = {
          "%=",
          {
            "diagnostics",
            symbols = {
              Error = " ",
              Warn = " ",
              Hint = " ",
              Info = " ",
            },
            padding = {
              left = 1,
              right = 4,
            },
          },
          {
            "filetype",
            icon_only = true,
            separator = {
              left = "",
            },
            padding = {
              left = 1,
              right = 0,
            },
            color = {
              bg = "#313244",
            },
          },
          {
            "filename",
            color = function()
              return { fg = vim.bo.modified and "#f38ba8" or "#b4befe", gui = "bold", bg = "#313244" }
            end,
            separator = {
              left = "",
              right = "",
            },
            symbols = {
              modified = " ",
              readonly = " ",
              unnamed = "[No Name]",
              newfile = " ",
            },
          },
        },
        lualine_x = {
          {
            lazy_status.updates,
            cond = lazy_status.has_updates,
            color = { fg = "#ff9e64" },
          },
          {
            "diff",
            symbols = {
              added = " ",
              modified = " ",
              removed = " ",
            },
            source = function()
              ---@diagnostic disable-next-line: undefined-field
              local gitsigns = vim.b.gitsigns_status_dict
              if gitsigns then
                return {
                  added = gitsigns.added,
                  modified = gitsigns.changed,
                  removed = gitsigns.removed,
                }
              end
            end,
          },
          { "encoding", separator = "|" },
          {
            "fileformat",
            symbols = {
              unix = "", -- e712
              dos = "", -- e70f
              mac = "", -- e711
            },
            padding = {
              left = 1,
              right = 2,
            },
          },
        },
        lualine_y = {
          "progress",
        },
        lualine_z = {
          { "location", separator = { right = "" }, left_padding = 2 },
        },
      },
      extensions = { "lazy" },
    }
  end,
}