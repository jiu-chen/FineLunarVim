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
end

return M
