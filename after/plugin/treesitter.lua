local configs = require("nvim-treesitter.configs")

configs.setup({
    ensure_installed = {
        "bash",
        "c",
        "css",
        "gitignore",
        "go",
        "html",
        "html",
        "java",
        "javascript",
        "json",
        "lua",
        "make",
        "python",
        "query",
        "rust",
        "sql",
        "svelte",
        "typescript",
        "vim",
        "vimdoc",
        "yaml",
    },
    sync_install = false,
    highlight = { enable = true },
    indent = { enable = true },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "<C-Space>",
            node_incremental = "<C-Space>",
            scope_incremental = false,
            node_decremental = "<bs>",
        },
    },
})
