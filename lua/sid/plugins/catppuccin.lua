
local status, catppuccin = pcall(require, "catppuccin")
if not status then
  return end

catppuccin.setup({
  flavour = "frappe", -- latte, frappe, macchiato, mocha
  transparent_background = false,
  integrations = {
    treesitter = true,
    native_lsp = {
      enabled = true,
      underlines = {
        errors = { "undercurl" },
        hints = { "undercurl" },
        warnings = { "undercurl" },
        information = { "undercurl" },
      },
    },
    cmp = true,
    gitsigns = true,
    telescope = true,
    nvimtree = true,
  },
})

-- set *after* setup
vim.cmd.colorscheme "catppuccin"
