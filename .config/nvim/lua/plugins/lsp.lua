return {
    {
       'VonHeikemen/lsp-zero.nvim',
        branch = 'v4.x',
        lazy = true,
        config = false,
    },
    {
        'williamboman/mason.nvim',
        lazy = false,
        config = true,
    },

    -- Autocompletion
    {
        'hrsh7th/nvim-cmp',
        event = 'InsertEnter',
        dependencies = {
            {
                'L3MON4D3/LuaSnip',
                version = "v2.*",
                dependencies = {
                    'rafamadriz/friendly-snippets'
                }
            },

        },
        config = function()
            local kind_icons = {
                Text = '  ',
                Method = '  ',
                Function = '  ',
                Constructor = '  ',
                Field = '  ',
                Variable = '  ',
                Class = '  ',
                Interface = '  ',
                Module = '  ',
                Property = '  ',
                Unit = '  ',
                Value = '  ',
                Enum = '  ',
                Keyword = '  ',
                Snippet = '  ',
                Color = '  ',
                File = '  ',
                Reference = '  ',
                Folder = '  ',
                EnumMember = '  ',
                Constant = '  ',
                Struct = '  ',
                Event = '  ',
                Operator = '  ',
                TypeParameter = '  ',
            }

            local cmp = require('cmp')
            local luasnip = require("luasnip")

            require("luasnip.loaders.from_vscode").lazy_load()

            vim.keymap.set({ "i", "s" }, "<C-L>", function() luasnip.jump(1) end, { silent = true })
            vim.keymap.set({ "i", "s" }, "<C-J>", function() luasnip.jump(-1) end, { silent = true })

            cmp.setup({
                sources = {
                    { name = 'luasnip',  keyword_length = 2, max_item_count = 3 },
                    { name = 'nvim_lsp', keyword_length = 1, max_item_count = 15 },
                    { name = 'path',     max_item_count = 2 },
                    { name = 'buffer',   keyword_length = 4, max_item_count = 2 },
                },
                sorting = {
                    comparators = {
                        cmp.config.compare.score,
                        cmp.config.compare.offset,
                    }
                },
                mapping = {
                    ["<C-L"] = cmp.mapping(function() luasnip.jump(1) end, { "i", "s" }),
                    ["<C-J"] = cmp.mapping(function() luasnip.jump(-1) end, { "i", "s" }),
                    ['<Tab>'] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            if luasnip.expandable() then
                                luasnip.expand()
                            else
                                cmp.confirm({
                                    select = true,
                                })
                            end
                        else
                            fallback()
                        end
                    end),
                },
                snippet = {
                    expand = function(args)
                        vim.snippet.expand(args.body)
                    end,
                },
                formatting = {
                    format = function(entry, vim_item)
                        vim_item.abbr = string.sub(vim_item.abbr, 1, 30)
                        -- Kind icons
                        vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind)
                        -- Source
                        vim_item.menu = ({})
                            [entry.source.name]
                        return vim_item
                    end
                },
                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                }
            })
        end
    },

    -- LSP
    {
        'neovim/nvim-lspconfig',
        cmd = { 'LspInfo', 'LspInstall', 'LspStart' },
        event = { 'BufReadPre', 'BufNewFile' },
        dependencies = {
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },
        },
        config = function()
            local lsp_zero = require('lsp-zero')

            -- lsp_attach is where you enable features that only work
            -- if there is a language server active in the file
            local lsp_attach = function(_, bufnr)
                local opts = { buffer = bufnr }

                vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
                vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
                -- vim.keymap.set("n", "<leader>gs", function() vim.lsp.buf.workspace_symbol() end, opts)
                vim.keymap.set("n", "gl", function() vim.diagnostic.open_float() end, opts)
                vim.keymap.set("n", "gj", function() vim.diagnostic.goto_next() end, opts)
                vim.keymap.set("n", "gk", function() vim.diagnostic.goto_prev() end, opts)
                vim.keymap.set("n", "<leader>c", function() vim.lsp.buf.code_action() end, opts)
                vim.keymap.set("n", "gr", function() vim.lsp.buf.references() end, opts)
                vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts)
                vim.keymap.set("i", "<C-Space>", function() vim.lsp.buf.signature_help() end, opts)

                vim.keymap.set("n", "<leader>dw", "<Cmd>lua require('dapui').eval()<CR>")
                vim.diagnostic.config({ virtual_text = true, signs = false, underline = false });
                vim.keymap.set('n', '<leader>rc', function()
                    vim.lsp.buf.format { async = true }
                end, opts)
            end

            lsp_zero.extend_lspconfig({
                sign_text = false,
                lsp_attach = lsp_attach,
                capabilities = require('cmp_nvim_lsp').default_capabilities()
            })

            require('mason-lspconfig').setup({
                ensure_installed = { 'lua_ls' },
                handlers = {
                    -- this first function is the "default handler"
                    -- it applies to every language server without a "custom handler"
                    function(server_name)
                        require('lspconfig')[server_name].setup({})
                    end,
                }
            })

            require('lspconfig').lua_ls.setup {
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { 'vim' }
                        },
                        workspace = {
                            checkThirdParty = true,
                            library = {
                                vim.env.VIMRUNTIME
                            }
                        }
                    }
                }
            }
        end
    }
}
