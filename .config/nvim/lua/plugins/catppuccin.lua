return {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
        -- vim.cmd.colorscheme "catppuccin-mocha"

        -- Set color of current line number
        vim.cmd [[
            hi CursorLineNr guifg=#f5f5f5
            set cursorline
            set cursorlineopt=number
        ]]
    end
}
