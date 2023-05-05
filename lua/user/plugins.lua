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
                        "gitcommit",
                        "gitrebase",
                        "svn",
                        "hgcommit",
                    },
                    lastplace_open_folds = true,
                })
            end,
        },
        --------------
        -- 搜索替换 --
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
        {
            "mg979/vim-visual-multi",
        },
        {
            "tpope/vim-surround",
            -- make sure to change the value of `timeoutlen` if it's not triggering correctly, see https://github.com/tpope/vim-surround/issues/117
            -- setup = function()
            --  vim.o.timeoutlen = 500
            -- end
        },
        --------------
        -- 语言服务 --
        --------------
        --[[ {
            "j-hui/fidget.nvim",
            event = "BufRead",
            config = function()
                require "fidget".setup {}
            end,
        }, ]]
        {
            "ray-x/lsp_signature.nvim",
            config = function()
                require("lsp_signature").setup()
            end,
        },
        {
            "rmagatti/goto-preview",
            config = function()
                require("goto-preview").setup({
                    width = 120,             -- Width of the floating window
                    height = 25,             -- Height of the floating window
                    default_mappings = true, -- Bind default mappings
                    debug = false,           -- Print debug information
                    opacity = nil,           -- 0-100 opacity level of the floating window where 100 is fully transparent.
                    post_open_hook = nil,    -- A function taking two arguments, a buffer and a window to be ran as a hook.
                    -- You can use "default_mappings = true" setup option
                    -- Or explicitly set keybindings
                    -- vim.cmd("nnoremap gpd <cmd>lua require('goto-preview').goto_preview_definition()<CR>"),
                    -- vim.cmd("nnoremap gpi <cmd>lua require('goto-preview').goto_preview_implementation()<CR>"),
                    -- vim.cmd("nnoremap gP <cmd>lua require('goto-preview').close_all_win()<CR>"),
                })
            end,
        },
        --------------
        -- 文件操作 --
        --------------
        {
            "kevinhwang91/rnvimr",
            cmd = "RnvimrToggle",
            config = function()
                vim.g.rnvimr_draw_border = 1
                vim.g.rnvimr_pick_enable = 1
                vim.g.rnvimr_bw_enable = 1
            end,
        },
        --------------
        -- 界面元素 --
        --------------
        {
            "folke/noice.nvim",
            config = function()
                require("noice").setup({
                    lsp = {
                        hover = {
                            enabled = false,
                        },
                        signature = {
                            enabled = false,
                        },
                        -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
                        override = {
                            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                            ["vim.lsp.util.stylize_markdown"] = true,
                            ["cmp.entry.get_documentation"] = true,
                        },
                    },
                    -- you can enable a preset for easier configuration
                    presets = {
                        bottom_search = true,         -- use a classic bottom cmdline for search
                        command_palette = true,       -- position the cmdline and popupmenu together
                        long_message_to_split = true, -- long messages will be sent to a split
                        inc_rename = false,           -- enables an input dialog for inc-rename.nvim
                        lsp_doc_border = false,       -- add a border to hover docs and signature help
                    },
                })
            end,
            dependencies = {
                -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
                "MunifTanjim/nui.nvim",
                -- OPTIONAL:
                --   `nvim-notify` is only needed, if you want to use the notification view.
                --   If not available, we use `mini` as the fallback
                "rcarriga/nvim-notify",
            },
        },
        {
            "windwp/nvim-ts-autotag",
            config = function()
                require("nvim-ts-autotag").setup()
            end,
        },
        {
            "petertriho/nvim-scrollbar",
            config = function()
                require("scrollbar").setup()
                require("scrollbar.handlers.gitsigns").setup()
            end,
        },
        {
            "simrat39/symbols-outline.nvim",
            config = function()
                require("symbols-outline").setup()
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
            "zbirenbaum/neodim",
            event = "LspAttach",
            config = function()
                require("neodim").setup({
                    alpha = 0.75,
                    blend_color = "#000000",
                    update_in_insert = {
                        enable = true,
                        delay = 100,
                    },
                    hide = {
                        virtual_text = true,
                        signs = true,
                        underline = true,
                    },
                })
            end,
        },
        --------------
        -- 界面美化 --
        --------------
        {
            "mrjones2014/nvim-ts-rainbow",
        },
        {
            "neanias/everforest-nvim",
            config = function()
                require("everforest").setup()
            end,
        },
        ---------
        -- Git --
        ---------
        {
            "f-person/git-blame.nvim",
            event = "BufRead",
            config = function()
                vim.cmd("highlight default link gitblame SpecialComment")
                vim.g.gitblame_enabled = 1
                vim.g.gitblame_message_template = "<author> • <date>"
            end,
        },
        --------------
        -- MarkDown --
        --------------
        {
            "iamcco/markdown-preview.nvim",
            build = "cd app && npm install",
            ft = "markdown",
            config = function()
                vim.g.mkdp_auto_start = 1
            end,
        },
        ---------
        -- 其他 --
        ---------
        {
            "folke/persistence.nvim",
            event = "BufReadPre", -- this will only start session saving when an actual file was opened
            config = function()
                require("persistence").setup({
                    dir = vim.fn.expand(vim.fn.stdpath("config") .. "/session/"),
                    options = { "buffers", "curdir", "tabpages", "winsize" },
                })
            end,
        },
        {
            "chentoast/marks.nvim",
            lazy = true,
            event = { "User FileOpened" },
            config = function()
                require("marks").setup({
                    default_mappings = true,
                    -- builtin_marks = { ".", "<", ">", "^" },
                    cyclic = true,
                    force_write_shada = false,
                    refresh_interval = 250,
                    sign_priority = { lower = 10, upper = 15, builtin = 8, bookmark = 20 },
                    excluded_filetypes = {
                        "qf",
                        "NvimTree",
                        "toggleterm",
                        "TelescopePrompt",
                        "alpha",
                        "netrw",
                    },
                    bookmark_0 = {
                        sign = "",
                        virt_text = "hello world",
                        annotate = false,
                    },
                    mappings = {},
                })
            end,
        },
        -- 中英文切换 --
        {
            "lyokha/vim-xkbswitch",
        },
        ----------
        -- Go ----
        -- -------
        {
            "ray-x/go.nvim",
            dependencies = { -- optional packages
                "ray-x/guihua.lua",
                "neovim/nvim-lspconfig",
                "nvim-treesitter/nvim-treesitter",
            },
            config = function()
                require("go").setup()
            end,
            event = { "CmdlineEnter" },
            ft = { "go", 'gomod' },
            build = ':lua require("go.install").update_all_sync()' -- if you need to install/update all binaries
        },
        {
            "leoluz/nvim-dap-go",
        },
        ----------------
        {
            "LintaoAmons/scratch.nvim",
            -- tag = "v0.7.0" -- use tag for stability, or without this to have latest fixed and functions
        },
        {
            "metakirby5/codi.vim",
            cmd = "Codi",
        },
        {
            "Pocco81/auto-save.nvim",
            config = function()
                require("auto-save").setup {
                    -- your config goes here
                    -- or just leave it empty :)
                    enabled = true,          -- start auto-save when the plugin is loaded (i.e. when your package manager loads it)
                    execution_message = {
                        message = function() -- message to print on save
                            -- return ("AutoSave: saved at " .. vim.fn.strftime("%H:%M:%S"))
                            return ""
                        end,
                        dim = 0.18,                                    -- dim the color of `message`
                        cleaning_interval = 1250,                      -- (milliseconds) automatically clean MsgArea after displaying `message`. See :h MsgArea
                    },
                    trigger_events = { "InsertLeave", "TextChanged" }, -- vim events that trigger auto-save. See :h events
                    -- function that determines whether to save the current buffer or not
                    -- return true: if buffer is ok to be saved
                    -- return false: if it's not ok to be saved
                    condition = function(buf)
                        local fn = vim.fn
                        local utils = require("auto-save.utils.data")

                        if
                            fn.getbufvar(buf, "&modifiable") == 1 and
                            utils.not_in(fn.getbufvar(buf, "&filetype"), {}) then
                            return true        -- met condition(s), can save
                        end
                        return false           -- can't save
                    end,
                    write_all_buffers = false, -- write all buffers when the current one meets `condition`
                    debounce_delay = 135,      -- saves the file at most every `debounce_delay` milliseconds
                    callbacks = {
                        -- functions to be executed at different intervals
                        enabling = nil,              -- ran when enabling auto-save
                        disabling = nil,             -- ran when disabling auto-save
                        before_asserting_save = nil, -- ran before checking `condition`
                        before_saving = nil,         -- ran before doing the actual save
                        after_saving = nil           -- ran after doing the actual save
                    }
                }
            end,
        },
    }
end

return M
