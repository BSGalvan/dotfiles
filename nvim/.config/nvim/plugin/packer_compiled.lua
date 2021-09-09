-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/bsg/.cache/nvim/packer_hererocks/2.0.5/share/lua/5.1/?.lua;/home/bsg/.cache/nvim/packer_hererocks/2.0.5/share/lua/5.1/?/init.lua;/home/bsg/.cache/nvim/packer_hererocks/2.0.5/lib/luarocks/rocks-5.1/?.lua;/home/bsg/.cache/nvim/packer_hererocks/2.0.5/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/bsg/.cache/nvim/packer_hererocks/2.0.5/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/bsg/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp"
  },
  ["commented.nvim"] = {
    loaded = true,
    path = "/home/bsg/.local/share/nvim/site/pack/packer/start/commented.nvim"
  },
  ["css-colors"] = {
    commands = { "ColorizerToggle", "ColorizerAttachToBuffer", "ColorizerDetachFromBuffer", "ColorizerReloadAllBuffers" },
    loaded = false,
    needs_bufread = false,
    path = "/home/bsg/.local/share/nvim/site/pack/packer/opt/css-colors"
  },
  ["formatter.nvim"] = {
    commands = { "Format" },
    loaded = false,
    needs_bufread = false,
    path = "/home/bsg/.local/share/nvim/site/pack/packer/opt/formatter.nvim"
  },
  ["indent-blankline.nvim"] = {
    loaded = true,
    path = "/home/bsg/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim"
  },
  lspconfig = {
    loaded = true,
    path = "/home/bsg/.local/share/nvim/site/pack/packer/start/lspconfig"
  },
  lspinstall = {
    loaded = true,
    path = "/home/bsg/.local/share/nvim/site/pack/packer/start/lspinstall"
  },
  ["lualine.nvim"] = {
    loaded = true,
    path = "/home/bsg/.local/share/nvim/site/pack/packer/start/lualine.nvim"
  },
  moonfly = {
    config = { "\27LJ\1\0020\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\21bsg.config.theme\frequire\0" },
    loaded = true,
    path = "/home/bsg/.local/share/nvim/site/pack/packer/start/moonfly"
  },
  neorg = {
    loaded = true,
    path = "/home/bsg/.local/share/nvim/site/pack/packer/start/neorg"
  },
  ["nvim-cmp"] = {
    loaded = true,
    path = "/home/bsg/.local/share/nvim/site/pack/packer/start/nvim-cmp"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/home/bsg/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/bsg/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/bsg/.local/share/nvim/site/pack/packer/start/packer.nvim"
  },
  playground = {
    loaded = true,
    path = "/home/bsg/.local/share/nvim/site/pack/packer/start/playground"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/bsg/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  startuptime = {
    commands = { "StartupTime" },
    loaded = false,
    needs_bufread = false,
    path = "/home/bsg/.local/share/nvim/site/pack/packer/opt/startuptime"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/home/bsg/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/home/bsg/.local/share/nvim/site/pack/packer/start/vim-surround"
  },
  ["vim-vsnip"] = {
    loaded = true,
    path = "/home/bsg/.local/share/nvim/site/pack/packer/start/vim-vsnip"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: moonfly
time([[Config for moonfly]], true)
try_loadstring("\27LJ\1\0020\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\21bsg.config.theme\frequire\0", "config", "moonfly")
time([[Config for moonfly]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Format lua require("packer.load")({'formatter.nvim'}, { cmd = "Format", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file ColorizerDetachFromBuffer lua require("packer.load")({'css-colors'}, { cmd = "ColorizerDetachFromBuffer", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file ColorizerAttachToBuffer lua require("packer.load")({'css-colors'}, { cmd = "ColorizerAttachToBuffer", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file ColorizerToggle lua require("packer.load")({'css-colors'}, { cmd = "ColorizerToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file StartupTime lua require("packer.load")({'startuptime'}, { cmd = "StartupTime", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file ColorizerReloadAllBuffers lua require("packer.load")({'css-colors'}, { cmd = "ColorizerReloadAllBuffers", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
time([[Defining lazy-load commands]], false)

if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
