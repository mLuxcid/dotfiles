local _M = {}

function _M.setup()
    local cmp = require('cmp')
    cmp.setup({
        experimental = {
            ghost_text = true,
        },

        enabled = function()
            local ctx = require('cmp.config.context')
            if vim.api.nvim_get_mode().mode == 'c' then
                return true
            else
                return not ctx.in_treesitter_capture('comment')
                    and not ctx.in_syntax_group('Comment')
            end
        end,

        snippet = {
            expand = function(args)
                require('luasnip').lsp_expand(args.body)
            end,
        },

        window = {
            completion = cmp.config.window.bordered(),
            documentation = cmp.config.window.bordered(),
        },

        mapping = cmp.mapping.preset.insert({
            ['<C-b>'] = cmp.mapping.scroll_docs(-4),
            ['<C-f>'] = cmp.mapping.scroll_docs(4),
            ['<C-Space>'] = cmp.mapping.complete(),
            ['<C-a>'] = cmp.mapping.abort(),
            ['<Tab>'] = cmp.mapping.confirm({ select = true, }),
        }),

        sources = cmp.config.sources({
            { name = 'nvim_lsp', },
            { name = 'luasnip', },
            { name = 'buffer', },
        }),
    })

    local autopairs = require('nvim-autopairs.completion.cmp')
    cmp.event:on(
        'confirm_done',
        autopairs.on_confirm_done()
    )

    cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
            { name = 'path' },
            { name = 'cmdline' },
        },
    })
end

return {
    {
        'hrsh7th/nvim-cmp',
        event = InsertEnter,
        dependencies = {
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-cmdline',
            'L3MON4D3/LuaSnip',
            'saadparwaiz1/cmp_luasnip',
            {
                'windwp/nvim-autopairs',
                event = InsertEnter,
                config = true,
            },
        },
        config = function()
            _M.setup()
        end,

        opts = {
            experimental = {
                ghost_text = true,
            },
        },
    },
}
