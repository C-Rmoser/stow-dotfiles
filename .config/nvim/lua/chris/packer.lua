local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
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

    -- Color schemes
    use { "catppuccin/nvim", as = "catppuccin" }
    use { 'sainnhe/everforest' }

    -- Use my plugin
    use {
        '/home/crohrmoser/personal/git/simple-cloud-notes.nvim',
        config = function()
            require("simple-cloud-notes").setup()
        end
    }

    use 'famiu/bufdelete.nvim'

    use 'christoomey/vim-tmux-navigator'

    use 'jose-elias-alvarez/null-ls.nvim'

    use {
        'renerocksai/telekasten.nvim',
        requires = { 'nvim-telescope/telescope.nvim' },
    }

    use 'nvim-lua/popup.nvim'

    use {
        "windwp/nvim-autopairs",
        config = function()
            require("nvim-autopairs").setup {}
        end
    }

    use {
        'lewis6991/gitsigns.nvim',
    }

    use 'nvim-tree/nvim-web-devicons'

    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true },
        config = function ()
            require('lualine').setup()
        end
    }

    use {
        'akinsho/bufferline.nvim',
        tag = "*",
        requires = 'nvim-tree/nvim-web-devicons',
    }

    use {
        'nvim-telescope/telescope.nvim',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    use { 'nvim-telescope/telescope-ui-select.nvim' }

    use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })

    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v1.x',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },             -- Required
            { 'williamboman/mason.nvim' },           -- Optional
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },         -- Required
            { 'hrsh7th/cmp-nvim-lsp' },     -- Required
            { 'hrsh7th/cmp-buffer' },       -- Optional
            { 'hrsh7th/cmp-path' },         -- Optional
            { 'saadparwaiz1/cmp_luasnip' }, -- Optional
            { 'hrsh7th/cmp-nvim-lua' },     -- Optional

            -- Snippets
            { 'L3MON4D3/LuaSnip' },             -- Required
            { 'rafamadriz/friendly-snippets' }, -- Optional
        }
    }

    use({
        "gbprod/cutlass.nvim",
        config = function()
            require("cutlass").setup({})
        end
    })

    use({
        "kylechui/nvim-surround",
        tag = "*", -- Use for stability; omit to use `main` branch for the latest features
        config = function()
            require("nvim-surround").setup({})
        end
    })

    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons',
        },
    }

    use { 'mfussenegger/nvim-dap' }

    use {
        "terrortylor/nvim-comment",
        config = function()
            require('nvim_comment').setup()
        end
    }

    use {
        'theHamsta/nvim-dap-virtual-text',
        config = function()
            require("nvim-dap-virtual-text").setup()
        end
    }

    use {
        "rcarriga/nvim-dap-ui",
        tag = 'v3.6.3',
        requires = { "mfussenegger/nvim-dap" },
    }

    use {
        "karb94/neoscroll.nvim",
    }

end)
