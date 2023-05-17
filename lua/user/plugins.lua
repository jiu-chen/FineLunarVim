local M = {}

M.config = function()
    lvim.plugins = {
        {
            "folke/trouble.nvim",
            dependencies = {
                "nvim-tree/nvim-web-devicons",
            },
            config = function()
                require("trouble").setup {
                    -- your configuration comes here
                    -- or leave it empty to use the default settings
                    -- refer to the configuration section below
                }
            end
        },
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
        {
            "windwp/nvim-spectre",
            event = "BufRead",
            config = function()
                require("spectre").setup()
            end,
        },
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
        {
            'ptzz/lf.vim',
            dependencies = {
                'voldikss/vim-floaterm',
            }
        },
        -- {
        --     'stevearc/dressing.nvim',
        --     opts = {},
        -- },
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
                -- "rcarriga/nvim-notify",
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
                require("todo-comments").setup(
                    {
                        keywords = {
                            -- TODO = { icon = " ", color = "info" },
                            TODO = { icon = " ", color = "hint" },
                        },
                    }
                )
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
        {
            'sindrets/diffview.nvim',
            dependencies = 'nvim-lua/plenary.nvim'
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
            config = function()
                require('dap-go').setup()
            end
        },
        {
            'theHamsta/nvim-dap-virtual-text',
            config = function()
                require("nvim-dap-virtual-text").setup()
            end
        },
        ---- 🔥 Copilot
        {
            "zbirenbaum/copilot.lua",
            cmd = "Copilot",
            event = "InsertEnter",
        },
        {
            "zbirenbaum/copilot-cmp",
            after = { "copilot.lua" },
            config = function()
                require("copilot_cmp").setup()
            end,
        },
        ---- 🔥 fzf
        {
            "ibhagwan/fzf-lua",
            config = function()
                require 'fzf-lua'.setup({
                    commands = {
                        actions = { ["default"] = require 'fzf-lua'.actions.ex_run_cr },
                    },
                })
            end
        },
        ---- 🔥 python
        {
            'AckslD/swenv.nvim',
        },
        {
            "mfussenegger/nvim-dap-python",
        },
        {
            "nvim-neotest/neotest",
        },
        {
            "nvim-neotest/neotest-python",
            config = function()
                require("neotest").setup({
                    adapters = {
                        require("neotest-python")({
                            -- Extra arguments for nvim-dap configuration
                            -- See https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for values
                            dap = {
                                justMyCode = false,
                                console = "integratedTerminal",
                            },
                            args = { "--log-level", "DEBUG", "--quiet" },
                            runner = "pytest",
                        })
                    }
                })
            end
        }

    }
end

return M
