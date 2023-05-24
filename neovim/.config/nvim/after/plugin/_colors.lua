function ColorMyPencils(color)
	color = color or "rose-pine"

	vim.cmd [[
		let g:everforest_background = 'hard'
	]]

	vim.cmd.colorscheme(color)
	vim.api.nvim_set_hl(0, "DiagnosticVirtualTextError", { link = "Error" })
	vim.api.nvim_set_hl(0, "DiagnosticVirtualTextWarn", { link = "WarningMsg" })
	vim.api.nvim_set_hl(0, "Normal", { bg = "None" })
	vim.api.nvim_set_hl(0, "FloatBorder", { bg = "None" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "None" })
end

require('rose-pine').setup({
	--- @usage 'auto'|'main'|'moon'|'dawn'
	variant = 'main',
	--- @usage 'main'|'moon'|'dawn'
	dark_variant = 'main',
	bold_vert_split = false,
	dim_nc_background = false,
	disable_background = true,
	disable_float_background = true,
	disable_italics = false,
	--- @usage string hex value or named color from rosepinetheme.com/palette
	groups = {
		background = 'base',
		background_nc = '_experimental_nc',
		panel = 'surface',
		panel_nc = 'base',
		border = 'highlight_med',
		comment = 'muted',
		link = 'iris',
		punctuation = 'subtle',
		error = 'love',
		hint = 'iris',
		info = 'foam',
		warn = 'gold',
		headings = {
			h1 = 'iris',
			h2 = 'foam',
			h3 = 'rose',
			h4 = 'gold',
			h5 = 'pine',
			h6 = 'foam',
		}
	},
	highlight_groups = {
		CursorLine = { bg = 'foam', blend = 10 },
		StatusLine = { fg = 'love', bg = 'love', blend = 10 },
	}
})

ColorMyPencils('everforest')
