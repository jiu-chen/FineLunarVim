local M = {}

M.config = function()
    vim.opt.backup = false
    vim.opt.modifiable = true
    vim.opt.swapfile = true
    vim.opt.updatetime = 250
    vim.opt.wildignorecase = true
    -- vim.opt.colorcolumn = "100"
    vim.opt.relativenumber = true
    vim.opt.timeoutlen = 250
    vim.opt.clipboard = "unnamedplus" -- allows neovim to access the system clipboard
    vim.opt.cmdheight = 2          -- more space in the neovim command line for displaying messages
    vim.opt.completeopt = { "menuone", "noselect" }
    vim.opt.scrolloff = 20
    vim.opt.hidden = true  -- required to keep multiple buffers and open multiple buffers
    vim.opt.hlsearch = false -- not highlight all matches on previous search pattern
    vim.opt.ignorecase = true -- ignore case in search patterns
    vim.opt.smartcase = true -- smartcase
    vim.opt.mouse = "a"    -- allow the mouse to be used in neovim
    vim.opt.wrap = true
    vim.opt.shiftwidth = 4 -- the number of spaces inserted for each indentation
    vim.opt.tabstop = 4    -- insert 2 spaces for a tab

    vim.opt.splitright = true
    vim.opt.splitright = true

    vim.opt.autoindent = true
    vim.opt.smartindent = true
end

return M
