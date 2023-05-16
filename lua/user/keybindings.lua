local M = {}

local function map(mode, lhs, rhs, opts)
    local options = { noremap = true, silent = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

M.config = function()
    map("i", "jk", "<Esc>")

    map("n", "W", "5w")
    map("n", "B", "5b")

    map("n", "L", "<cmd>BufferLineCycleNext<CR>")
    map("n", "H", "<cmd>BufferLineCyclePrev<CR>")

    map("n", "se", "<cmd>split<CR>")
    map("n", "si", "<cmd>vsplit<CR>")
    map("n", "ye", "<cmd>%y+<CR>")

    map("v", "K", ":m '<-2<CR>gv=gv")
    map("v", "J", ":m '>+1<CR>gv=gv")


    -- debug
    map("n", "<F4>", "<cmd>lua require'dap'.terminate()<cr>")
    map("n", "<F5>", "<cmd>lua require'dap'.continue()<cr>")
    map("n", "<F10>", "<cmd>lua require'dap'.step_over()<cr>")
    map("n", "<F11>", "<cmd>lua require'dap'.step_into()<cr>")
    map("n", "<F12>", "<cmd>lua require'dap'.step_out()<cr>")

    -- customize keymap
    lvim.builtin.which_key.mappings["a"] = {
        name = "Application",
        c = { "<cmd>lua require('persistence').load()<cr>", "Restore Session" },
        l = { "<cmd>Lf<CR>", "Lf" },
    }

    lvim.builtin.which_key.mappings.s = vim.tbl_extend("keep", lvim.builtin.which_key.mappings.s, {
        e = { "<cmd>Telescope projects<CR>", "Projects" },
        s = { "<cmd>lua require('spectre').open()<CR>", "Open Spectre" },
        m = { "<cmd>lua require('spectre').open_visual({select_word=true})<CR>", "Search Current Word" },
        n = { "viw<cmd>lua require('spectre').open_file_search()<CR>", "Search on Current File" },
        o = { "<cmd>SymbolsOutline<CR>", "Outline" },
    })


    lvim.builtin.which_key.mappings["m"]  = {
        name = "Marks",
        a = { "<cmd>MarksListAll<CR>", "Show All Marks" },
        b = { "<cmd>MarksListBuf<CR>", "Show Marks in Buffer" },
        g = { "<cmd>MarksListGlobal<CR>", "Show Marks Global" },
        d = { "<cmd>MarkdownPreviewToggle<CR>", "Markdown" },
    }

    lvim.builtin.which_key.mappings["t"]  = {
        name = "Trouble",
        t = { "<cmd>TroubleToggle<cr>", "Toggle" },
        w = { "<cmd>TroubleToggle workspace_diagnostics<cr>", "workspace_diagnostics" },
        d = { "<cmd>TroubleToggle document_diagnostics<cr>", "document_diagnostics" },
        l = { "<cmd>TroubleToggle loclist<cr>", "loclist" },
        q = { "<cmd>TroubleToggle quickfix<cr>", "quickfix" },
        s = { "<cmd>TroubleToggle lsp_references<cr>", "lsp_references" },
    }

    -- disable keymap
    lvim.builtin.which_key.mappings['h']  = {}
    lvim.builtin.which_key.mappings["h"]  = { "<cmd>NvimTreeFindFile<cr>", "Nvim Find File" }
    lvim.builtin.which_key.mappings["f"]  = { "<cmd>FzfLua files<cr>", "Find File" }
    -- lvim.keys.normal_mode["<C-f>"] = ":FzfLua grep_project<cr>"

    -- Adding a key to an existing menu/submenu.
    lvim.builtin.which_key.mappings["st"] = { "<cmd>FzfLua grep_project<cr>", "Find Text" }
    -- diff view
    lvim.keys.normal_mode["<leader>df"]   = { "<cmd>DiffviewOpen<cr>" }

    -- terminal
    lvim.builtin.terminal.open_mapping    = "<c-t>"


    -- Python
    lvim.builtin.which_key.mappings["C"] = {
        name = "Python",
        c = { "<cmd>lua require('swenv.api').pick_venv()<cr>", "Choose Env" },
    }
end

return M
