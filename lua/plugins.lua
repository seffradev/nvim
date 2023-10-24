return {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
    },
    {
        "github/copilot.vim",
        lazy = false,
    },
    {
        "christoomey/vim-tmux-navigator",
        lazy = false,
    },
    {
        "nvim-treesitter/nvim-treesitter",
        build = function()
            require("nvim-treesitter.install").update({ with_sync = true })()
        end
    },
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
    },
    {
        "tpope/vim-fugitive",
    },
    {
        "nvim-lua/plenary.nvim",
    },
    {
        "ThePrimeagen/harpoon",
        lazy = true,
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
    },
    {
        "nvim-telescope/telescope.nvim",
        lazy = true,
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
    },
    {
        "mbbill/undotree",
    },
    {
        "folke/zen-mode.nvim",
    },
    {
        "VonHeikemen/lsp-zero.nvim",
        branch = "v3.x",
        dependencies = {
            -- LSP support
            { "neovim/nvim-lspconfig" },
            { "williamboman/mason.nvim" },
            { "williamboman/mason-lspconfig.nvim" },

            -- Autocompletion
            { "hrsh7th/nvim-cmp" },
            { "hrsh7th/cmp-nvim-lsp" },
            { "hrsh7th/cmp-buffer" },
            { "hrsh7th/cmp-path" },
            { "hrsh7th/cmp-nvim-lua" },

            -- Snippets
            { "L3MON4D3/LuaSnip" },
            { "rafamadriz/friendly-snippets" },
        },
    },
    {
        "williamboman/mason.nvim",
    },
    {
        "williamboman/mason-lspconfig.nvim",
    },
    {
        "mfussenegger/nvim-jdtls",
    },
    {
        "jackMort/ChatGPT.nvim",
        event = "VeryLazy",
        dependencies = {
            "MunifTanjim/nui.nvim",
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope.nvim",
        },
    },
}
