local M = {}

function M:bootstrap()
    local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
    if not vim.loop.fs_stat(lazypath) then
        vim.fn.system({
            "git",
            "clone",
            "--filter=blob:none",
            "https://github.com/folke/lazy.nvim.git",
            "--branch=stable", -- latest stable release
            lazypath,
        })
    end
    vim.opt.rtp:prepend(lazypath)
end

function M.load()
    require('lazy').setup({
        { import = 'configs.plugins.colorscheme' },
        { import = 'configs.plugins.utils' },
        { import = 'configs.plugins.lsp' },
        { import = 'configs.plugins.ui' },
    })
end

return M

