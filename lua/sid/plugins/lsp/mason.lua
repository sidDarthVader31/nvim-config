-- import mason plugin safely
local mason_status, mason = pcall(require, "mason")
if not mason_status then
  return
end

-- import mason-lspconfig plugin safely
local mason_lspconfig_status, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_status then
  return
end

-- import mason-null-ls plugin safely
local mason_null_ls_status, mason_null_ls = pcall(require, "mason-null-ls")
if not mason_null_ls_status then
  return
end

-- enable mason
mason.setup()

mason_lspconfig.setup({
  -- list of servers for mason to install
  ensure_installed = {
    "html",           -- HTML language server
    "lua_ls",         -- Lua language server  
    "emmet_ls",       -- Emmet language server
    "dockerls",       -- Docker language server
    "ts_ls",          -- TypeScript language server (ESSENTIAL!)
    "eslint",         -- ESLint language server
    "jsonls",         -- JSON language server
    "gopls",          -- Go language server
    "marksman",       -- Markdown language server
    "pyright",        -- Python language server
    -- "graphql",     -- REMOVED: Not needed
    -- "cssls",       -- REMOVED: Not needed
  },
  -- auto-install configured servers (with lspconfig)
  automatic_installation = true, -- not the same as ensure_installed
})

mason_null_ls.setup({
  -- list of formatters & linters for mason to install
  ensure_installed = {
    "prettier", -- ts/js formatter
    "stylua", -- lua formatter
    "eslint_d", -- ts/js linter
  },
  -- auto-install configured formatters & linters (with null-ls)
  automatic_installation = true,
})
