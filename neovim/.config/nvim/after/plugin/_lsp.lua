local lsp = require('lsp-zero').preset({
  name = 'minimal',
  set_lsp_keymaps = false,
  manage_nvim_cmp = true,
  suggest_lsp_servers = false,
})

lsp.ensure_installed({
	'tsserver',
	'eslint',
	'lua_ls',
	'rust_analyzer',
	'angularls',
    'cssls',
    'emmet_ls'
})

lsp.skip_server_setup({'jdtls'})

-- Fix Undefined global 'vim'
lsp.configure('lua_ls', {
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }
})

lsp.configure('cssls', {
    filetypes = { 'css', 'scss', 'sass', 'less' }
})

lsp.on_attach(function(_, bufnr)
  local opts = {buffer = bufnr, remap = false}

  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
  -- vim.keymap.set("n", "<leader>gs", function() vim.lsp.buf.workspace_symbol() end, opts)
  vim.keymap.set("n", "gl", function() vim.diagnostic.open_float() end, opts)
  vim.keymap.set("n", "gj", function() vim.diagnostic.goto_next() end, opts)
  vim.keymap.set("n", "gk", function() vim.diagnostic.goto_prev() end, opts)
  vim.keymap.set("n", "<leader>c", function() vim.lsp.buf.code_action() end, opts)
  -- vim.keymap.set("n", "<leader>gr", function() vim.lsp.buf.references() end, opts)
  vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts)
  vim.keymap.set("i", "<C-Space>", function() vim.lsp.buf.signature_help() end, opts)

  vim.keymap.set("n", "<leader>ds", function() vim.diagnostic.enable() end, {buffer = 0 ,silent = true})
  vim.keymap.set("n", "<leader>dh", function() vim.diagnostic.disable() end, {buffer = 0, silent = true} )

  vim.keymap.set("n", "<leader>rc", "<cmd>LspZeroFormat<Cr>")
  vim.keymap.set("n", "<leader>dw", "<Cmd>lua require('dapui').eval()<CR>")
  vim.diagnostic.config({ virtual_text = true, signs = false, underline = false });
end)

local cmp = require('cmp')

local kind_icons = {
  Text = "",
  Method = "",
  Function = "",
  Constructor = "",
  Field = "",
  Variable = "",
  Class = "ﴯ",
  Interface = "",
  Module = "",
  Property = "ﰠ",
  Unit = "",
  Value = "",
  Enum = "",
  Keyword = "",
  Snippet = "",
  Color = "",
  File = "",
  Reference = "",
  Folder = "",
  EnumMember = "",
  Constant = "",
  Struct = "",
  Event = "",
  Operator = "",
  TypeParameter = ""
}

lsp.setup_nvim_cmp({
    mapping = lsp.defaults.cmp_mappings({
        ['<Tab>'] = cmp.mapping.confirm({select = true}),
    }),
    formatting = {
        format = function(entry, vim_item)

            vim_item.abbr = string.sub(vim_item.abbr, 1, 20)
            -- Kind icons
            vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind)
            -- Source
            vim_item.menu = ({
                -- buffer = "[Buffer]",
                -- nvim_lsp = "[LSP]",
                -- luasnip = "[LuaSnip]",
                -- nvim_lua = "[Lua]",
            })
            [entry.source.name]
            return vim_item
        end
    },
})

lsp.setup()
