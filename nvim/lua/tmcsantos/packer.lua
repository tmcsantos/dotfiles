-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Fuzzy Finder (files, lsp, etc)
  use { 'nvim-telescope/telescope.nvim', branch = '0.1.x', requires = { 'nvim-lua/plenary.nvim' } }
  use {
    'nvim-telescope/telescope-fzf-native.nvim',
    run =
    'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
  }
  use { 'nvim-telescope/telescope-ui-select.nvim' }
  -- use { 'jose-elias-alvarez/null-ls.nvim', requires = { 'nvim-lua/plenary.nvim' } }

  -- colors
  use 'sainnhe/gruvbox-material'
  -- use 'folke/tokyonight.nvim'
  -- use {
  --     'rose-pine/neovim',
  --     as = 'rose-pine',
  -- }
  -- use { "catppuccin/nvim", as = "catppuccin" }

  use {
    "folke/trouble.nvim",
    requires = "nvim-tree/nvim-web-devicons",
    config = function()
      require("trouble").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  }

  -- Highlight, edit, and navigate code
  use {
    "nvim-treesitter/nvim-treesitter",
    run = function()
      pcall(require("nvim-treesitter.install").update { with_sync = true })
    end
  }
  use 'nvim-treesitter/nvim-treesitter-context'
  use {
    "nvim-treesitter/nvim-treesitter-textobjects",
    after = "nvim-treesitter",
    requires = "nvim-treesitter/nvim-treesitter",
  }

  use 'mbbill/undotree'
  use 'tpope/vim-fugitive'
  use 'lewis6991/gitsigns.nvim'

  -- LSP Configuration & Plugins
  use {
    'VonHeikemen/lsp-zero.nvim',
    requires = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' },             -- Required
      { 'williamboman/mason.nvim' },           -- Required
      { 'williamboman/mason-lspconfig.nvim' }, -- Required
      -- { 'jay-babu/mason-null-ls.nvim' },       -- Optional

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },         -- Required
      -- { 'hrsh7th/cmp-buffer' },       -- Optional
      { 'hrsh7th/cmp-path' },         -- Optional
      { 'saadparwaiz1/cmp_luasnip' }, -- Optional
      { 'hrsh7th/cmp-nvim-lsp' },     -- Optional
      -- { 'hrsh7th/cmp-nvim-lua' },     -- Optional
      { 'folke/neodev.nvim' },        -- Optional, nvim lua api completion

      -- Snippets
      { 'L3MON4D3/LuaSnip' },             -- Required
      { 'rafamadriz/friendly-snippets' }, -- Optional

      -- Useful status updates for LSP
      -- { 'j-hui/fidget.nvim',                tag = 'legacy' }, -- Optional

      -- Debugger
      { 'mfussenegger/nvim-dap' },
      { 'jay-babu/mason-nvim-dap.nvim' }, -- Optional
    }
  }

  -- use 'nvim-lualine/lualine.nvim' -- Fancier statusline
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons' }
  }
  use 'numToStr/Comment.nvim' -- "gc" to comment visual regions/lines

  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional, for file icons
    },
    tag = 'nightly'                  -- optional, updated every week. (see issue #1193)
  }

  use "laytan/cloak.nvim"
  use "folke/zen-mode.nvim"
  use 'eandrju/cellular-automaton.nvim'
  use 'neo4j-contrib/cypher-vim-syntax'

  use 'github/copilot.vim'
  use {
    'rcarriga/nvim-dap-ui',
    requires = { 'mfussenegger/nvim-dap' }
  }

  -- python notebooks
  use 'goerz/jupytext.vim'

  use {
    'folke/noice.nvim',
    requires = {
      'MunifTanjim/nui.nvim', -- required, proper rendering
      'rcarriga/nvim-notify', -- optional, notification view
    }
  }

  -- use({
  --   "huynle/ogpt.nvim",
  --   requires = {
  --     "MunifTanjim/nui.nvim",
  --     "nvim-lua/plenary.nvim",
  --     "nvim-telescope/telescope.nvim"
  --   }
  -- })
end)
