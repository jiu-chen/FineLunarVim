require("user.neovim").config()

require("user.treesitter").config()
require("user.lsp").config()

require("user.plugins").config()
require("user.keybindings").config()
require("user.dap")
require("user.copilot")


lvim.colorscheme = "everforest"
lvim.format_on_save.enabled = true

lvim.builtin.terminal.active = true
-- lvim.builtin.terminal.direction = "vertical"
-- lvim.builtin.terminal.size = 60
lvim.builtin.terminal.direction = "horizontal"
lvim.builtin.terminal.size = 15

lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "startify"
