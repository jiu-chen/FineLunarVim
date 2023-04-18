local M = {}

local function map(mode, lhs, rhs, opts)
	local options = { noremap = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

M.config = function()
	map("n", "W", "5w")
	map("n", "B", "5b")
	map("", ";", "<CMD>HopChar2<CR>")
	map("", ",", "<CMD>HopLineStartMW<CR>")
	map("n", "L", "<CMD>BufferLineCycleNext<CR>")
	map("n", "H", "<CMD>BufferLineCyclePrev<CR>")

	map("n", "se", "<cmd>:split<cr>")
	map("n", "si", "<cmd>:vsplit<cr>")


	map('i', 'jk', '<Esc>')

	map("v", "K", ":m '<-2<CR>gv=gv")
	map("v", "J", ":m '>+1<CR>gv=gv")


	lvim.builtin.which_key.mappings.s = vim.tbl_extend("keep", lvim.builtin.which_key.mappings.s,
		{
			s = { "<cmd>lua require('spectre').open()<CR>", "Open Spectre" },
			m = { "<cmd>lua require('spectre').open_visual({select_word=true})<CR>", "Search current word" },
			n = { "viw<cmd>lua require('spectre').open_file_search()<CR>", "Search on current file" },
		}
	)

	lvim.builtin.which_key.mappings["a"] = {
		name = "Application",
		o = { "<CMD>SymbolsOutline<CR>", "Outline" },
		t = { "<CMD>TodoTrouble<CR>", "TODO" },
		u = { "<CMD>UndotreeToggle<CR>", "UndoTree" },
		m = { "<cmd>MarkdownPreviewToggle<CR>", "Markdown" },
		e = { "<CMD>Telescope projects<CR>", "Projects" },
	}

	lvim.builtin.which_key.mappings["t"] = {
		name = "Diagnostics",
		t = { "<cmd>TroubleToggle<cr>", "trouble" },
		w = { "<cmd>TroubleToggle workspace_diagnostics<cr>", "workspace" },
		d = { "<cmd>TroubleToggle document_diagnostics<cr>", "document" },
		q = { "<cmd>TroubleToggle quickfix<cr>", "quickfix" },
		l = { "<cmd>TroubleToggle loclist<cr>", "loclist" },
		r = { "<cmd>TroubleToggle lsp_references<cr>", "references" },
	}
end

return M
