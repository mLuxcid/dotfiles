local function setup()
    local lspconfig = require('lspconfig')
    require('mason').setup({
        ui = {
            border = 'single',
        },
    })
    require('mason-lspconfig').setup({
        ensure_installed = {
            'lua_ls', 'rust_analyzer',
        },
    })
    -- setup lsp servers
    local default_handler = function(server)
        -- See :help lspconfig-setup
        require('lspconfig')[server].setup({
            capabilities = require('cmp_nvim_lsp').default_capabilities()
        })
    end

    require('mason-lspconfig').setup_handlers({
        default_handler,
    })

    -- manually setup clangd since it can't be installed using mason
    --lspconfig.clangd.setup({
    --    capabilities = require('cmp_nvim_lsp').default_capabilities()
    --})

    lspconfig.lua_ls.setup({
        settings = {
            Lua = {
                completion = {
                    callSnippet = true,
                },
            },
        },
    })
end

return {
    {
        'williamboman/mason-lspconfig.nvim',
        event = VeryLazy,
        dependencies = {
            'williamboman/mason.nvim',
        },
        config = function()
            setup()
        end,
    },
}
