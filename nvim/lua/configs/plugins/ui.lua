local util = require('configs.util')

return {
    {
        'nvim-neo-tree/neo-tree.nvim',
        lazy = false,
        dependencies = {
            'MunifTanjim/nui.nvim'
        },
        keys = {
            {
                '<leader>e',
                function()
                    require('neo-tree.command').execute({ toggle = true, })
                end,
            }
        },
        opts = {
            filesystem = {
                hijack_netrw_behavior = 'open_current',
            },
        },
    },
    {
        'nvim-telescope/telescope.nvim',
        keys = {
            { '<leader>ff', util.telescope('files') },
            { '<leader>lg', util.telescope('live_grep') },
            { '<leader>fb', '<CMD>Telescope buffers<CR>' },
        },
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        event = VeryLazy,
        opts = {
            show_current_context = true,
            show_current_context_start = true,
        },
        dependencies = {
            'nvim-treesitter/nvim-treesitter',
            lazy = true,
            opts = {
                highlight = {
                    enable = true,
                },
            },
        },
        {
            'nvim-lualine/lualine.nvim',
            opts = {
                options = {
                    component_separators = '|',
                    section_separators = { left = '', right = '' },
                },
                sections = {
                    lualine_a = {
                        { 'mode', right_padding = 2 },
                    },
                    lualine_b = { 'filename', 'branch' },
                    lualine_c = { 'diagnostics' },
                    lualine_x = {},
                    lualine_y = { 'filetype', 'progress' },
                    lualine_z = {
                        { 'location', left_padding = 2 },
                    },
                },
                inactive_sections = {
                    lualine_a = { 'filename' },
                    lualine_b = {},
                    lualine_c = {},
                    lualine_x = {},
                    lualine_y = {},
                    lualine_z = { 'location' },
                },
            },
        },
    },
    {
        "NeogitOrg/neogit",
        event = VeryLazy,
        dependencies = {
            "sindrets/diffview.nvim",
            'nvim-lua/plenary.nvim',
        },
        config = function()
            require('neogit').setup()
        end,
        keys = {
            { '<leader>gc', util.git({ 'commit', kind = 'tab' }), {} },
            { '<leader>go', util.git({ kind = 'tab', }),          {} },
        },
    },
    {
        'akinsho/bufferline.nvim',
        version = "*",
        config = true,
        dependencies = 'nvim-tree/nvim-web-devicons'
    }
}
