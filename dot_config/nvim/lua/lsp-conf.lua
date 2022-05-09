require("nvim-lsp-installer").setup {
    ensure_installed = {
        "clangd",
        "sunmeko_lua",
        "pyright",
        "texlab",
        "svls"
    },
    automatic_installation = false,
    ui = {
        icons = {
            -- The list icon to use for installed servers.
            server_installed = "",
            -- The list icon to use for servers that are pending installation.
            server_pending = "",
            -- The list icon to use for servers that are not installed.
            server_uninstalled = "",
        },
        keymaps = {
            -- Keymap to expand a server in the UI
            toggle_server_expand = "<CR>",
            -- Keymap to install the server under the current cursor position
            install_server = "i",
            -- Keymap to reinstall/update the server under the current cursor position
            update_server = "u",
            -- Keymap to check for new version for the server under the current cursor position
            check_server_version = "c",
            -- Keymap to update all installed servers
            update_all_servers = "U",
            -- Keymap to check which installed servers are outdated
            check_outdated_servers = "C",
            -- Keymap to uninstall a server
            uninstall_server = "X",
        },
    },

    -- Controls to which degree logs are written to the log file. It's useful
    -- to set this to vim.log.levels.DEBUG when debugging issues with server
    -- installations.
    log_level = vim.log.levels.INFO,
}

local lspconfig = require'lspconfig'

-- ref: https://github.com/hrsh7th/cmp-nvim-lsp
-- The nvim-cmp almost supports LSP's capabilities so You should advertise it to LSP servers..
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

local on_attach = function(client, bufnr)
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    -- local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

    -- Mappings.
    local opts = { noremap=true, silent=true }
    buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
    buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
    buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
    buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
    buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
end

local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")
lspconfig.sumneko_lua.setup {
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = 'LuaJIT',
                -- Setup your lua path
                path = runtime_path,
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = {'vim'},
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
    on_attach = on_attach,
    capabilities = capabilities
}

lspconfig.pyright.setup{
    on_attach = on_attach,
    capabilities = capabilities
}

lspconfig.clangd.setup{
    on_attach = on_attach,
    capabilities = capabilities
}

lspconfig.rust_analyzer.setup{
    on_attach = on_attach,
    capabilities = capabilities
}

lspconfig.texlab.setup{
    on_attach = on_attach,
    capabilities = capabilities
}

-- WARN: INSTALL MANUALLY FROM AUR
-- A generic Linux binary for is not provided, so nvim-lsp-installer cannot get
-- it from anywhere yet
-- lspconfig.verible.setup{
--     on_attach = on_attach,
--     capabilities = capabilities
-- }

require("clangd_extensions").setup {
    server = {
        on_attach = on_attach,
        capabilities = capabilities
    }
}

lspconfig.svls.setup{
    on_attach = on_attach,
    capabilities = capabilities,
}

