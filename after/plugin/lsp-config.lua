local lsp = require("lsp-zero")
lsp.preset("recommended")

lsp.ensure_installed({
    "tsserver",
    "eslint",
    "lua_ls",
    "rust_analyzer",
})

local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
    ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
    ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
    ["<C-y>"] = cmp.mapping.confirm({ select = true }),
    ["<C-Space>"] = cmp.mapping.complete(),
})

lsp.set_preferences({
    sign_icons = {}
})

lsp.setup_nvim_cmp({
    mapping = cmp_mappings
})

lsp.on_attach(function(client, bufnr)
    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end,
        { desc = "Go to definition", buffer = bufnr, remap = false })
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end,
        { desc = "Show type information", buffer = bufnr, remap = false })
    vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end,
        { desc = "Show workspace symbols", buffer = bufnr, remap = false })
    vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end,
        { desc = "Open diagnostics", buffer = bufnr, remap = false })
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end,
        { desc = "Go to next", buffer = bufnr, remap = false })
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end,
        { desc = "Go to previous", buffer = bufnr, remap = false })
    vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end,
        { desc = "Show available code actions", buffer = bufnr, remap = false })
    vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end,
        { desc = "Show references", buffer = bufnr, remap = false })
    vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end,
        { desc = "Rename symbol", buffer = bufnr, remap = false })
    vim.keymap.set("n", "<leader>sh", function() vim.lsp.buf.signature_help() end,
        { desc = "Signature help", buffer = bufnr, remap = false })
    vim.keymap.set("n", "<leader>ls", "<cmd>Telescope lsp_document_symbols<cr>",
        { desc = "Show Document Symbols", buffer = bufnr, remap = false })
    vim.keymap.set("n", "<leader>lS", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
        { desc = "Show Workspace Symbols", buffer = bufnr, remap = false })
end)

lsp.setup()
