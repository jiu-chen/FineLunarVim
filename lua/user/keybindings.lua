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


    map("n", "jk", "<Esc>")

    map("v", "K", ":m '<-2<CR>gv=gv")
    map("v", "J", ":m '>+1<CR>gv=gv")


    lvim.builtin.which_key.mappings.s = vim.tbl_extend("keep", lvim.builtin.which_key.mappings.s,
        {
            p = { "<CMD>Telescope projects<CR>", "Open Spectre" },
            s = { "<cmd>lua require('spectre').open()<CR>", "Open Spectre" },
            m = { "<cmd>lua require('spectre').open_visual({select_word=true})<CR>", "Search current word" },
            n = { "viw<cmd>lua require('spectre').open_file_search()<CR>", "Search on current file" },
        }
    )

    lvim.builtin.which_key.mappings["a"] = {
        name = "Application",
        m = { "<cmd>MarkdownPreviewToggle<CR>", "Markdown" },
        o = { "<CMD>SymbolsOutline<CR>", "Outline" },
        r = { "<CMD>RnvimrToggle<CR>", "Rnvimr" },
        s = { "<CMD>SidebarNvimToggle<CR>", "Sidebar" },
        u = { "<CMD>UndotreeToggle<CR>", "UndoTree" },
    }
end

return M
