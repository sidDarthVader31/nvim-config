
local setup, gitblamer = pcall(require, "git-blamer")
if not setup then
  return
end


vim.g.blamer_enabled = false
vim.g.blamer_delay = 1000
local keymap = vim.keymap -- for conciseness

keymap.set("n", "gb", "<cmd>BlamerToggle<cr>")

gitblamer.setup()
