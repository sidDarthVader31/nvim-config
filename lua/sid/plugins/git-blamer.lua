
local setup, gitblamer = pcall(require, "git-blamer")
if not setup then
  return
end


vim.g.blamer_enabled = true
vim.g.blamer_delay = 100
local keymap = vim.keymap -- for conciseness

keymap.set("n", "gb", "<cmd>BlamerToggle<cr>")

gitblamer.setup()
