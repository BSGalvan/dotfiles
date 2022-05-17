--[[
--   Configuration for nvim-lspconfig + nvim-lsp-installer
--   Stolen from the wiki over at neovim/nvim-lspconfig and from 
--   kabouzeid/dotfiles/blob/main/config/nvim/lua/lsp-settings.lua
--]]

-- keymaps
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

  -- Set borders for floating windows
  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = "rounded",
  })

  vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signatureHelp, {
    border = "rounded",
  })

  -- Change diagnostic symbols in the sign column (gutter)
  local signs = {
    Error = " ",
    Warning = " ",
    Hint = " ",
    Information = " ",
  }

  for type, icon in pairs(signs) do
    local hl = "LspDiagnosticsSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
  end
end

-- function that activates keymaps and enables snippet support
local function make_config(server_name)
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  -- What is this huge chunk of code?
  capabilities.textDocument.completion.completionItem.documentationFormat = { "markdown", "plaintext" }
  capabilities.textDocument.completion.completionItem.snippetSupport = true
  capabilities.textDocument.completion.completionItem.preselectSupport = true
  capabilities.textDocument.completion.completionItem.insertReplaceSupport = true
  capabilities.textDocument.completion.completionItem.labelDetailsSupport = true
  capabilities.textDocument.completion.completionItem.deprecatedSupport = true
  capabilities.textDocument.completion.completionItem.commitCharactersSupport = true
  capabilities.textDocument.completion.completionItem.tagSupport = { valueSet = { 1 } }
  capabilities.textDocument.completion.completionItem.resolveSupport = {
    properties = {
      "documentation",
      "detail",
      "additionalTextEdits",
    },
  }

  capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

  local config = {
    -- enable all the stuff above + snippets
    capabilities = capabilities,
    -- map buffer local keybindings when the language server attaches
    on_attach = on_attach,
  }

  if server_name == "clangd" then
    config.filetypes = { "c", "cpp" } -- we don't want objective-c and objective-cpp!
  end
  if server_name == "vim" then
    config.init_options = { isNeovim = true }
  end

  return config
end

-- nvim-lsp-installer
-- local function setup_servers()
--   local lsp_installer = require("nvim-lsp-installer")

--   -- get all installed servers
--   local lsp_installer_servers = require("nvim-lsp-installer.servers")

--   -- loop over all installed servers and give them configs
--   -- defined above, if active; if not installed, queue them to
--   -- be installed
--   for _, server in pairs(lsp_installer_servers) do
--     local config = make_config()
--     local server_available, requested_server = lsp_installer_servers.get_server(server.name)

--     if server_available then
--       requested_server:on_ready(function()
--         local opts = config
--         requested_server:setup(opts)
--       end)
--       if not requested_server:is_installed() then
--         -- Queue the server to be installed
--         requested_server:install()
--       end
--     end
--   end
-- end

-- setup_servers()

-- setup servers installed with nvim-lsp-installer
-- Register a handler that will be called for all installed servers.
require("nvim-lsp-installer").on_server_ready(function(server)
  server:setup(make_config(server.name))
  vim.cmd([[ do User LspAttachBuffers ]])
end)
