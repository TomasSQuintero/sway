vim.pack.add({
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/williamboman/mason.nvim" },
	{ src = "https://github.com/williamboman/mason-lspconfig.nvim" },
})

require('mason').setup()
require('mason-lspconfig').setup({
    ensure_installed = {
        'lua_ls',          -- Lua
        'clangd',          -- C/C++
        'basedpyright',    -- Python
    },
    automatic_installation = true,
})

local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Lua
vim.lsp.config.lua_ls = {
    cmd = { 'lua-language-server' },
    filetypes = { 'lua' },
    root_markers = { '.luarc.json', '.luarc.jsonc', '.luacheckrc', '.stylua.toml', 'stylua.toml', 'selene.toml', 'selene.yml', '.git' },
    capabilities = capabilities,
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }
}

-- C/C++
vim.lsp.config.clangd = {
    cmd = { 'clangd' },
    filetypes = { 'c', 'cpp', 'objc', 'objcpp', 'cuda', 'proto' },
    root_markers = { '.clangd', '.clang-tidy', '.clang-format', 'compile_commands.json', 'compile_flags.txt', 'configure.ac', '.git' },
    capabilities = capabilities,
}

-- Python
vim.lsp.config.basedpyright = {
    cmd = { 'basedpyright-langserver', '--stdio' },
    filetypes = { 'python' },
    root_markers = { 'pyproject.toml', 'setup.py', 'setup.cfg', 'requirements.txt', 'Pipfile', 'pyrightconfig.json', '.git' },
    capabilities = capabilities,
}

-- Enable the LSP servers
vim.lsp.enable('lua_ls')
vim.lsp.enable('clangd')
vim.lsp.enable('basedpyright')
