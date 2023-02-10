local status, cmp = pcall(require, 'cmp')
if (not status) then return end


local lspkind = require 'lspkind'
local cmp_ultisnips_mappings = require("cmp_nvim_ultisnips.mappings")

-- nvim-cmp setup
cmp.setup {
  snippet = {
    expand = function(args)
      vim.fn["UltiSnips#Anon"](args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-d>'] = cmp.mapping.scroll_docs(-4), -- Up
    ['<C-f>'] = cmp.mapping.scroll_docs(4), -- Down
    ['<C-e>'] = cmp.mapping.close(),
    -- C-b (back) C-f (forward) for snippet placeholder navigation.
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ["<Tab>"] = cmp.mapping(
      function(fallback)
        -- This little snippet will confirm with tab, and if no entry is selected, will confirm the first item
        cmp_ultisnips_mappings.expand_or_jump_forwards(fallback)
      end,
      { "i", "s", --[[ "c" (to enable the mapping in command mode) ]] }
    ),
    ["<S-tab>"] = cmp.mapping(
      function(fallback)
        cmp_ultisnips_mappings.jump_backwards(fallback)
      end,
      { "i", "s", --[[ "c" (to enable the mapping in command mode) ]] }
    )
  }),
  sources = {
    { name = 'utilsnips', priority = 40 },
    { name = 'nvim_lsp', priority = 30 },
  },
  formatting = {
    format = lspkind.cmp_format({ wirth_text = false, maxWidth = 50 })
  }
}

vim.cmd [[
  set completeopt=menuone,noinsert,noselect
  highlight! default link CmpItemKind CmpItemMenuDefault
]]
