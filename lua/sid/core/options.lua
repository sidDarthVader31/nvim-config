
local opt = vim.opt


--line numbers 
opt.relativenumber = true
opt.number = true

--tabs and indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

--line wrapping 
opt.wrap = true
opt.linebreak = true
opt.breakindent = true
opt.textwidth = 60

--search settings 
opt.ignorecase = true
opt.smartcase = true


-- cursor line 
opt.cursorline = false

--apperarance 
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"


--backspace 
opt.backspace = "indent,eol,start"


--clipboard 
opt.clipboard:append("unnamedplus")

--split windows 
opt.splitright = true
opt.splitbelow = true
opt.iskeyword:append("-")

-- performance settings
opt.updatetime = 100  -- faster completion and diagnostic updates
opt.timeout = true
opt.timeoutlen = 300  -- faster which-key popup
opt.ttimeoutlen = 10  -- faster escape sequences
opt.redrawtime = 1500
opt.synmaxcol = 300   -- limit syntax highlighting for long lines
opt.lazyredraw = false -- disable lazy redraw for better responsiveness
