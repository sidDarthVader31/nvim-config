
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
