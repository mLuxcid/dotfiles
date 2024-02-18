local M = {}

function M.telescope(builtin, opts)
    local params = { builtin = builtin, opts = opts }
    return function()
        builtin = params.builtin
        if builtin == "files" then
            builtin = "find_files"
        end
        require("telescope.builtin")[builtin](opts)
    end
end

function M.git(opts)
    return function()
        require('neogit').open(opts)
    end
end

function M.getbuf(name)
    if vim.api.nvim_buf_get_name(0) == name then
        vim.notify('already in buffer!')
        return {}
    end

    local buffers = vim.fn.getbufinfo({ buflisted = 1 })
    for _, buffer in ipairs(buffers) do
        if buffer.name == name then
            return buffer.bufnr
        end
    end

    vim.notify('Buffer doesn\'t exist!')
end

return M;
