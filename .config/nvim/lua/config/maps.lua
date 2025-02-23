vim.g.mapleader = " "

local function map(mode, lhs, rhs)
	vim.keymap.set(mode, lhs, rhs, { noremap = true, silent = true })
end

-- Exit normal mode
map("i", "jk", "<Esc>")

-- Save with ctrl-s
map("i", "<C-s>", "<Esc>:w<CR>")
map("n", "<C-s>", ":w<CR>")
map("n", "<leader>q", ":q!<CR>")

-- Do change copy register when copying in visual mode
map("v", 'p', '"_dP')

-- make current file executable
map("n", "<leader>x", ":!chmod +x %<CR>")
map("n", "<C-f>", ":silent !tmux neww tmux-sessionizer<CR>")

vim.cmd [[
  " Jumplist mutations
  nnoremap <expr> k (v:count > 5 ? "m'" . v:count : "") . 'k'
  nnoremap <expr> j (v:count > 5 ? "m'" . v:count : "") . 'j'
]]

-- Undo break points
map('i', ',', ',<c-g>u')
map('i', '.', '.<c-g>u')
map('i', '!', '!<c-g>u')
map('i', '?', '?<c-g>u')

map("n", 'Q', '<nop>')

-- Move lines up / down in visual mode
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

-- Keeping it centered
map("n", 'n', 'nzzzv')
map("n", 'N', 'Nzzzv')
map("n", 'J', 'mzJ`z')
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")

-- Easier movement between windows
map("n", "<C-h>", "<C-w>h")
map("n", "<C-l>", "<C-w>l")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")

-- Buffer mappings
map("n", "<leader>wt", "<C-6>")
map("n", "<leader>ww", "<cmd>:bd<CR>")
map("n", "<leader>b", ":b ")

-- Maintain the cursor position when yanking a visual selection
map("v", "y", "myy`y")
map("v", "Y", "myY`y")
