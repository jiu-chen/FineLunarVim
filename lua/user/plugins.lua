local M = {}

M.config = function()
    lvim.plugins = {
        --------------
        -- 屏幕滚动 --
        --------------
        {
            "karb94/neoscroll.nvim",
            event = "WinScrolled",
            config = function()
                require("neoscroll").setup({
                    mappings = { "<C-d>", "<C-u>", "<C-b>", "zt", "zz", "zb" },
                    respect_scrolloff = true,
                    easing_function = "quadratic",
                })
            end
        },
        --------------
        -- 光标移动 --
        --------------
        {
            "rhysd/clever-f.vim",
            keys = { "f", "F", "t", "T" },
            setup = function()
                vim.g.clever_f_ignore_case = 1
                vim.g.clever_f_smart_case = 1
            end,
        },
        {
            "phaazon/hop.nvim",
            cmd = "Hop*",
            config = function()
                require("hop").setup({})
            end,
        },
        --------------
        -- 标签跳转 --
        --------------
        {
            "ethanholz/nvim-lastplace",
            event = "BufRead",
            config = function()
                require("nvim-lastplace").setup({
                    lastplace_ignore_buftype = { "quickfix", "nofile", "help" },
                    lastplace_ignore_filetype = {
                        "gitcommit", "gitrebase", "svn", "hgcommit",
                    },
                    lastplace_open_folds = true,
                })
            end,
        },
        --------------
        -- 全文搜索 --
        --------------
        {
            "windwp/nvim-spectre",
            event = "BufRead",
            config = function()
                require("spectre").setup()
            end,
        },
        --------------
        -- 快速编辑 --
        --------------
        -- {
        -- 	"mg979/vim-visual-multi",
        -- 	keys = { "<C-n>", { "v", "<C-n>" }, "<C-S-L>", { "v", "<C-S-L>" }, "ma", { "v", "ma" } },
        -- 	setup = function()
        -- 		require("user.setup.visual-multi").setup()
        -- 	end,
        -- 	config = function()
        -- 		require("user.config.visual-multi").config()
        -- 	end,
        -- },
        --------------
        -- 语言服务 --
        --------------
        {
            "j-hui/fidget.nvim",
            event = "BufRead",
            config = function()
                require("user.config.fidget").config()
            end,
        },
        {
            "ray-x/lsp_signature.nvim",
            config = function()
                require "lsp_signature".setup()
            end,
        },
        {
            "windwp/nvim-ts-autotag",
        },
        --------------
        -- 文件操作 --
        --------------
        -- {
        --     "Pocco81/auto-save.nvim",
        --     config = function()
        --         require("auto-save").setup()
        --     end,
        -- },
        --------------
        -- 界面元素 --
        --------------
        {
            "petertriho/nvim-scrollbar",
            config = function()
                require("scrollbar").setup()
            end,
        },
        {
            "sidebar-nvim/sidebar.nvim",
            config = function()
                -- local sidebar = require("sidebar-nvim")
                -- local opts = { open = true }
                -- sidebar.setup(opts)
                require("sidebar-nvim").setup({
                    initial_width = 30,
                    section_separator = {
                        "",
                        "──────────────────────────",
                        "",
                    },
                    sections = { "files", "symbols", "todos" },
                    files = {
                        show_hidden = true,
                    },
                    todos = {
                        icon = " ",
                        ignored_paths = { "~" },  -- ignore certain paths, this will prevent huge folders like $HOME to hog Neovim with TODO searching
                        initially_closed = false, -- whether the groups should be initially closed on start. You can manually open/close groups later.
                    },
                })
            end,
        },
        {
            "simrat39/symbols-outline.nvim",
            cmd = "SymbolsOutline*",
            config = function()
                require('symbols-outline').setup()
            end,
        },
        {
            "folke/todo-comments.nvim",
            event = "BufRead",
            config = function()
                require("todo-comments").setup()
            end,
        },
        {
            "mbbill/undotree",
            cmd = { "Undotree*" },
        },
        {
            "folke/trouble.nvim",
            cmd = "TroubleToggle",
        },
        -- {
        --     "kevinhwang91/nvim-bqf",
        --     event = { "BufRead", "BufNew" },
        --     config = function()
        --         require("bqf").setup({
        --             auto_enable = true,
        --             preview = {
        --                 win_height = 12,
        --                 win_vheight = 12,
        --                 delay_syntax = 80,
        --                 border_chars = { "┃", "┃", "━", "━", "┏", "┓", "┗", "┛", "█" },
        --             },
        --             func_map = {
        --                 vsplit = "",
        --                 ptogglemode = "z,",
        --                 stoggleup = "",
        --             },
        --             filter = {
        --                 fzf = {
        --                     action_for = { ["ctrl-s"] = "split" },
        --                     extra_opts = { "--bind", "ctrl-o:toggle-all", "--prompt", "> " },
        --                 },
        --             },
        --         })
        --     end,
        -- },
        --------------
        -- 界面美化 --
        --------------
        {
            "HiPhish/nvim-ts-rainbow2",
        },
        {
            "neanias/everforest-nvim",
            config = function()
                require("everforest").setup()
            end,
        },
        --------------
        -- 其他功能 --
        --------------
        {
            "sindrets/diffview.nvim",
            event = "BufRead",
        },
        {
            "f-person/git-blame.nvim",
            event = "BufRead",
            config = function()
                vim.cmd "highlight default link gitblame SpecialComment"
                vim.g.gitblame_enabled = 1
                vim.g.gitblame_message_template = '<author> • <date>'
            end,
        },
        {
            "voldikss/vim-translator",
            cmd = { "Translate*" },
            setup = function()
                vim.g.translator_default_engines = { "bing", "youdao" }
            end,
        },
        {
            "iamcco/markdown-preview.nvim",
            run = "cd app && npm install",
            ft = "markdown",
            config = function()
                vim.g.mkdp_auto_start = 1
            end,
        },
    }
end

return M
