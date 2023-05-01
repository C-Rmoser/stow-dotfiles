require("telescope").setup({
    defaults = {
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
    extensions = {
        ["ui-select"] = {
            require("telescope.themes").get_dropdown {}
        }
    }
})


local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>fa', builtin.find_files, {})
vim.keymap.set('n', '<leader>ff', builtin.git_files, {})
vim.keymap.set('n', '<leader>fs', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fo', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>fc', builtin.commands, {})
vim.keymap.set('n', '<leader>fj', builtin.jumplist, {})
vim.keymap.set('n', '<leader>fk', builtin.keymaps, {})

-- Lsp
vim.keymap.set('n', '<leader>gr', builtin.lsp_references, {})
vim.keymap.set('n', '<leader>gs', builtin.lsp_document_symbols, {})
-- vim.keymap.set('n', '<leader>gs', builtin.lsp_document_symbols, {})
-- vim.keymap.set('n', '<leader>gd', builtin.lsp_definitions, {})

require("telescope").load_extension('harpoon')
require("telescope").load_extension("ui-select")
