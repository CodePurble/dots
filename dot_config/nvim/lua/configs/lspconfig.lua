local lspconfig = require("lspconfig")
-- ref: https://github.com/hrsh7th/nvim-cmp#recommended-configuration
local capabilities = require("cmp_nvim_lsp").default_capabilities()

vim.diagnostic.config({
    virtual_text = {
        source = 'if_many',
        prefix = '●'
    },
    severity_sort = true,
    float = {
        source = 'if_many'
    }
})

vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("UserLspConfig", {}),
    callback = function(ev)
        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local opts = { buffer = ev.buf }
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
        vim.keymap.set("n", "gd", "<cmd>lua require('telescope.builtin').lsp_definitions()<CR>", opts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "gi", "<cmd>lua require('telescope.builtin').lsp_implementations()<CR>", opts)
        vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
        vim.keymap.set("n", "gr", "<cmd>lua require('telescope.builtin').lsp_references()<CR>", opts)
        vim.keymap.set("n", "[d", vim.diagnostic.goto_next, opts)
        vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, opts)
        vim.keymap.set("n", "<leader>Rn", vim.lsp.buf.rename, opts)
        vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, opts)
        vim.keymap.set("n", "<leader>w", vim.diagnostic.setloclist, opts)
        vim.keymap.set("n", "<leader>D", "<cmd>lua require('telescope.builtin').lsp_type_definitions()<CR>", opts)
    end,
})

-- local runtime_path = vim.split(package.path, ';')
-- table.insert(runtime_path, "lua/?.lua")
-- table.insert(runtime_path, "lua/?/init.lua")
require("lspconfig").lua_ls.setup({
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = "LuaJIT",
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = { "vim" },
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file("", true),
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {
                enable = false,
            },
        },
    },
})

lspconfig.pyright.setup({
    capabilities = capabilities,
})

lspconfig.clangd.setup({
    capabilities = capabilities,
})

lspconfig.rust_analyzer.setup({
    capabilities = capabilities,
})

lspconfig.texlab.setup({
    capabilities = capabilities,
})

lspconfig.marksman.setup({
    capabilities = capabilities,
})

lspconfig.verible.setup{
    capabilities = capabilities
}

require("clangd_extensions").setup({
    server = {
        capabilities = capabilities,
    },
})

-- lspconfig.svls.setup({
--     capabilities = capabilities,
-- })
