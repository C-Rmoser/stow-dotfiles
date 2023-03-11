local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

ensure_packer()

vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use 'mfussenegger/nvim-jdtls'

  use({
      'rose-pine/neovim',
      as = 'rose-pine',
      config = function()
          require("rose-pine").setup({
              -- dark_variant = 'moon',
              disable_italics = false,
              disable_background = true,
          })
          vim.cmd('colorscheme rose-pine')
      end
  })

  use({
	  "gbprod/cutlass.nvim",
	  config = function()
		  require("cutlass").setup({
			  -- your configuration comes here
			  -- or leave it empty to use the default settings
			  -- refer to the configuration section below
		  })
	  end
  })

  use {
      "terrortylor/nvim-comment",
      config = function()
          require('nvim_comment').setup()
      end
  }

  use {
      "karb94/neoscroll.nvim",
      config = function ()
          require('neoscroll').setup({ 
              mappings = {'<C-u>', '<C-d>', 'zt', 'zz', 'zb'},
          })
      end
  }
end)


