return {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
        'nvim-treesitter-context'
    },
    build = function()
        require("nvim-treesitter.install").update({ with_sync = true })()
    end,
    config = function()
        require 'nvim-treesitter.configs'.setup {
            ensure_installed = { "javascript", "typescript", "lua", "vim", "rust", "yaml", "json", "xml", "terraform", "sql", "bash", "markdown" },
            sync_install = false,
            auto_install = true,
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },
        }
    end
}
