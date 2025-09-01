local status, toggleterm = pcall(require, "toggleterm")
if not status then
  return
end

toggleterm.setup({
  size = 20,
  open_mapping = [[<leader>tt]],
  direction = "float",
  close_on_exit = true,
  shell = vim.o.shell,
  float_opts = {
    border = "curved",
    winblend = 0, -- higher = more transparency
    highlights = {
      border = "Normal",
      background = "Normal",
    }
  }
})

-- Lazygit integration
local Terminal  = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new({
  cmd = "lazygit",
  hidden = true,
  direction = "float",
  float_opts = {
    border = "curved",
    winblend = 10,
  }
})

function _lazygit_toggle()
  lazygit:toggle()
end

-- Keymaps
vim.api.nvim_set_keymap("n", "<leader>g", "<cmd>lua _lazygit_toggle()<CR>", {noremap = true, silent = true})
