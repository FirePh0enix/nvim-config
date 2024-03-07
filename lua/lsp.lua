local lspconfig = require('lspconfig')
local coq = require('coq')
lspconfig.clangd.setup(coq.lsp_ensure_capabilities({}))
lspconfig.zls.setup(coq.lsp_ensure_capabilities({}))
lspconfig.pyright.setup(coq.lsp_ensure_capabilities({}))
lspconfig.svelte.setup(coq.lsp_ensure_capabilities({}))

lspconfig.gdscript.setup(coq.lsp_ensure_capabilities({
	single_file_support = false,
	cmd = { 'ncat', '127.0.0.1', '6005' },
	root_dir = vim.fs.dirname(vim.fs.find({ 'project.godot' }, { upward = true })[1]),
	filetypes = { 'gd', 'gdscript', 'gdscript3' },
}))

vim.g.coq_settings = {
	keymap = {
		recommended = false,
	},
}
vim.api.nvim_create_autocmd('LspAttach', {
	group = vim.api.nvim_create_augroup('UserLspConfig', {}),
	callback = function (ev)
		-- Code completion
		vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'
		-- Mappings
		local opts = { buffer = ev.buf }
		vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
		vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
		vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
		vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
		vim.keymap.set('n', '<C-K>', vim.lsp.buf.signature_help, opts)
		vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, opts)
		vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
		vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)
		vim.keymap.set('n', '<leader>f', function ()
			vim.lsp.buf.format({ async = true })
		end, opts)
	end
})

local signs = {
	Error = "",
	Warn = "",
	Hint = "󰛨",
	Info = "",
};
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

vim.cmd('COQnow -s')

