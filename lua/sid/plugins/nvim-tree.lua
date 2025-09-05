local setup, nvimtree = pcall(require, "nvim-tree")
if not setup then
  return
end


-- recommended settings from nvim-tree documentation
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- change color for arrows in tree to light blue
vim.cmd([[ highlight NvimTreeIndentMarker guifg=#3FC5FF ]])

-- configure nvim-tree
nvimtree.setup({
  -- change folder arrow icons and add folder glyphs
  renderer = {
    icons = {
      glyphs = {
        folder = {
          arrow_closed = "",      -- arrow when folder is closed
          arrow_open =  "",       -- arrow when folder is open
          default = "",        -- closed folder icon
          open = "",            -- open folder icon
          empty = "",           -- empty folder
          empty_open = "",      -- empty open folder
          symlink = "",         -- symlink folder
        },
      },
    },
  },
  -- disable window_picker for
  -- explorer to work well with
  -- window splits
  actions = {
    open_file = {
      window_picker = {
        enable = false,
      },
    },
  },
})

-- open nvim-tree on setup
local function open_nvim_tree(data)
  -- buffer is a [No Name]
  local no_name = data.file == "" and vim.bo[data.buf].buftype == ""

  -- buffer is a directory
  local directory = vim.fn.isdirectory(data.file) == 1

  if not no_name and not directory then
    return
  end

  -- change to the directory
  if directory then
    vim.cmd.cd(data.file)
  end

  -- open the tree
  require("nvim-tree.api").tree.open()
end

-- Only auto-open if nvim-tree is loaded
vim.api.nvim_create_autocmd({ "VimEnter" }, { 
  callback = function(data)
    -- Only auto-open for directories or if no file specified
    local no_name = data.file == "" and vim.bo[data.buf].buftype == ""
    local directory = vim.fn.isdirectory(data.file) == 1
    
    if no_name or directory then
      vim.schedule(function()
        require('lazy').load({plugins = {'nvim-tree.lua'}})
        vim.cmd('NvimTreeOpen')
      end)
    end
  end 
})
