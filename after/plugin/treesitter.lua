local configs = require("nvim-treesitter.configs")

configs.setup({
    ensure_installed = {
        "c",
        "lua",
        "vim",
        "vimdoc",
        "query",
        "svelte",
        "rust",
        "typescript",
        "html",
        "go",
        "python",
    },
    sync_install = false,
    highlight = { enable = true },
    indent = { enable = true },
})
