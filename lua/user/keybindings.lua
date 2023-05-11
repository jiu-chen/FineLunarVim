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

    map("n", "L", "<CMD>BufferLineCycleNext<CR>")
    map("n", "H", "<CMD>BufferLineCyclePrev<CR>")

    map("n", "se", "<CMD>split<CR>")
    map("n", "si", "<CMD>vsplit<CR>")
    map("n", "ye", "<CMD>%y+<CR>")

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
        c = { "<cmd>lua require('persistence').load()<cr>", "Restore last session for current dir" },
        l = { "<CMD>Lf<CR>", "Lf" },
    }

    lvim.builtin.which_key.mappings.s = vim.tbl_extend("keep", lvim.builtin.which_key.mappings.s, {
        e = { "<CMD>Telescope projects<CR>", "Projects" },
        s = { "<CMD>lua require('spectre').open()<CR>", "Open Spectre" },
        m = { "<CMD>lua require('spectre').open_visual({select_word=true})<CR>", "Search current word" },
        n = { "viw<CMD>lua require('spectre').open_file_search()<CR>", "Search on current file" },
        o = { "<CMD>SymbolsOutline<CR>", "Outline" },
    })


    lvim.builtin.which_key.mappings["m"] = {
        name = "Marks",
        a = { "<cmd>MarksListAll<CR>", "Show All Marks" },
        b = { "<cmd>MarksListBuf<CR>", "Show Marks in Buffer" },
        g = { "<cmd>MarksListGlobal<CR>", "Show Marks Global" },
        d = { "<CMD>MarkdownPreviewToggle<CR>", "Markdown" },
    }

    -- disable keymap
    lvim.builtin.which_key.mappings['h'] = {}
    --
    -- lvim.keys.normal_mode["<leader>h"]   = ":NvimTreeFindFile<cr>"
    lvim.builtin.which_key.mappings["h"] = { "<cmd>NvimTreeFindFile<CR>", "Nvim Find File" }

    -- terminal
    lvim.builtin.terminal.open_mapping   = "<c-t>"
end

return M
