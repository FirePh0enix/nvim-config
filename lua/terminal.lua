--
-- "Toggle" terminal
--

term_buffer = -1

function toggle_terminal()
	if term_buffer == -1 then
		vim.cmd('set splitright')
		vim.cmd('vsplit | terminal')
		term_buffer = vim.api.nvim_get_current_buf()
	else
		vim.cmd('close')
		term_buffer = -1
	end
end

vim.keymap.set('n', '<leader>t', toggle_terminal, { silent = true })
vim.keymap.set('t', '<Esc>', '<C-\\><C-N>', { silent = true }) -- Use <Esc> to return to normal mode
