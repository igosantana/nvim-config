local status, packer = pcall(require, 'packer')
if (not status) then
  print("Packer is not installed")
  return
end

vim.cmd [[packadd packer.nvim]]

packer.startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'themercorp/themer.lua' -- Themes
  use 'hoob3rt/lualine.nvim' -- Statusline
  use 'nvim-lua/plenary.nvim' -- Common utilities
  use 'onsails/lspkind-nvim' -- vscode-like pictograms
  use 'kyazdani42/nvim-web-devicons' -- File icons
  use 'neovim/nvim-lspconfig' -- LSP
  use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
  use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
  use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
  use 'SirVer/ultisnips' --snippets
  use 'quangnguyen30192/cmp-nvim-ultisnips' -- utilsnippets with cmp
  use 'ray-x/go.nvim' -- go language server
  use 'ray-x/guihua.lua'
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
  }
  use 'windwp/nvim-autopairs'
  use 'windwp/nvim-ts-autotag'
  use 'nvim-telescope/telescope.nvim'
  use 'nvim-telescope/telescope-file-browser.nvim'
  use 'norcalli/nvim-colorizer.lua'
  use 'glepnir/lspsaga.nvim'
  use 'lukas-reineke/lsp-format.nvim'
  use 'numToStr/Comment.nvim'
  use 'jose-elias-alvarez/null-ls.nvim'
  use 'MunifTanjim/prettier.nvim'
  use 'lewis6991/gitsigns.nvim' -- Gitsigns
  use 'dinhhuy258/git.nvim' -- Git
  use 'tpope/vim-fugitive'
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'
  use 'goolord/alpha-nvim' -- Dashboard
  use 'akinsho/toggleterm.nvim' --toggleterm
  use 'cuducos/yaml.nvim' --yaml
  use 'nvim-tree/nvim-tree.lua' -- nvim tree left side
end
)
