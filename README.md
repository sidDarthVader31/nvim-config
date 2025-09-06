# 🚀 Neovim Configuration for Productivity

A modern, performance-focused Neovim configuration designed for **backend developers** and **power users** who prioritize productivity, speed, and seamless workflow integration. This setup is optimized for JavaScript/TypeScript development and heavy terminal usage alongside tmux.

![Neovim Version](https://img.shields.io/badge/Neovim-0.8+-brightgreen.svg)
![Lua](https://img.shields.io/badge/Language-Lua-blue.svg)
![License](https://img.shields.io/badge/License-MIT-yellow.svg)

## ✨ Features

- **🔥 Fast Startup**: Lazy loading with `lazy.nvim` for optimal performance
- **🎨 Beautiful UI**: Catppuccin colorscheme with enhanced status line
- **🧠 Smart LSP**: Full Language Server Protocol support for 20+ languages
- **🔍 Powerful Search**: Telescope integration with fuzzy finding and live grep
- **🌳 File Management**: Enhanced file explorer with custom icons and shortcuts
- **⚡ Terminal Integration**: Built-in terminal toggle and tmux navigation
- **📝 Code Completion**: Intelligent autocompletion with snippets
- **🔧 Git Integration**: Built-in git signs, blame, and telescope git commands
- **🎯 Productivity Tools**: Auto-pairs, surround, comments, and more

## 📸 Screenshots

### 🔍 Fuzzy Finding & Search
![Fuzzy Find](assets/fuzzyfind.png)
*Telescope fuzzy finder with live preview and file search capabilities*

### 🌳 File Explorer
![File Explorer](assets/toggletree.png)
*Nvim-tree file explorer with custom icons and folder navigation*

### 📟 Integrated Terminal  
![Terminal](assets/terminal.png)
*ToggleTerm integration for seamless terminal workflow*

### 🔧 Git Integration
![Git Features](assets/git.png)
*Git integration with gitsigns, blame, and telescope git commands*

## 🚀 Quick Start

### Prerequisites
- Neovim >= 0.8.0
- Git
- A [Nerd Font](https://www.nerdfonts.com/) (recommended: FiraCode Nerd Font)
- Node.js (for LSP servers)
- ripgrep (for telescope live grep)

### Installation

1. **Backup your existing config** (if any):
   ```bash
   mv ~/.config/nvim ~/.config/nvim.backup
   ```

2. **Clone this repository**:
   ```bash
   git clone https://github.com/sidDarthVader31/nvim-config.git ~/.config/nvim
   ```

3. **Start Neovim**:
   ```bash
   nvim
   ```

4. **Install plugins**: Lazy.nvim will automatically install all plugins on first startup.

5. **Install LSP servers**: Open Mason with `:Mason` and install language servers for your languages.

## 📁 Project Structure

```
nvim-config/
├── init.lua                 # Entry point - bootstraps the config
├── lua/sid/                 # Core configuration modules
│   ├── core/               # Core Neovim settings
│   │   ├── colorscheme.lua # Catppuccin theme configuration
│   │   ├── keymaps.lua     # Global key mappings
│   │   └── options.lua     # Neovim options & settings
│   ├── plugins/            # Plugin configurations
│   │   ├── lsp/           # LSP related configurations
│   │   ├── catppuccin.lua # Theme customization
│   │   ├── nvim-cmp.lua   # Autocompletion setup
│   │   ├── telescope.lua  # Fuzzy finder config
│   │   ├── nvim-tree.lua  # File explorer setup
│   │   ├── toggleterm.lua # Terminal integration
│   │   ├── gitsigns.lua   # Git integration
│   │   └── ...            # Other plugin configs
│   └── lazy-setup.lua      # Plugin manager setup & lazy loading
├── assets/                 # Screenshots and documentation
├── tmux/                  # Tmux configurations (separate)
└── lazy-lock.json         # Plugin version lock file
```

## ⚡ Key Mappings

### General Navigation
| Key | Mode | Action |
|-----|------|--------|
| `<Space>` | Normal | Leader key |
| `jk` | Insert | Exit insert mode |
| `<leader>nh` | Normal | Clear search highlights |
| `<C-h/j/k/l>` | Normal | Navigate between tmux/vim panes |

### File Management  
| Key | Mode | Action |
|-----|------|--------|
| `<leader>e` | Normal | Toggle file explorer (NvimTree) |
| `<leader>ff` | Normal | Find files (Telescope) |
| `<leader>fs` | Normal | Live grep search |
| `<leader>fc` | Normal | Find word under cursor |
| `<leader>fb` | Normal | Find buffers |
| `<leader>fh` | Normal | Find help tags |

### Window Management
| Key | Mode | Action |
|-----|------|--------|
| `<leader>sv` | Normal | Split window vertically |
| `<leader>sh` | Normal | Split window horizontally |
| `<leader>se` | Normal | Make splits equal width |
| `<leader>sx` | Normal | Close current split |
| `<leader>sm` | Normal | Maximize/minimize current window |

### Terminal & Git
| Key | Mode | Action |
|-----|------|--------|
| `<leader>tt` | Normal | Toggle terminal |
| `<C-\>` | Normal/Terminal | Toggle terminal (alternative) |
| `<leader>gb` | Normal | Toggle git blame |
| `<leader>gc` | Normal | Git commits (Telescope) |
| `<leader>gs` | Normal | Git status (Telescope) |

### LSP Features
| Key | Mode | Action |
|-----|------|--------|
| `<leader>rs` | Normal | Restart LSP server |
| `gd` | Normal | Go to definition |
| `gD` | Normal | Go to declaration |
| `gi` | Normal | Go to implementation |
| `gr` | Normal | Go to references |
| `K` | Normal | Show hover documentation |
| `<leader>lm` | Normal | Open Mason (LSP installer) |

## 🔌 Plugin Ecosystem

### Core Plugins
- **[lazy.nvim](https://github.com/folke/lazy.nvim)** - Modern plugin manager with lazy loading
- **[catppuccin](https://github.com/catppuccin/nvim)** - Soothing pastel theme  
- **[telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)** - Fuzzy finder and picker
- **[nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua)** - File explorer sidebar

### Development Tools
- **[nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)** - LSP client configurations
- **[mason.nvim](https://github.com/williamboman/mason.nvim)** - LSP/DAP/Linter installer
- **[nvim-cmp](https://github.com/hrsh7th/nvim-cmp)** - Autocompletion engine
- **[nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)** - Syntax highlighting and parsing
- **[null-ls.nvim](https://github.com/jose-elias-alvarez/null-ls.nvim)** - Formatting and linting

### Productivity Enhancers
- **[toggleterm.nvim](https://github.com/akinsho/toggleterm.nvim)** - Terminal integration
- **[gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)** - Git decorations
- **[vim-tmux-navigator](https://github.com/christoomey/vim-tmux-navigator)** - Seamless tmux/vim navigation
- **[nvim-autopairs](https://github.com/windwp/nvim-autopairs)** - Auto close brackets
- **[Comment.nvim](https://github.com/numToStr/Comment.nvim)** - Smart commenting

### UI & Aesthetics
- **[lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)** - Statusline
- **[noice.nvim](https://github.com/folke/noice.nvim)** - Enhanced UI notifications
- **[nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons)** - File type icons

## 🎨 Customization

### Colorscheme
The configuration uses **Catppuccin** theme with custom highlights. To change themes:

1. Edit `lua/sid/core/colorscheme.lua`
2. Replace `"catppuccin"` with your preferred theme
3. Update the lazy.nvim setup in `lazy-setup.lua`

### Adding Plugins
1. Add plugin spec to `lua/sid/lazy-setup.lua`
2. Create configuration file in `lua/sid/plugins/`
3. Restart Neovim to install

### Key Mappings
- Global mappings: `lua/sid/core/keymaps.lua` 
- Plugin-specific mappings: Individual plugin config files or lazy.nvim specs

## ⚙️ Performance Features

- **Lazy Loading**: Plugins load only when needed
- **Optimized Startup**: Disabled unnecessary built-in plugins
- **Efficient Caching**: Lua module caching enabled
- **Smart Event Triggers**: Plugins load on specific events (InsertEnter, BufReadPre, etc.)

## 🔧 Language Support

Pre-configured for:
- **JavaScript/TypeScript** (Primary focus)
- **Lua** (Neovim configuration)
- **JSON, HTML, CSS**
- **Markdown**
- **Shell scripting**

Additional language servers can be installed via `:Mason`.

## 🤝 Tmux Integration

This configuration is designed to work seamlessly with tmux. The included `vim-tmux-navigator` allows you to:
- Navigate between vim splits and tmux panes with `Ctrl+h/j/k/l`
- Maintain muscle memory across terminal and editor


## 🐛 Troubleshooting

### Plugins Not Loading
```bash
# Clear plugin cache and reinstall
rm -rf ~/.local/share/nvim/lazy
nvim
```

### LSP Not Working
1. Open `:Mason` and install required language servers
2. Check `:LspInfo` for active servers
3. Restart LSP: `<leader>rs`

### Terminal Issues
- Ensure your terminal supports true colors
- Install a Nerd Font for proper icon display

## 📝 Todo
- [x] Add tmux configuration files
- [ ] Create setup script for dependencies
- [x] Add more language-specific configurations

## 🤝 Contributing

Feel free to open issues or pull requests if you have suggestions for improvements!

## 📄 License

This configuration is available under the MIT License. See the repository for details.

---

**Happy coding!** 🎉

> Built with ❤️ for productive development workflows
