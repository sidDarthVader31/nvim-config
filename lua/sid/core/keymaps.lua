vim.g.mapleader = " "

local keymap = vim.keymap --

-- general keymaps 

keymap.set("i","jk","<ESC>")
keymap.set("n","<leader>nh", ":nohl<CR>")
keymap.set("n", "<leader>+","<C-a>")
keymap.set("n","<leader>-","<C-x>")


keymap.set("n", "<leader>sv", "<C-w>v")  --split window vertically 
keymap.set("n", "<leader>sh","<C-w>s")   --split window horizontally 
keymap.set("n", "<leader>se", "<C-w>=") --make split window equal width 
keymap.set("n", "<leader>sx", ":close<CR>") -- close current split window

keymap.set("n","<leader>to", ":tabnew<CR>")  --open new tab 
keymap.set("n", "<leader>tx", ":tabclose<CR>") --close current tab
keymap.set("n","<leader>tn", ":tabn<CR>") --go to next tab
keymap.set("n", "<leader>tp", ":tabp<CR>") --go to previous tab



--plugin keymap
keymap.set("n","<leader>sm", ":MaximizerToggle<CR>") --maximize window



-- Plugin-specific keybindings are now handled by lazy.nvim
-- See lua/sid/lazy-setup.lua for telescope, nvim-tree, etc.

-- Telescope git commands now handled by lazy.nvim

-- restart lsp server 
keymap.set("n", "<leader>rs", ":LspRestart<CR>") -- mapping to restart lsp if necessary

-- Terminal toggle (direct keybinding as backup)
keymap.set("n", "<leader>tt", "<cmd>ToggleTerm<cr>", { desc = "Toggle terminal" })
