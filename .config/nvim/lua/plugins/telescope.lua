-- make sure to install ripgrep for live_grep to work
return {
    {
        'nvim-telescope/telescope.nvim',
        branch = '0.1.x',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function()
            -- Set filetypes of script files to make highlighting in preview window work
            local previewers = require("telescope.previewers")

            local new_maker = function(filepath, bufnr, opts)
                opts = opts or {}

                -- Force `.script` files to use Lua highlighting in preview
                if filepath:match("%.script$") or filepath:match("%.gui_script$") then
                    vim.schedule(function()
                        vim.bo[bufnr].filetype = "lua"
                    end)
                end

                previewers.buffer_previewer_maker(filepath, bufnr, opts)
            end

            require("telescope").setup({
                defaults = {
                    buffer_previewer_maker = new_maker,
                    layout_strategy = "flex",
                    path_display = { "truncate", truncate = 2 },
                    layout_config = {
                        flex = {
                            flip_columns = 150,
                        },
                        horizontal = {
                            height = 0.95,
                            preview_cutoff = 150,
                            prompt_position = "bottom",
                            width = 0.95,
                        },
                        vertical = {
                            height = 0.95,
                            preview_cutoff = 0,
                            prompt_position = "bottom",
                            width = 0.95,
                        }
                    },
                },
                pickers = {
                    find_files = {
                        no_ignore = true
                    },
                },
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown {}
                    }
                },

            })

            local showSymbolFinder = function()
                local opts = {
                    symbols = {
                        "interface",
                        "class",
                        "constructor",
                        "method",
                    }
                }
                if vim.bo.filetype == "vim" then
                    opts.symbols = { "function" }
                end
                require('telescope.builtin').lsp_document_symbols(opts)
            end

            local builtin = require('telescope.builtin')
            vim.keymap.set('n', '<leader>fa', builtin.find_files, {})
            vim.keymap.set('n', '<leader>ff', builtin.git_files, {})

            vim.keymap.set('n', '<leader>fs', builtin.live_grep, {})
            vim.keymap.set('n', '<c-p>', builtin.git_files, {})
            vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
            vim.keymap.set('n', '<leader>fl', builtin.oldfiles, {})
            vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
            vim.keymap.set('n', '<leader>fc', builtin.commands, {})
            vim.keymap.set('n', '<leader>fj', builtin.jumplist, {})
            vim.keymap.set('n', '<leader>fk', builtin.keymaps, {})
            vim.keymap.set('n', '<leader>fq', builtin.quickfix, {})

            -- Lsp
            vim.keymap.set('n', 'gr', builtin.lsp_references, {})
            vim.keymap.set('n', '<leader>gs', showSymbolFinder, {})
            vim.keymap.set('n', '<leader>gd', builtin.diagnostics, {})

            require("telescope").load_extension("ui-select")
        end
    },
    {
        'nvim-telescope/telescope-ui-select.nvim'
    }
}
