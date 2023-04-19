require("user.neovim").config()


require("user.treesitter").config()
require("user.lsp").config()


require("user.plugins").config()
require("user.keybindings").config()


lvim.colorscheme = "everforest"
lvim.format_on_save.enabled = true

lvim.builtin.terminal.active = true
lvim.builtin.terminal.direction = "vertical"
lvim.builtin.terminal.size = 60