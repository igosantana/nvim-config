local status, nvim_lsp = pcall(require, "lspconfig")
if (not status) then return end

local protocol = require('vim.lsp.protocol')

-- local pid = vim.fn.getpid()
-- local omnisharp_bin = "/var/home/igosantana/.local/omnisharp"

-- local augroup_format = vim.api.nvim_create_augroup("Format", { clear = true })
-- local enable_format_on_save = function(_, bufnr)
--   vim.api.nvim_clear_autocmds({ group = augroup_format, buffer = bufnr })
--   vim.api.nvim_create_autocmd("BufWritePre", {
--     group = augroup_format,
--     buffer = bufnr,
--     callback = function()
--       vim.lsp.buf.format({ bufnr = bufnr })
--     end,
--   })
-- end
-- -- Mappings
-- local opts = { noremap = true, silent = true }vim.keymap.set('n', 'K', '<Cmd>Lspsaga hover_doc<CR>', opts)
-- vim.keymap.set('n', '<leader>k', vim.diagnostic.goto_prev, opts)
-- vim.keymap.set('n', '<leader>j', vim.diagnostic.goto_next, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
-- local on_attach = function(_, bufnr)
--   local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
local on_attach = function(client)
  require("lsp-format").on_attach(client)
end

--Enable completion triggered by <c-x><c-o>
--local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
-- vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
-- Mappings.
-- See `:help vim.lsp.*` for documentation on any of the below functions
local bufopts = { noremap = true, silent = true }
vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
-- vim.keymap.set('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', bufopts)
-- vim.keymap.set('n', 'gr', '<Cmd>vim.lsp.buf.references()<CR>', bufopts)
vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
--vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
-- vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
-- vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
-- vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
-- vim.keymap.set('n', '<space>wl', function()
--   print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
-- end, bufopts)
-- vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
-- vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)


protocol.CompletionItemKind = {
  '???', -- Text
  '???', -- Method
  '???', -- Function
  '???', -- Constructor
  '???', -- Field
  '???', -- Variable
  '???', -- Class
  '???', -- Interface
  '???', -- Module
  '???', -- Property
  '???', -- Unit
  '???', -- Value
  '???', -- Enum
  '???', -- Keyword
  '???', -- Snippet
  '???', -- Color
  '???', -- File
  '???', -- Reference
  '???', -- Folder
  '???', -- EnumMember
  '???', -- Constant
  '???', -- Struct
  '???', -- Event
  '???', -- Operator
  '???', -- TypeParameter
}

-- Set up completion using nvim_cmp with LSP source
-- Add additional capabilities supported by nvim-cmp
local capabilities = require('cmp_nvim_lsp').default_capabilities()

nvim_lsp.flow.setup {
  on_attach = on_attach,
  capabilities = capabilities
}

nvim_lsp.tsserver.setup {
  on_attach = on_attach,
  -- on_attach = function(client, bufnr)
  --   on_attach(client, bufnr)
  --   enable_format_on_save(client, bufnr)
  -- end,
  filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
  cmd = { "typescript-language-server", "--stdio" },
  capabilities = capabilities
}

nvim_lsp.sourcekit.setup {
  on_attach = on_attach,
  capabilities = capabilities
}

nvim_lsp.lua_ls.setup {
  capabilities = capabilities,
  on_attach = on_attach,
  settings = {
    Lua = {
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { 'vim' },
      },

      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false
      },
    },
  },
}

nvim_lsp.tailwindcss.setup {
  capabilities = capabilities,
  on_attach = on_attach
}

nvim_lsp.cssls.setup {
  capabilities = capabilities,
  on_attach = on_attach,
  cmd = { "vscode-css-language-server", "--stdio" },
  filetypes = { "css", "scss", "sass", "css.css", "css.scss", "css.sass" }
}

nvim_lsp.html.setup {
  capabilities = capabilities,
  on_attach = on_attach
}

nvim_lsp.astro.setup {
  on_attach = on_attach,
  capabilities = capabilities
}

nvim_lsp.gopls.setup {
  capabilities = capabilities,
  on_attach = on_attach
}


-- nvim_lsp.dart.setup {
--   capabilities = capabilities,
--   on_attach = on_attach
-- }

nvim_lsp.csharp_ls.setup {
  capabilities = capabilities,
  on_attach = on_attach
}

-- nvim_lsp.omnisharp.setup {
--   capabilities = capabilities,
--   on_attach = on_attach,
--   cmd = { omnisharp_bin, "--languageserver", "--hostPID", tostring(pid) },
-- }

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
  underline = true,
  update_in_insert = false,
  virtual_text = { spacing = 4, prefix = "???" },
  severity_sort = true,
}
)

-- Diagnostic symbols in the sign column (gutter)
local signs = { Error = "??? ", Warn = "??? ", Hint = "??? ", Info = "??? " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

vim.diagnostic.config({
  virtual_text = {
    prefix = '???'
  },
  update_in_insert = true,
  float = {
    source = "always", -- Or "if_many"
  },
})
