local M = {}

M.config = function()
    vim.opt.backup = false
    vim.opt.modifiable = true
    vim.opt.swapfile = true
    vim.opt.updatetime = 250
    vim.opt.wildignorecase = true
    vim.opt.timeoutlen = 100
    vim.opt.relativenumber = true
    vim.opt.timeoutlen = 250
    vim.opt.clipboard = "unnamedplus" -- allows neovim to access the system clipboard
    vim.opt.cmdheight = 2             -- more space in the neovim command line for displaying messages
    vim.opt.completeopt = { "menuone", "noselect" }
    vim.opt.scrolloff = 20
    vim.opt.hidden = true     -- required to keep multiple buffers and open multiple buffers
    vim.opt.hlsearch = false  -- not highlight all matches on previous search pattern
    vim.opt.ignorecase = true -- ignore case in search patterns
    vim.opt.smartcase = true  -- smartcase
    vim.opt.mouse = "a"       -- allow the mouse to be used in neovim
    vim.opt.wrap = true
    vim.opt.shiftwidth = 4    -- the number of spaces inserted for each indentation
    vim.opt.tabstop = 4       -- insert 2 spaces for a tab

    vim.opt.splitright = true
    vim.opt.splitright = true

    vim.opt.autoindent = true
    vim.opt.smartindent = true

    -- auto command
    -- auto read
    vim.opt.autoread = true
    vim.api.nvim_create_autocmd({ "bufenter", "cursorhold", "cursorholdi", "focusgained" }, {
        command = "if mode() != 'c' | checktime | endif",
        pattern = { "*" },
    })

    -- add `pylyzer` to `skipped_servers` list
    vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pylyzer" })
    -- remove `pyright` from `skipped_servers` list
    lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(server)
        return server ~= "pyright"
    end, lvim.lsp.automatic_configuration.skipped_servers)
end

return M
