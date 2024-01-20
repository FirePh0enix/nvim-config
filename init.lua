local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({"git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath})
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = ' '

require("lazy").setup({
	{ import = "plugins" }
})

require("mason").setup()
require("mason-lspconfig").setup()

require("nvim-treesitter.configs").setup({
	ensure_installed = { "c", "lua", "zig" },
	sync_install = false,
	highlight = {
		enable = true
	},
})

require('nvim-web-devicons').setup({})

require('terminal')
require('lsp')

-- Neovim config
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.colorcolumn = "80"
vim.opt.list = true
vim.opt.listchars = 'tab:▸ ,trail:·'
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

-- Telescope
local telescope = require("telescope.builtin")
vim.keymap.set('n', '<leader>ff', telescope.find_files, {})

-- 42 Header
vim.g.user42 = 'ledelbec'
vim.g.email42 = 'ledelbec@student.42.fr'

-- Colors
require('catppuccin').setup({
	no_italic = true,
})
vim.cmd.colorscheme('catppuccin')

