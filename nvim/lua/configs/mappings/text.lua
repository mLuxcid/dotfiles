local M = {}

function M.setup()
    local keymap, fn, api = vim.keymap, vim.fn, vim.api
    keymap.set('n', '<Up>', '<Nop>')
    keymap.set('n', '<Left>', '<Nop>')
    keymap.set('n', '<Right>', '<Nop>')
    keymap.set('n', '<Down>', '<Nop>')

    keymap.set('x', '<Up>', '<Nop>')
    keymap.set('x', '<Left>', '<Nop>')
    keymap.set('x', '<Right>', '<Nop>')
    keymap.set('x', '<Down>', '<Nop>')

    api.nvim_set_keymap('n', '<C-s>', '<CMD>w<CR>', {})
    api.nvim_set_keymap('i', '<C-s>', '<CMD>w<CR>', {})

    api.nvim_set_keymap('n', '<leader>q', '<CMD>wq<CR>', {})
end

return M
