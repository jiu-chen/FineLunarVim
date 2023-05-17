local M = {}

M.config = function()
    lvim.builtin.treesitter.autotag.enable = true
    lvim.builtin.treesitter.rainbow.enable = true
    lvim.builtin.treesitter.ensure_installed = {
        "bash",
        "vim",
        "lua",
        "c",
        "make",
        "cpp",
        "cmake",
        "go",
        "gomod",
        "python",
        "javascript",
        "typescript",
        "tsx",
        "http",
        "html",
        "css",
        "markdown",
        "markdown_inline",
        "json",
        "jsonc",
        "yaml",
        "toml",
        "comment",
        "regex",
        "dockerfile",
        "proto",
    }

    -- Automatically open file upon creation
    -- https://github.com/nvim-tree/nvim-tree.lua/issues/1120
    local api = require("nvim-tree.api")
    api.events.subscribe(api.events.Event.FileCreated, function(file)
        vim.cmd("edit " .. file.fname)
    end)
end

return M
