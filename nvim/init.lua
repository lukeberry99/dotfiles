vim.g.mapleader = " "
vim.g.do_filetype_lua = 1
vim.g.vim_json_conceal = false
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("luke.lazy")
require("luke.options")
require("luke.keymaps")
require("luke.autocmd")
