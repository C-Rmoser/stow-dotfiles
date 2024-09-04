local global = vim.g
local o = vim.opt
local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Highlight on yank
augroup('YankHighlight', { clear = true })
autocmd('TextYankPost', {
		group = 'YankHighlight',
		callback = function()
		vim.highlight.on_yank({ higroup = 'IncSearch', timeout = '100' })
		end
})

-- vim.o.guicursor = 'i:block'
o.nu = true
o.relativenumber = true

o.tabstop = 4
o.list = false
o.shiftwidth = 4
o.softtabstop = 4
o.expandtab = true

o.smartindent = false

o.wrap = false

o.swapfile = false
o.backup = false
o.undodir = os.getenv("HOME") .. "/.vim/undodir"
o.undofile = true

o.hlsearch = false
o.incsearch = true
o.ignorecase = true
o.smartcase = true

o.termguicolors = true

o.scrolloff = 8
o.signcolumn = "yes"
o.isfname:append("@-@")

o.updatetime = 800

o.colorcolumn = "140"

o.clipboard = "unnamedplus"

o.fixendofline = false

o.textwidth = 0
