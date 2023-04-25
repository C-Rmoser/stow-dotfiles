vim.keymap.set("n", "<leader>ta", "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<CR>")
vim.keymap.set("n", "<leader>tn", "<cmd>lua require('neotest').run.run()<CR>")
vim.keymap.set("n", "<leader>to", "<cmd>lua require('neotest').summary.toggle()<CR>")
vim.keymap.set("n", "<leader>ts", "<cmd>lua require('neotest').run.stop()<CR>")
vim.keymap.set("n", "<leader>tl", "<cmd>lua require('neotest').run.run_last()<CR>")

require("neotest").setup({
    adapters = {
        require("neotest-rust"),
        require('neotest-jest')({
            jestCommand = "npm test --",
            jestConfigFile = "custom.jest.config.ts",
            env = { CI = true },
            cwd = function(_)
                return vim.fn.getcwd()
            end,
        }),
        -- require("neotest-vim-test")({
        -- ignore_file_types = {  "ts", "rust", "vim", "lua" },
        -- }),
        require("neotest-vim-test")({ allow_file_types = { "java" } }),
    },
    status = {
        enabled = true,
        signs = true,
        virtual_text = false
    },
    summary = {
        mappings = {
            attach = "a",
            clear_marked = "M",
            clear_target = "T",
            debug = "d",
            debug_marked = "D",
            expand = { "<CR>", "<2-LeftMouse>" },
            expand_all = "e",
            jumpto = "i",
            mark = "m",
            next_failed = "J",
            output = "O",
            prev_failed = "K",
            run = "r",
            run_marked = "R",
            short = "o",
            stop = "u",
            target = "t"
        },
    },
})
