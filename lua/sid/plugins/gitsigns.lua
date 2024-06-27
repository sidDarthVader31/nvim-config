-- import gitsigns plugin safely
local setup, gitsigns = pcall(require, "gitsigns")
if not setup then
  return
end

local keymaps = vim.keymap
keymaps.set("n", "<leader> g", "Gitsigns preview_hunk")
-- configure/enable gitsigns
gitsigns.setup()
