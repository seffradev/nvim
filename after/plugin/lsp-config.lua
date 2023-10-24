local lsp = require("lsp-zero")
local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

lsp.preset("recommended")

lsp.set_preferences({
    sign_icons = {}
})

vim.diagnostic.config({
    virtual_text = false,
    severity_sort = true,
    float = {
        style = 'minimal',
        border = 'rounded',
        source = 'always',
        header = '',
        prefix = '',
    },
})

local cmp_select = { behavior = cmp.SelectBehavior.Select }
cmp.setup({
    mapping = cmp.mapping.preset.insert({
        ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
        ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
        ["<C-y>"] = cmp.mapping.confirm({ select = true }),
        ["<C-Space>"] = cmp.mapping.complete(),
        ['<C-c>'] = cmp_action.toggle_completion(),
    }),
})

lsp.on_attach(function(client, bufnr)
    vim.keymap.set("n", "<leader>li", "<cmd>LspInfo<cr>", { desc = "LSP info" })
    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end,
        { desc = "Go to definition", buffer = bufnr, remap = false })
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end,
        { desc = "Show type information", buffer = bufnr, remap = false })
    vim.keymap.set("n", "<leader>lw", function() vim.lsp.buf.workspace_symbol() end,
        { desc = "Show workspace symbols", buffer = bufnr, remap = false })
    vim.keymap.set("n", "<leader>ld", function() vim.diagnostic.open_float() end,
        { desc = "Open diagnostics", buffer = bufnr, remap = false })
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end,
        { desc = "Go to next", buffer = bufnr, remap = false })
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end,
        { desc = "Go to previous", buffer = bufnr, remap = false })
    vim.keymap.set("n", "<leader>lc", function() vim.lsp.buf.code_action() end,
        { desc = "Show available code actions", buffer = bufnr, remap = false })
    vim.keymap.set("n", "<leader>lR", function() vim.lsp.buf.references() end,
        { desc = "Show references", buffer = bufnr, remap = false })
    vim.keymap.set("n", "<leader>lr", function() vim.lsp.buf.rename() end,
        { desc = "Rename symbol", buffer = bufnr, remap = false })
    vim.keymap.set("n", "<leader>lsh", function() vim.lsp.buf.signature_help() end,
        { desc = "Signature help", buffer = bufnr, remap = false })
    vim.keymap.set("n", "<leader>ls", "<cmd>Telescope lsp_document_symbols<cr>",
        { desc = "Show Document Symbols", buffer = bufnr, remap = false })
    vim.keymap.set("n", "<leader>lS", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
        { desc = "Show Workspace Symbols", buffer = bufnr, remap = false })
    vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, { desc = "Format document" })
end)

lsp.setup()

require("lspconfig").lua_ls.setup({})
require("lspconfig").rust_analyzer.setup({})
require("lspconfig").jdtls.setup({})
require("lspconfig").pyright.setup({})
require("lspconfig").tsserver.setup({})
require("lspconfig").svelte.setup({})
require("lspconfig").tailwindcss.setup({})
require("lspconfig").jsonls.setup({})
require("lspconfig").clangd.setup({})
require("lspconfig").gopls.setup({})
require("lspconfig").yamlls.setup({})
require("lspconfig").sqlls.setup({})
