local status, toggleterm = pcall(require, "toggleterm")
if not status then
  return
end

toggleterm.setup({
  size = 20,
  -- open_mapping = [[<leader>tt]], -- Removed: conflicts with lazy.nvim keys
  direction = "float",
  close_on_exit = true,
  shell = vim.o.shell,
  float_opts = {
    border = "curved",
    winblend = 5, -- higher = more transparency
    highlights = {
      border = "Normal",
      background = "Normal",
    }
  }
})

-- Terminal keybindings are now handled by lazy.nvim
-- See lua/sid/lazy-setup.lua for <leader>tt keybinding

-- Lazygit integration
local Terminal  = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new({
  cmd = "lazygit",
  hidden = true,
  direction = "float",
  float_opts = {
    border = "curved",
    winblend = 5,
  }
})

function _lazygit_toggle()
  lazygit:toggle()
end

-- Lazygit keymap (using consistent keymap method)
vim.keymap.set("n", "<leader>tg", _lazygit_toggle, { desc = "Toggle Lazygit", noremap = true, silent = true })
