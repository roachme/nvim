-- This file can be loaded by calling `lua require('plugins')` from your init.vim

local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        local repo = 'https://github.com/wbthomason/packer.nvim'
        fn.system({'git', 'clone', '--depth', '1', repo, install_path})
        vim.cmd.packadd('packer.nvim')
        return true
    end
    return false
end

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.5',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }

  use({
	  'rose-pine/neovim',
	  as = 'rose-pine',
	  config = function()
		  vim.cmd('colorscheme rose-pine')
	  end
  })

  use({
      "folke/trouble.nvim",
      config = function()
          require("trouble").setup {
              icons = false,
              -- your configuration comes here
              -- or leave it empty to use the default settings
              -- refer to the configuration section below
          }
      end
  })

  use {
			'nvim-treesitter/nvim-treesitter',
			run = function()
				local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
				ts_update()
			end,}
  use("nvim-treesitter/playground")
  use("theprimeagen/harpoon")
  use("theprimeagen/refactoring.nvim")
  use("mbbill/undotree")
  use("tpope/vim-fugitive")
  use("nvim-treesitter/nvim-treesitter-context");

  use {
	  'VonHeikemen/lsp-zero.nvim',
	  branch = 'v1.x',
	  requires = {
		  -- LSP Support
		  {'neovim/nvim-lspconfig'},
		  {'williamboman/mason.nvim'},
		  {'williamboman/mason-lspconfig.nvim'},

		  -- Autocompletion
		  {'hrsh7th/nvim-cmp'},
		  {'hrsh7th/cmp-buffer'},
		  {'hrsh7th/cmp-path'},
		  {'saadparwaiz1/cmp_luasnip'},
		  {'hrsh7th/cmp-nvim-lsp'},
		  {'hrsh7th/cmp-nvim-lua'},

		  -- Snippets
		  {'L3MON4D3/LuaSnip'},
		  {'rafamadriz/friendly-snippets'},
	  }
  }

  use("folke/zen-mode.nvim")
  use("github/copilot.vim")
  use("eandrju/cellular-automaton.nvim")
  use("laytan/cloak.nvim")

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if ensure_packer() then
      require('packer').sync()
  end
end)

