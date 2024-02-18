local M = {}

function M.setup()
    vim.g.leader = ' '
    vim.g.mapleader = ' '

    local text = require('configs.mappings.text')
    text.setup()
end

return M
