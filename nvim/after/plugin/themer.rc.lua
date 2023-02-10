local status, themer = pcall(require, 'themer')
if (not status) then return end

themer.setup({
  colorscheme = "kanagawa",
  transparent = true,
  styles = {
    comment = { style = 'italic' },
  },
  plugins = {
    treesitter = true,
    indentline = true,
    bufferline = true,
    cmp = true,
    gitsigns = true,
    lsp = true,
    telescope = true,
    barbar = true,
  },
})
