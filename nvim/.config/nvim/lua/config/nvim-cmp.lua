-- nvim-cmp setup

-- local has_words_before = function()
--   unpack = unpack or table.unpack
--   local line, col = unpack(vim.api.nvim_win_get_cursor(0))
--   return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
-- end

local cmp = require("cmp")
local lspkind = require("lspkind")

cmp.setup({
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },
  formatting = {
    fields = { "kind", "abbr", "menu" },
    format = function(entry, vim_item)
      local kind = lspkind.cmp_format({ mode = "symbol_text", maxwidth = 100, ellipsis_char = "..." })(entry, vim_item)
      local strings = vim.split(kind.kind, "%s", { trimempty = true })
      kind.kind = strings[1] .. " "
      kind.menu = "  (" .. strings[2] .. ")"
      return kind
    end,
  },
  mapping = cmp.mapping.preset.insert({
    -- navigate docs
    ["<c-b>"] = cmp.mapping.scroll_docs(-4),
    ["<c-f>"] = cmp.mapping.scroll_docs(4),

    -- navigate the PMenu
    ["<c-n>"] = cmp.mapping.select_next_item({ behaviour = cmp.SelectBehavior.Insert }),
    ["<c-p>"] = cmp.mapping.select_prev_item({ behaviour = cmp.SelectBehavior.Insert }),

    -- complete, i.e. open cmp menu
    ["<c-space>"] = cmp.mapping({
      i = cmp.mapping.complete(),
      c = function(
        _ --[[fallback]]
      )
        if cmp.visible() then
          if not cmp.confirm({ select = true }) then
            return
          end
        else
          cmp.complete()
        end
      end,
    }),

    -- exit without accepting any completions
    ["<c-e>"] = cmp.mapping.abort(),

    -- accept a completion,
    ["<c-y>"] = cmp.mapping(
      cmp.mapping.confirm({
        behavior = cmp.ConfirmBehavior.Insert,
        select = true, -- see h:cmp.confirm
      }),
      { "i", "c" }
    ),

    -- ["<CR>"] = cmp.mapping.confirm({ select = true, behaviour = cmp.ConfirmBehavior.Replace }),
    ["<tab>"] = cmp.config.disable,
  }),
  window = {
    documentation = cmp.config.window.bordered({
      border = "rounded",
      winhighlight = "Normal:NormalFloat,FloatBorder:MoonflyLime",
    }),
    completion = cmp.config.window.bordered({
      border = "rounded",
      winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:MoonflyEmeraldLine",
      col_offset = -3,
      side_padding = 0,
      winblend = 10,
    }),
  },
  sorting = {
    -- https://github.com/hrsh7th/nvim-cmp/blob/main/lua/cmp/config/compare.lua
    comparators = {
      cmp.config.compare.exact,
      cmp.config.compare.offset,
      cmp.config.compare.sort_text,
      cmp.config.compare.score,
      cmp.config.compare.recently_used,

      -- copied from cmp-under, but I don't think I need the plugin for this.
      -- I might add some more of my own.
      function(entry1, entry2)
        local _, entry1_under = entry1.completion_item.label:find("^_+")
        local _, entry2_under = entry2.completion_item.label:find("^_+")
        entry1_under = entry1_under or 0
        entry2_under = entry2_under or 0
        if entry1_under > entry2_under then
          return false
        elseif entry1_under < entry2_under then
          return true
        end
      end,

      cmp.config.compare.kind,
      cmp.config.compare.length,
      cmp.config.compare.order,
    },
  },
  sources = cmp.config.sources({
    -- Order of sources below matters!
    { name = "nvim_lua" },
    { name = "luasnip" },
    { name = "nvim_lsp" },
    { name = "path" },
    { name = "latex_symbols" },
    {
      name = "buffer",
      keyword_length = 5,
      option = {
        get_bufnrs = function()
          -- Get buffer completions from only the visible buffers
          local bufs = {}
          for _, win in ipairs(vim.api.nvim_list_wins()) do
            bufs[vim.api.nvim_win_get_buf(win)] = true
          end
          return vim.tbl_keys(bufs)
        end,
      },
    },
  }),
})

cmp.setup.cmdline(":", {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = "path" },
  }, {
    { name = "cmdline" },
  }),
})
