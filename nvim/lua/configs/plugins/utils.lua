local util = require('configs.util')

return {
    { 'nvim-tree/nvim-web-devicons', lazy = true, },
    { 'nvim-lua/plenary.nvim',       lazy = true, },
    {
        'akinsho/toggleterm.nvim',
        version = "*",
        event = VeryLazy,
        opts = {
            open_mapping = [[<C-t>]]
        },
    }
}
