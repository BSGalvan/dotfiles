--[[
--   Configuration for nvim-lspconfig + mason.nvim
--   Stolen from the wiki over at neovim/nvim-lspconfig and from 
--   kabouzeid/dotfiles/blob/main/config/nvim/lua/lsp-settings.lua,
--   and this deprecation notice:
--   https://github.com/williamboman/nvim-lsp-installer/discussions/876
--]]

require("mason").setup({
  ui = {
    icons = {
      package_installed = "✓",
    },
    border = "rounded",
  },
})

local mason_lspconfig = require("mason-lspconfig")

mason_lspconfig.setup({
  ensure_installed = {
    "pylsp",
    "texlab",
    "bashls",
    "clangd",
    "yamlls",
  },
})

local lspconfig = require("lspconfig")

-- This function sets up keymaps and whatnot, upon a LSP server attaching to
-- buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...)
    vim.api.nvim_buf_set_keymap(bufnr, ...)
  end

  local function buf_set_option(...)
    vim.api.nvim_buf_set_option(bufnr, ...)
  end

  buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

  -- Mappings.
  local opts = { noremap = true, silent = true }

  buf_set_keymap("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
  buf_set_keymap("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
  buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
  buf_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
  buf_set_keymap("n", "gh", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
  -- buf_set_keymap("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
  buf_set_keymap("n", "<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
  buf_set_keymap("n", "<space>e", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
  buf_set_keymap("n", "<space>q", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
  buf_set_keymap("n", "<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
  buf_set_keymap("n", "<space>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
  buf_set_keymap("n", "<space>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)
  buf_set_keymap("n", "<space>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
  buf_set_keymap("n", "<space>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)

  buf_set_keymap(
    "n",
    "]d",
    '<cmd>lua vim.diagnostic.goto_next({severity_limit = "Warning", popup_opts = {border = "rounded"}})<CR>',
    opts
  )
  buf_set_keymap(
    "n",
    "[d",
    '<cmd>lua vim.diagnostic.goto_prev({severity_limit = "Warning", popup_opts = {border = "rounded"}})<CR>',
    opts
  )

  -- Set some keybinds conditional on server capabilities
  -- Do we need this? Can we replicate formatter.nvim's capabilities?

  if client.server_capabilities.document_formatting then
    buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  elseif client.server_capabilities.document_range_formatting then
    buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
  end

  -- Set autocommands conditional on server_capabilities
  if client.server_capabilities.document_highlight then
    vim.api.nvim_exec(
      [[
            augroup lsp_document_highlight
            autocmd! * <buffer>
            autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
            autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
            augroup END
        ]],
      false
    )
  end

  -- Set borders for floating windows; from the README.md at bluz71/vim-moonfly-colors
  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = "rounded",
  })

  vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signatureHelp, {
    border = "rounded",
  })

  vim.diagnostic.config({
    float = { border = "rounded", source = "always" },
    severity_sort = true,
    update_in_insert = true,
    show_header = true,
  })

  -- Change diagnostic symbols in the sign column (gutter)
  local signs = {
    Error = " ",
    Warn = " ",
    Hint = " ",
    Information = " ",
  }

  for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
  end
end

mason_lspconfig.setup_handlers({
  function(server_name)
    local capabilities = require("cmp_nvim_lsp").default_capabilities()
    if server_name == "sumneko_lua" then
      local settings = {
        Lua = {
          runtime = {
            -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
            version = "LuaJIT",
          },
          diagnostics = {
            -- Get the language server to recognize the `vim` global
            globals = { "vim" },
          },
          workspace = {
            -- Make the server aware of Neovim runtime files
            library = vim.api.nvim_get_runtime_file("", true),
            checkThirdParty = false,
          },
          -- Do not send telemetry data containing a randomized but unique identifier
          telemetry = {
            enable = false,
          },
        },
      }
      lspconfig[server_name].setup({ capabilities = capabilities, on_attach = on_attach, settings = settings })
    else
      lspconfig[server_name].setup({ capabilities = capabilities, on_attach = on_attach })
    end
  end,
})
