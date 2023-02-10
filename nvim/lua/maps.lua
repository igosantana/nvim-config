local keymap = vim.keymap
local default_opts = { noremap = true, silent = true }

-- leader
vim.g.mapleader = ' '

-- Save
keymap.set('n', '<C-s>', ':w<cr>')

-- Open Fugitive
keymap.set('n', ';f', ':G<cr> <C-w>o')

-- Do not yank with x
keymap.set('n', 'x', '"_x')

-- Delete a word backwards
keymap.set('n', 'dw', 'vb"_d')

-- Select all
keymap.set('n', '<leader>a', 'gg<S-v>G')

-- Split window
keymap.set('n', 'ss', ':sp<cr>', default_opts)
keymap.set('n', 'sv', ':vs<cr>', default_opts)

-- Open and close tabs
keymap.set('n', '<leader>t', ':tabnew<cr>')
keymap.set('n', '<leader>4', ':tabclose<cr>')

-- Move window
-- keymap.set('n', '<Space>', '<C-w>w')
-- keymap.set('n', 's<left>', '<C-w>h')
-- keymap.set('n', 's<up>', '<C-w>k')
-- keymap.set('n', 's<down>', '<C-w>j')
-- keymap.set('n', 's<right>', '<C-w>l')
keymap.set('n', 'sh', '<C-w>h')
keymap.set('n', 'sk', '<C-w>k')
keymap.set('n', 'sj', '<C-w>j')
keymap.set('n', 'sl', '<C-w>l')

-- Resize window
keymap.set('n', '<C-w><left>', '<C-w><')
keymap.set('n', '<C-w><right>', '<C-w>>')
keymap.set('n', '<C-w><up>', '<C-w>+')
keymap.set('n', '<C-w><down>', '<C-w>-')

-- yanking until final frase
keymap.set('n', 'Y', 'yg$')

-- Same line with the cursor fix
keymap.set('n', 'J', 'mzJ`z')

-- Cursor in the middle at search
keymap.set('n', 'n', 'nzzzv')
keymap.set('n', 'N', 'Nzzzv')

-- Yanking
keymap.set({ "n", "v" }, "<leader>y", [["+y]])
keymap.set("n", "<leader>Y", [["+Y]])

-- Select word and replace
keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Better ident
keymap.set('v', '>', '>gv', default_opts)
keymap.set('v', '<', '<gv', default_opts)

-- Paste over currently selected text without yanking it
keymap.set('v', 'p', '"_dp', default_opts)

-- Cancel search highlights
keymap.set('n', '<leader>q', ':nohlsearch<Bar>:echo<CR>', default_opts)

-- Move selected line / block of text in visual mode
keymap.set("x", "<S-k>", ":move '<-2<CR>gv-gv", default_opts)
keymap.set("x", "<S-j>", ":move '>+1<CR>gv-gv", default_opts)
