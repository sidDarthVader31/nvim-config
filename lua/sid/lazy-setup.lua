-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim
require("lazy").setup({
  -- Essential dependencies
  { "nvim-lua/plenary.nvim", lazy = true },
  
  -- Colorscheme - load early for better UX
  { 
    "catppuccin/nvim", 
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    config = function()
      require('sid.plugins.catppuccin')
    end
  },
  
  -- Navigation and window management - load on key press
  { 
    "christoomey/vim-tmux-navigator",
    keys = {
      { "<C-h>", "<cmd>TmuxNavigateLeft<cr>", desc = "Navigate Left" },
      { "<C-j>", "<cmd>TmuxNavigateDown<cr>", desc = "Navigate Down" },
      { "<C-k>", "<cmd>TmuxNavigateUp<cr>", desc = "Navigate Up" },
      { "<C-l>", "<cmd>TmuxNavigateRight<cr>", desc = "Navigate Right" },
    }
  },
  { 
    "szw/vim-maximizer",
    keys = { { "<leader>sm", "<cmd>MaximizerToggle<cr>", desc = "Maximize/minimize split" } }
  },
  
  -- Text editing plugins - load immediately
  { "tpope/vim-surround", event = "VeryLazy" },
  { "inkarkat/vim-ReplaceWithRegister", event = "VeryLazy" },
  
  -- Comments - load on key press
  {
    "numToStr/Comment.nvim",
    keys = {
      { "gc", mode = { "n", "v" }, desc = "Comment toggle linewise" },
      { "gb", mode = { "n", "v" }, desc = "Comment toggle blockwise" },
    },
    config = function()
      require('sid.plugins.comment')
    end
  },
  
  -- File explorer - load immediately to avoid command issues
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = "nvim-tree/nvim-web-devicons",
    event = "VeryLazy", -- Load early but not immediately
    keys = { { "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "Toggle file explorer" } },
    config = function()
      require('sid.plugins.nvim-tree')
    end
  },
  
  -- Icons - lazy loaded as dependency
  { "nvim-tree/nvim-web-devicons", lazy = true },
  
  -- Status line - load early for UX
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
      require('sid.plugins.lualine')
    end
  },
  
  -- Telescope - load early to make commands available
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" }
    },
    event = "VeryLazy", -- Load early so commands are available
    keys = {
      { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find files" },
      { "<leader>fs", "<cmd>Telescope live_grep<cr>", desc = "Find string" },
      { "<leader>fc", "<cmd>Telescope grep_string<cr>", desc = "Find string under cursor" },
      { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Find buffers" },
      { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Find help" },
      -- Git telescope commands from keymaps.lua
      { "<leader>gc", "<cmd>Telescope git_commits<cr>", desc = "Git commits" },
      { "<leader>gfc", "<cmd>Telescope git_bcommits<cr>", desc = "Git file commits" },
      { "<leader>gB", "<cmd>Telescope git_branches<cr>", desc = "Git branches" },
      { "<leader>gs", "<cmd>Telescope git_status<cr>", desc = "Git status" },
    },
    config = function()
      require('sid.plugins.telescope')
    end
  },
  
  -- Completion - load on InsertEnter
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-nvim-lsp",
      "saadparwaiz1/cmp_luasnip",
      "onsails/lspkind.nvim",
    },
    config = function()
      require('sid.plugins.nvim-cmp')
    end
  },
  
  -- Snippets
  {
    "L3MON4D3/LuaSnip",
    event = "InsertEnter",
    dependencies = "rafamadriz/friendly-snippets",
    build = "make install_jsregexp"
  },
  
  -- LSP
  {
    "williamboman/mason.nvim",
    cmd = { "Mason", "MasonInstall", "MasonUninstall", "MasonUpdate" },
    keys = { { "<leader>lm", "<cmd>Mason<cr>", desc = "Open Mason" } },
    build = ":MasonUpdate",
    config = function()
      require('sid.plugins.lsp.mason')
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = "williamboman/mason.nvim",
    event = { "BufReadPre", "BufNewFile" }
  },
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      require('sid.plugins.lsp.lspconfig')
    end
  },
  
  -- LSP enhancements
  {
    "nvimdev/lspsaga.nvim",
    event = "LspAttach",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons"
    },
    config = function()
      require('sid.plugins.lsp.lspsaga')
    end
  },
  {
    "jose-elias-alvarez/typescript.nvim",
    ft = { "typescript", "typescriptreact", "javascript", "javascriptreact" }
  },
  
  -- Formatting & linting
  {
    "jose-elias-alvarez/null-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = "williamboman/mason.nvim"
  },
  { "jayp0521/mason-null-ls.nvim", dependencies = "jose-elias-alvarez/null-ls.nvim" },
  
  -- Treesitter - load on BufReadPost for syntax highlighting
  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPost", "BufNewFile" },
    build = ":TSUpdate",
    dependencies = "windwp/nvim-ts-autotag",
    config = function()
      require('sid.plugins.treesitter')
    end
  },
  
  -- Auto pairs
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      require('sid.plugins.autopairs')
    end
  },
  { "windwp/nvim-ts-autotag", lazy = true },
  
  -- Git integration
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require('sid.plugins.gitsigns')
    end
  },
  
  -- Git blamer - load on command only (for performance)
  {
    "APZelos/blamer.nvim",
    cmd = { "BlamerToggle", "BlamerShow", "BlamerHide" },
    keys = { { "<leader>gb", "<cmd>BlamerToggle<cr>", desc = "Toggle Git Blame" } },
    config = function()
      require('sid.plugins.git-blamer')
    end
  },
  
  -- UI enhancements
  { 
    "rcarriga/nvim-notify",
    event = "VeryLazy",
    config = function()
      vim.notify = require("notify")
    end
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    config = function()
      require('sid.plugins.noice')
    end
  },
  
  -- Terminal
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    event = "VeryLazy", -- Load early to avoid keybinding issues
    keys = {
      { "<leader>tt", "<cmd>ToggleTerm<cr>", desc = "Toggle terminal", mode = { "n", "t" } },
      { "<C-\\>", "<cmd>ToggleTerm<cr>", desc = "Toggle terminal", mode = { "n", "t" } }
    },
    config = function()
      require('sid.plugins.toggleterm')
    end
  },
}, {
  -- Lazy.nvim configuration options
  install = {
    missing = true,
    colorscheme = { "catppuccin" }
  },
  checker = {
    enabled = false, -- Don't automatically check for updates
  },
  performance = {
    cache = {
      enabled = true,
    },
    reset_packpath = true,
    rtp = {
      disabled_plugins = {
        "gzip",
        "matchit",
        "matchparen",
        "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})
