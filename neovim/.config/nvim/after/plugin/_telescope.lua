local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>fa', builtin.find_files, {})
vim.keymap.set('n', '<leader>ff', builtin.git_files, {})
vim.keymap.set('n', '<leader>fs', builtin.live_grep, {})
-- vim.keymap.set('n', '<leader>fh', "<cmd>Telescope harpoon marks<CR>", {})
vim.keymap.set('n', '<leader>fo', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>fc', builtin.commands, {})

-- Lsp
vim.keymap.set('n', '<leader>gr', builtin.lsp_references, {})
vim.keymap.set('n', '<leader>gs', builtin.lsp_document_symbols, {})
-- vim.keymap.set('n', '<leader>gd', builtin.lsp_definitions, {})

require("telescope").load_extension('harpoon')
