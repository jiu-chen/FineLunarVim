local M = {}

M.config = function()
    -- Requires `:LvimCacheReset` to take effect
    ------------
    -- linter --
    ------------
    local linters = require "lvim.lsp.null-ls.linters"
    linters.setup {
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
        { filetypes = { "go" },                                                             command = "goimports" },
        -- { filetypes = { "go" },                                                             command = "gofumpt" },
    })
end

return M
