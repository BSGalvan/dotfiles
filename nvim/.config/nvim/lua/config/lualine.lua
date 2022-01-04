-- Moonline config for lualine
-- Author : bsgalvan
-- Credit : shadmansaleh, glepnir

local lualine = require("lualine")

-- Color table for highlights
-- Colors specifically for bluz71/vim-moonfly-colors
local colors = {
  bg = "#0d0f0c",
  fg = "#ffffff",
  yellow = "#e3c78a",
  cyan = "#36c692",
  darkblue = "#080808",
  green = "#85dc85",
  orange = "#de935f",
  violet = "#ae81ff",
  magenta = "#d183e8",
  blue = "#80a0ff",
  red = "#ff5454",
}

local conditions = {
  buffer_not_empty = function()
    return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
  end,
  hide_in_width = function()
    return vim.fn.winwidth(0) > 80
  end,
  check_git_workspace = function()
    local filepath = vim.fn.expand("%:p:h")
    local gitdir = vim.fn.finddir(".git", filepath .. ";")
    return gitdir and #gitdir > 0 and #gitdir < #filepath
  end,
}

-- Actual configuration
local config = {
  options = {
    -- Disable sections and component separators
    component_separators = "",
    section_separators = "",
    theme = {
      -- We are going to use lualine_c and lualine_x as left and
      -- right sections, respectively. Both are highlighted by c theme.
      -- So we are just setting default looks of the statusline
      normal = { c = { fg = colors.fg, bg = colors.bg } },
      inactive = { c = { fg = colors.fg, bg = colors.bg } },
    },
  },
  sections = {
    -- these are to remove the defaults
    lualine_a = {},
    lualine_b = {},
    lualine_y = {},
    lualine_z = {},
    -- These will be filled later
    lualine_c = {},
    lualine_x = {},
  },
  inactive_sections = {
    -- these are to remove the defaults
    lualine_a = {},
    lualine_v = {},
    lualine_y = {},
    lualine_z = {},
    lualine_c = {},
    lualine_x = {},
  },
}

-- Inserts a component in lualine_c at left section
local function ins_left(component)
  table.insert(config.sections.lualine_c, component)
end

-- Inserts a component in lualine_x at right section
local function ins_right(component)
  table.insert(config.sections.lualine_x, component)
end

ins_left({
  function()
    return "▊"
  end,
  color = { fg = "#194e45" }, -- Sets highlighting of component
  padding = { left = 0 }, -- We don't need space before this
})

ins_left({
  -- mode component
  function()
    -- auto change color according to neovim's mode
    local mode_color = {
      n = colors.red,
      i = colors.green,
      v = colors.blue,
      [""] = colors.blue,
      V = colors.blue,
      c = colors.magenta,
      no = colors.red,
      s = colors.orange,
      S = colors.orange,
      [""] = colors.orange,
      ic = colors.yellow,
      R = colors.violet,
      Rv = colors.violet,
      cv = colors.red,
      ce = colors.red,
      r = colors.cyan,
      rm = colors.cyan,
      ["r?"] = colors.cyan,
      ["!"] = colors.red,
      t = colors.red,
    }
    vim.api.nvim_command("hi! LualineMode guifg=" .. mode_color[vim.fn.mode()] .. " guibg=" .. colors.bg)
    return "  "
  end,
  color = "LualineMode",
  padding = { left = 0 },
})

-- ins_left {
-- -- filesize component
-- function()
-- local function format_file_size(file)
-- local size = vim.fn.getfsize(file)
-- if size <= 0 then return '' end
-- local sufixes = {'b', 'k', 'm', 'g'}
-- local i = 1
-- while size > 1024 do
-- size = size / 1024
-- i = i + 1
-- end
-- return string.format('%.1f%s', size, sufixes[i])
-- end
-- local file = vim.fn.expand('%:p')
-- if string.len(file) == 0 then return '' end
-- return format_file_size(file)
-- end,
-- condition = conditions.buffer_not_empty
-- }

ins_left({
  "filename",
  cond = conditions.buffer_not_empty,
  color = { fg = colors.magenta, gui = "bold" },
})

ins_left({
  "filetype",
  icon_only = true,
  colored = true,
})

ins_left({ "location" })

ins_left({
  "progress",
  color = { fg = colors.fg, gui = "bold" },
})

ins_left({
  "diagnostics",
  sources = { "nvim_diagnostic" },
  symbols = { error = " ", warn = " ", info = " " },
  diagnostics_color = {
    error = { fg = colors.red },
    warning = { fg = colors.yellow },
    info = { fg = colors.cyan },
  },
})

-- Insert mid section. You can make any number of sections in neovim :)
-- for lualine it's any number greater then 2
ins_left({
  function()
    return "%="
  end,
})

ins_left({
  -- LSP server name
  function()
    local msg = "No Active Lsp"
    local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
    local clients = vim.lsp.get_active_clients()
    if next(clients) == nil then
      return msg
    end
    for _, client in ipairs(clients) do
      local filetypes = client.config.filetypes
      if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
        return client.name
      end
    end
    return msg
  end,
  icon = " LSP:",
  color = { fg = colors.blue, gui = "bold" },
})

-- Add components to right sections
-- ins_right {
-- 'o:encoding', -- option component same as &encoding in viml
-- upper = true, -- I'm not sure why it's upper case either ;)
-- condition = conditions.hide_in_width,
-- color = { fg = colors.green, gui = 'bold' }
-- }

ins_right({
  "fileformat",
  fmt = string.upper,
  icons_enabled = false, -- I think icons are cool but Eviline doesn't have them. sigh
  color = { fg = colors.green, gui = "bold" },
})

ins_right({
  "branch",
  icon = "",
  cond = conditions.check_git_workspace,
  color = { fg = colors.violet, gui = "bold" },
})

ins_right({
  "diff",
  -- Is it me or the symbol for modified is really weird
  -- You're right, it is!
  -- symbols = {added = ' ', modified = ' ', removed = ' '},
  symbols = { added = " ", modified = "柳", removed = " " },
  diff_color = {
    added = { fg = colors.green },
    modified = { fg = colors.orange },
    removed = { fg = colors.red },
  },
  cond = conditions.hide_in_width,
})

ins_right({
  function()
    return "▊"
  end,
  color = { fg = "#194e45" },
  padding = { right = 0 },
})

-- Now don't forget to initialize lualine
lualine.setup(config)
