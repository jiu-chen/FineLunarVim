local M = {}

M.config = function()
    require("lvim.lsp.null-ls.linters").setup({
        { filetypes = { "sh" },                                                             command = "shellcheck" },
        { filetypes = { "go" },                                                             command = "golangci_lint" },
        -- { filetypes = { "python" },                                                         command = "pylint" }, -- too critical
        { filetypes = { "javascript", "typescript", "javascriptreact", "typescriptreact" }, command = "eslint" },
        { filetypes = { "html" },                                                           command = "tidy" },
        { filetypes = { "css" },                                                            command = "stylelint" },
        {
            filetypes = { "markdown" },
            command = "markdownlint",
            args = {
                "--disable", "MD013" }
        },
    })

    require("lvim.lsp.null-ls.formatters").setup({
        { filetypes = { "cmake" }, command = "cmake_format" },
        { filetypes = { "go" },    command = "goimports" },
        {
            filetypes = { "python" },
            command = "black",
        },
        { filetypes = { "lua" },                                                            command = "stylua" },
        { filetypes = { "javascript", "typescript", "javascriptreact", "typescriptreact" }, command = "prettier" },
        { filetypes = { "html", "css", "markdown" },                                        command = "prettier" },
    })
end

return M
