return {
    "monkoose/DoNe",
    lazy = true,
    config = function()
        vim.keymap.set("n", "<leader>dnr", "<Cmd>DoNe reload<CR>")
        vim.keymap.set("n", "<leader>dnb", "<Cmd>DoNe build<CR>")
    end
}
