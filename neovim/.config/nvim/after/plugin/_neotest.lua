vim.keymap.set("n", "<leader>ta", "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<CR>")
vim.keymap.set("n", "<leader>tn", "<cmd>lua require('neotest').run.run()<CR>")
vim.keymap.set("n", "<leader>to", "<cmd>lua require('neotest').summary.open({ enter = true })<CR>")
vim.keymap.set("n", "<leader>tc", "<cmd>lua require('neotest').summary.close()<CR>")
vim.keymap.set("n", "<leader>tt", "<cmd>lua require('neotest').summary.toggle()<CR>")
vim.keymap.set("n", "<leader>ts", "<cmd>lua require('neotest').run.stop()<CR>")
vim.keymap.set("n", "<leader>tl", "<cmd>lua require('neotest').run.run_last()<CR>")

require("neotest").setup({
  adapters = {
      require("neotest-rust")
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
