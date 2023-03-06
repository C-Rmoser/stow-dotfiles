local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

local builtin = require('telescope.builtin')
vim.keymap.set("n", "<leader>a", mark.add_file)
vim.keymap.set('n', '<leader>fs', builtin.live_grep, {})
vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)

vim.keymap.set("n", "<C-t>", function() ui.nav_file(1) end)
-- vim.keymap.set("n", "<C-h>", function() ui.nav_file(2) end)
vim.keymap.set("n", "<C-n>", function() ui.nav_file(3) end)
vim.keymap.set("n", "<C-p>", function() ui.nav_file(4) end)
