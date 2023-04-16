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

    use {
        'renerocksai/telekasten.nvim',
        requires = { 'nvim-telescope/telescope.nvim' },
        config = function()
            require('telekasten').setup({
                home = vim.fn.expand('~/.config/zettelkasten'),
                tag_notation = ':tag:',
                show_tags_theme = 'dropdown'
            })
        end
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
        config = function()
            require('gitsigns').setup {
                on_attach = function(bufnr)
                    local gs = package.loaded.gitsigns

                    local function map(mode, l, r, opts)
                        opts = opts or {}
                        opts.buffer = bufnr
                        vim.keymap.set(mode, l, r, opts)
                    end

                    map('n', '<leader>tb', gs.toggle_current_line_blame)
                    map('n', '<leader>hb', function() gs.blame_line { full = true } end)
                    map('n', '<leader>hd', gs.diffthis)
                end
            }
        end
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
        config = function()
            require("telescope").setup({
                defaults = {
                    path_display = { "truncate", truncate = 2 },
                },
                pickers = {
                    find_files = {
                        theme = "dropdown",
                    },
                    git_files = {
                        theme = "dropdown",
                    },
                    live_grep = {
                        theme = "dropdown",
                    },
                    buffers = {
                        theme = "dropdown",
                    },
                    help_tags = {
                        theme = "dropdown",
                    },
                    commands = {
                        theme = "dropdown",
                    },
                    lsp_references = {
                        theme = "dropdown",
                    },
                    lsp_document_symbols = {
                        theme = "dropdown",
                    },
                    lsp_definitions = {
                        theme = "dropdown",
                    },
                },
            })
        end,
        -- or                            , branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

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

    use 'nvim-treesitter/nvim-treesitter-context'

    use({
        'ThePrimeagen/harpoon',
        config = function()
            require("harpoon").setup({
            })
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
            require("cutlass").setup({
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            })
        end
    })

    use({
        "kylechui/nvim-surround",
        tag = "*", -- Use for stability; omit to use `main` branch for the latest features
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
            })
        end
    })

    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons', -- optional, for file icons
        },
        tag = 'nightly'                    -- optional, updated every week. (see issue #1193)
    }

    use {
        "akinsho/toggleterm.nvim", tag = '*',
        config = function()
            require("toggleterm").setup({
                open_mapping = [[<c-\>]],
                direction = 'float',
            })
        end
    }

    use 'mfussenegger/nvim-dap'

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
        config = function()
            require("dapui").setup({
                controls = {
                    element = "repl",
                    enabled = true,
                    icons = {
                        disconnect = "",
                        pause = "",
                        play = "",
                        run_last = "",
                        step_back = "",
                        step_into = "",
                        step_out = "",
                        step_over = "",
                        terminate = ""
                    }
                },
                element_mappings = {},
                expand_lines = true,
                floating = {
                    border = "single",
                    mappings = {
                        close = { "q", "<Esc>" }
                    }
                },
                force_buffers = true,
                icons = {
                    collapsed = "",
                    current_frame = "",
                    expanded = ""
                },
                layouts = { {
                    elements = { {
                        id = "breakpoints",
                        size = 0.5
                    }, {
                        id = "watches",
                        size = 0.5
                    } },
                    position = "left",
                    size = 40
                }, {
                    elements = { {
                        id = "scopes",
                        size = 1
                    } },
                    position = "bottom",
                    size = 10
                } },
                mappings = {
                    edit = "e",
                    expand = { "<CR>", "<2-LeftMouse>" },
                    open = "o",
                    remove = "d",
                    repl = "r",
                    toggle = "t"
                },
                render = {
                    indent = 1,
                    max_value_lines = 100
                }
            })
        end
    }

    use "antoinemadec/FixCursorHold.nvim"

    use "nvim-neotest/neotest-vim-test"

    use "haydenmeade/neotest-jest"

    use {
        "nvim-neotest/neotest",
        requires = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
            "antoinemadec/FixCursorHold.nvim"
        },
    }

    use "rouge8/neotest-rust"

    use "vim-test/vim-test"

    use {
        "karb94/neoscroll.nvim",
        config = function()
            require('neoscroll').setup({
                mappings = { '<C-u>', '<C-d>', 'zt', 'zz', 'zb' },
            })
        end
    }
end)
