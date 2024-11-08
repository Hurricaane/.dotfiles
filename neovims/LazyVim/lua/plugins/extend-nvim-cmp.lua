return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-nvim-lua",
  },
  opts = function(_, opts)
    vim.api.nvim_set_hl(0, "CmpGhostText", {})

    local cmp = require("cmp")
    local luasnip = require("luasnip")

    opts.mapping = vim.tbl_extend("force", opts.mapping, {
      ["<C-j>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
      ["<C-k>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
      ["<C-y>"] = LazyVim.cmp.confirm({ select = true }),
      ["<C-e>"] = function(fallback)
        cmp.abort()
        fallback()
      end,
      ["<C-l>"] = cmp.mapping(function()
        if luasnip.expand_or_locally_jumpable() then
          luasnip.expand_or_jump()
        end
      end, { "i", "s" }),
      ["<C-h>"] = cmp.mapping(function()
        if luasnip.locally_jumpable(-1) then
          luasnip.jump(-1)
        end
      end, { "i", "s" }),
    })

    table.insert(opts.sources, { name = "nvim_lua" })

    opts.window = {
      completion = {
        border = "rounded",
        winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,CursorLine:PmenuSel,Search:None",
      },
      documentation = {
        border = "rounded",
        winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,CursorLine:PmenuSel,Search:None",
      },
    }

    opts.view = {
      entries = {
        follow_cursor = true,
      },
    }

    opts.experimental = vim.tbl_extend("force", opts.experimental, {
      ghost_text = false,
    })
  end,
}