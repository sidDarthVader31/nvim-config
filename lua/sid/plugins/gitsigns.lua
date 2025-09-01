-- import gitsigns plugin safely
local status, gitsigns = pcall(require, "gitsigns")
if not status then
  return
end

local keymaps = vim.keymap
keymaps.set("n", "<leader> g", "Gitsigns preview_hunk")
-- configure/enable gitsigns
gitsigns.setup()
