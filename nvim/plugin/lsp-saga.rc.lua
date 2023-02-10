local status, saga = pcall(require, "lspsaga")
if (not status) then return end

saga.setup({
  ui = {
    winblend = 10,
    border = 'rounded',
    colors = {
      normal_bg = '#002b36'
    }
  }
})

local diagnostic = require("lspsaga.diagnostic")
local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<C-j>', '<Cmd>Lspsaga diagnostic_jump_next<CR>', opts)
vim.keymap.set('n', 'go', '<Cmd>Lspsaga show_diagnostic<CR>', opts)
vim.keymap.set('n', 'K', '<Cmd>Lspsaga hover_doc<CR>', opts)
vim.keymap.set('n', '<leader>rn', '<Cmd>Lspsaga rename<CR>', opts)
-- vim.keymap.set('n', 'gd', '<Cmd>Lspsaga lsp_finder<CR>', opts)
-- vim.keymap.set('i', '<C-k>', '<Cmd>Lspsaga signature_help<CR>', opts)

-- code action
local codeaction = require("lspsaga.codeaction")
vim.keymap.set("n", "<leader>x", function() codeaction:code_action() end, { silent = true })
vim.keymap.set("v", "<leader>x", function()
  vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<C-U>", true, false, true))
  codeaction:range_code_action()
end, { silent = true })



-- local map = vim.keymap
-- map.set("n", "<space>rn", "<cmd>Lspsaga rename<cr>", { silent = true, noremap = true })
-- map.set('n', 'K', '<Cmd>Lspsaga hover_doc<CR>', { noremap = true, silent = true })
-- map.set("n", "<leader>x", "<cmd>Lspsaga code_action<cr>", { silent = true, noremap = true })
-- map.set("x", "<leader>x", ":<c-u>Lspsaga range_code_action<cr>", { silent = true, noremap = true })
-- map.set("n", "go", "<cmd>Lspsaga show_line_diagnostics<cr>", { silent = true, noremap = true })
-- map.set("n", "<C-j>", "<cmd>Lspsaga diagnostic_jump_next<cr>", { silent = true, noremap = true })
