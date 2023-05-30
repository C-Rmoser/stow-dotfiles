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

    use 'Mofiqul/vscode.nvim'

    use {
        "folke/zen-mode.nvim",
        config = function()
            require("zen-mode").setup {
                window = {
                    backdrop = 1,
                    width = 180,
                },
            }
        end
    }

    use 'sainnhe/everforest'

    use {
        'nvim-treesitter/nvim-treesitter-refactor',
        config = function()
            require 'nvim-treesitter.configs'.setup {
                refactor = {
                    highlight_definitions = {
                        enable = true,
                        -- Set to false if you have an `updatetime` of ~100.
                        clear_on_cursor_move = true,
                    },
                },
            }
        end
    }

    use 'christoomey/vim-tmux-navigator'

    use 'jose-elias-alvarez/null-ls.nvim'

    use {
        'renerocksai/telekasten.nvim',
        requires = { 'nvim-telescope/telescope.nvim' },
    }

    use 'nvim-lua/popup.nvim'

    use 'mfussenegger/nvim-jdtls'

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
        requires = { 'kyazdani42/nvim-web-devicons' },
        config = function()
            require('lualine').setup()
        end
    }

    use
    {
        'akinsho/bufferline.nvim',
        tag = "v3.*",
        requires = 'nvim-tree/nvim-web-devicons',
    }

    use {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.1',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    use { 'nvim-telescope/telescope-ui-select.nvim' }

    use {
        'rose-pine/neovim',
        as = 'rose-pine',
        config = function()
            require("rose-pine").setup({
                dark_variant = 'moon',
                disable_italics = false,
                disable_background = true,
            })
            vim.cmd('colorscheme rose-pine')
        end
    }

    use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })

    use({
        'ThePrimeagen/harpoon',
        config = function()
            require("harpoon").setup({})
        end
    })

    use('mbbill/undotree')

    use('tpope/vim-fugitive')

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
        tag = 'nightly'
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

    use "antoinemadec/FixCursorHold.nvim"

    use "nvim-neotest/neotest-vim-test"

    use {
        "nvim-neotest/neotest",
        requires = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
            "antoinemadec/FixCursorHold.nvim",
            "haydenmeade/neotest-jest"
        },
    }

    use "rouge8/neotest-rust"

    use "vim-test/vim-test"

    use {
        "karb94/neoscroll.nvim",
    }
end)
