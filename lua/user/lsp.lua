local M = {}

M.config = function()
    -- not necessary?
    --[[ require("lvim.lsp.null-ls.linters").setup({
		{
			filetypes = { "sh" },
			command = "shellcheck",
		},
		-- {
		-- 	filetypes = { "go" },
		-- 	command = "golangci_lint",
		-- },
		{
			filetypes = { "javascript", "typescript", "javascriptreact", "typescriptreact" },
			command = "eslint",
		},
		{ filetypes = { "html" }, command = "tidy" },
		{ filetypes = { "css" }, command = "stylelint" },
		{
			filetypes = { "markdown" },
			command = "markdownlint",
			args = { "--disable", "MD013" },
		},
		-- { filetypes = { "proto" }, command = "protolint" },
	})
]]
    require("lvim.lsp.null-ls.formatters").setup({
        { filetypes = { "sql" },                                                            command = "sql-formatter" },
        { filetypes = { "cmake" },                                                          command = "cmake_format" },
        { filetypes = { "go" },                                                             command = "goimports" },
        { filetypes = { "python" },                                                         command = "black" },
        { filetypes = { "javascript", "typescript", "javascriptreact", "typescriptreact" }, command = "prettier" },
        { filetypes = { "html", "css", "markdown" },                                        command = "prettier" },
    })
end

return M
