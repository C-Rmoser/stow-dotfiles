function ColorMyPencils(color)
	vim.cmd.colorscheme(color)
	-- vim.api.nvim_set_hl(0, "DiagnosticVirtualTextError", { link = "Error" })
	-- vim.api.nvim_set_hl(0, "DiagnosticVirtualTextWarn", { link = "WarningMsg" })
	-- vim.api.nvim_set_hl(0, "Normal", { bg = "None" })
	vim.api.nvim_set_hl(0, "FloatBorder", { bg = "None" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "None" })

    require('vscode').load('dark')
end

-- Lua:
-- For dark theme (neovim's default)
vim.o.background = 'dark'
-- For light theme
vim.o.background = 'light'

-- local c = require('vscode.colors').get_colors()
-- require('vscode').setup({
--     -- Alternatively set style in setup
--     -- style = 'light'
--
--     -- Enable transparent background
--     transparent = false,
--
--     -- Enable italic comment
--     italic_comments = true,
--
--     -- Disable nvim-tree background color
--     disable_nvimtree_bg = true,
--
--     -- Override highlight groups (see ./lua/vscode/theme.lua)
--     group_overrides = {
--         -- this supports the same val table as vim.api.nvim_set_hl
--         -- use colors from this colorscheme by requiring vscode.colors!
--         Cursor = { fg=c.vscDarkBlue, bg=c.vscLightGreen, bold=true },
--     }
-- })
ColorMyPencils()
