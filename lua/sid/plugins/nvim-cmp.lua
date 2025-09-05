-- import nvim-cmp plugin safely
local cmp_status, cmp = pcall(require, "cmp")
if not cmp_status then
  return
end
-- import luasnip plugin safely
local luasnip_status, luasnip = pcall(require, "luasnip")
if not luasnip_status then
  return
end

-- import lspkind plugin safely
local lspkind_status, lspkind = pcall(require, "lspkind")
if not lspkind_status then
  return
end

-- Lazy load snippets only when completion is triggered
vim.defer_fn(function()
  require("luasnip/loaders/from_vscode").lazy_load()
end, 1000)  -- Load after 1 second delay

vim.opt.completeopt = "menu,menuone,noselect"

cmp.setup({
  performance = {
    debounce = 60,        -- Much faster response
    throttle = 30,        -- Faster throttling  
    fetching_timeout = 150, -- Faster timeout
    confirm_resolve_timeout = 80,
    async_budget = 10,     -- Higher budget for async work
    max_view_entries = 20, -- Fewer entries = faster rendering
  },
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
    ["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
    ["<C-e>"] = cmp.mapping.abort(), -- close completion window
    ["<CR>"] = cmp.mapping.confirm({ select = false }),
  }),
  -- sources for autocompletion (ordered by priority)
  sources = cmp.config.sources({
    { 
      name = "nvim_lsp", 
      priority = 1000,
      max_item_count = 20,  -- Limit LSP suggestions
      keyword_length = 2,   -- Don't trigger on single chars
    },
    { 
      name = "luasnip", 
      priority = 750,
      max_item_count = 5,   -- Fewer snippet suggestions
    },
    { 
      name = "buffer", 
      priority = 500,
      max_item_count = 10,  -- Limit buffer completions
      keyword_length = 3,   -- Only on 3+ chars for buffer
    },
    { 
      name = "path", 
      priority = 250,
      max_item_count = 5,   -- Limit path completions
    },
  }),
  -- configure lspkind for vs-code like icons
  formatting = {
    format = lspkind.cmp_format({
      maxwidth = 50,
      ellipsis_char = "...",
    }),
  },
})
