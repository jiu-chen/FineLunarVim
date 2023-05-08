local M = {}

M.config = function()
    ------------
    -- linter --
    ------------
    local linters = require "lvim.lsp.null-ls.linters"
    linters.setup {
        { command = "flake8",    filetypes = { "python" } },
        { command = "protolint", filetypes = { "proto" } },
    }


    ----------
    --format--
    ----------
    require("lvim.lsp.null-ls.formatters").setup({
        { filetypes = { "yaml", "yml" },                                                    command = "yamlfmt" },
        { filetypes = { "sql" },                                                            command = "sql-formatter" },
        { filetypes = { "sh" },                                                             command = "shfmt" },
        { filetypes = { "python" },                                                         command = "black" },
        { filetypes = { "javascript", "typescript", "javascriptreact", "typescriptreact" }, command = "prettier" },
        { filetypes = { "html", "css", "markdown" },                                        command = "prettier" },
        -- go --
        { command = "goimports",                                                            filetypes = { "go" } },
        { command = "gofumpt",                                                              filetypes = { "go" } },
    })
end

return M
