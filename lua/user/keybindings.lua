local M = {}

local function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

M.config = function()
    map("i", "jk", "<Esc>")

    map("n", "W", "5w")
    map("n", "B", "5b")

    map("n", "L", "<CMD>BufferLineCycleNext<CR>")
    map("n", "H", "<CMD>BufferLineCyclePrev<CR>")

    map("n", "se", "<CMD>split<CR>")
    map("n", "si", "<CMD>vsplit<CR>")
    map("n", "ye", "<CMD>%y+<CR>")

    map("v", "K", ":m '<-2<CR>gv=gv")
    map("v", "J", ":m '>+1<CR>gv=gv")

    lvim.builtin.which_key.mappings.s = vim.tbl_extend("keep", lvim.builtin.which_key.mappings.s, {
        e = { "<CMD>Telescope projects<CR>", "Projects" },
        s = { "<CMD>lua require('spectre').open()<CR>", "Open Spectre" },
        m = { "<CMD>lua require('spectre').open_visual({select_word=true})<CR>", "Search current word" },
        n = { "viw<CMD>lua require('spectre').open_file_search()<CR>", "Search on current file" },
    })

    lvim.builtin.which_key.mappings["a"] = {
        name = "Application",
        f = { "<CMD>NvimTreeFocus<CR>", "NvimTreeFocus" },
        m = { "<CMD>MarkdownPreviewToggle<CR>", "Markdown" },
        o = { "<CMD>SymbolsOutline<CR>", "Outline" },
        r = { "<CMD>RnvimrToggle<CR>", "Rnvimr" },
        c = { "<cmd>lua require('persistence').load()<cr>", "Restore last session for current dir" },
    }

    lvim.builtin.which_key.mappings["m"] = {
        name = "Marks",
        a = { "<cmd>MarksListAll<CR>", "Show All Marks" },
        b = { "<cmd>MarksListBuf<CR>", "Show Marks in Buffer" },
        g = { "<cmd>MarksListGlobal<CR>", "Show Marks Global" },
    }

    lvim.builtin.which_key.mappings["C"] = {
        name = "Python",
        c = { "<cmd>lua require('swenv.api').pick_venv()<cr>", "Choose Env" },
    }

    lvim.builtin.which_key.mappings["G"] = {
        name = "Go",
        t = { "<cmd>GoMod tidy<cr>", "Tidy" },
        a = { "<cmd>GoTestAdd<Cr>", "Add Test" },
        A = { "<cmd>GoTestsAll<Cr>", "Add All Tests" },
        e = { "<cmd>GoTestsExp<Cr>", "Add Exported Tests" },
        g = { "<cmd>GoGenerate<Cr>", "Go Generate" },
        f = { "<cmd>gogenerate %<cr>", "go generate file" },
        c = { "<cmd>gocmt<cr>", "generate comment" },
        T = { "<cmd>lua require('dap-go').debug_test()<cr>", "Debug Test" },
    }
end

return M
