-- import lspconfig plugin safely
local lspconfig_status, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status then
  return
end

-- import cmp-nvim-lsp plugin safely
local cmp_nvim_lsp_status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_nvim_lsp_status then
  return
end

-- import typescript plugin safely
local typescript_setup, typescript = pcall(require, "typescript")
if not typescript_setup then
  return
end

local keymap = vim.keymap -- for conciseness




-- enable keybinds only for when lsp server available
local on_attach = function(client, bufnr)
  -- keybind options
  local opts = { noremap = true, silent = true, buffer = bufnr }

  -- set keybinds for better cross-file navigation
  keymap.set("n", "gf", "<cmd>Lspsaga lsp_finder<CR>", opts) -- show definition, references
  keymap.set("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts) -- go to declaration
  keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts) -- go to definition (native LSP - better for cross-file)
  keymap.set("n", "gr", "<cmd>Telescope lsp_references<CR>", opts) -- show references
  keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts) -- go to implementation
  keymap.set("n", "<leader>gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- telescope definitions as alternative
  keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts) -- see available code actions
  keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts) -- smart rename
  keymap.set("n", "<leader>D", "<cmd>Lspsaga show_line_diagnostics<CR>", opts) -- show  diagnostics for line
  keymap.set("n", "<leader>d", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts) -- show diagnostics for cursor
  keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts) -- jump to previous diagnostic in buffer
  keymap.set("n", "]", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts) -- jump to next diagnostic in buffer
  keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts) -- show documentation for what is under cursor

  -- typescript specific keymaps (e.g. rename file and update imports)
  if client.name == "ts-ls" then
    keymap.set("n", "<leader>rf", ":TypescriptRenameFile<CR>") -- rename file and update imports
    keymap.set("n", "<leader>oi", ":TypescriptOrganizeImports<CR>") -- organize imports
    keymap.set("n", "<leader>ru", ":TypescriptRemoveUnused<CR>") -- remove unused variables
  end
end

-- used to enable autocompletion (assign to every lsp server config)
local capabilities = cmp_nvim_lsp.default_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = {
    'documentation',
    'detail',
    'additionalTextEdits'
  }
}
-- Change the Diagnostic symbols in the sign column (gutter)
local signs = { Error = " ", Warn = " ", Hint = "ﴞ ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

-- configure html server
lspconfig["html"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
  flags = {
    debounce_text_changes = 300,
  },
})

-- configure typescript server with plugin
typescript.setup({
  server = {
    capabilities = capabilities,
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 300,
    },
  },
})

-- configure emmet language server
lspconfig["emmet_ls"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
  flags = {
    debounce_text_changes = 300,
  },
  filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
})
--golang setup with comprehensive workspace support
lspconfig.gopls.setup({
  capabilities = capabilities,
  on_attach = on_attach,
  cmd = {"gopls"},
  flags = {
    debounce_text_changes = 300,
  },
  settings = {
    gopls = {
      -- Enable cross-file analysis
      completeUnimported = true,
      usePlaceholders = true,
      deepCompletion = true,
      staticcheck = true,
      -- Workspace settings for multi-module support
      buildFlags = {"-tags", "integration"},
      env = {
        GOFLAGS = "-tags=integration",
      },
      -- Analysis settings
      analyses = {
        unusedparams = true,
        shadow = true,
        fieldalignment = true,
        nilness = true,
        unusedwrite = true,
        useany = true,
      },
      -- Codelens settings
      codelenses = {
        gc_details = false,
        generate = true,
        regenerate_cgo = true,
        run_govulncheck = true,
        test = true,
        tidy = true,
        upgrade_dependency = true,
        vendor = true,
      },
      -- Hints
      hints = {
        assignVariableTypes = true,
        compositeLiteralFields = true,
        compositeLiteralTypes = true,
        constantValues = true,
        functionTypeParameters = true,
        parameterNames = true,
        rangeVariableTypes = true,
      },
    },
  },
  filetypes = {"go", "gomod", "gowork", "gotmpl"},
  root_dir = lspconfig.util.root_pattern("go.work", "go.mod", ".git"),
})



-- configure JSON language server
lspconfig["jsonls"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
  flags = {
    debounce_text_changes = 300,
  },
})

-- configure ESLint language server
lspconfig["eslint"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
  flags = {
    debounce_text_changes = 300,
  },
})

-- configure Docker language server
lspconfig["dockerls"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
  flags = {
    debounce_text_changes = 300,
  },
})

-- configure Python language server
lspconfig["pyright"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
  flags = {
    debounce_text_changes = 300,
  },
})

-- configure Markdown language server
lspconfig["marksman"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
  flags = {
    debounce_text_changes = 300,
  },
})

-- configure lua server (with special settings)
lspconfig["lua_ls"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
  flags = {
    debounce_text_changes = 300,
  },
  settings = { -- custom settings for lua
    Lua = {
      -- make the language server recognize "vim" global
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        -- make language server aware of runtime files
        library = {
          [vim.fn.expand("$VIMRUNTIME/lua")] = true,
          [vim.fn.stdpath("config") .. "/lua"] = true,
        },
      },
    },
  },
})

-- Removed deprecated diagnostic handler that was breaking LSP
-- Modern Neovim handles diagnostic display properly by default

