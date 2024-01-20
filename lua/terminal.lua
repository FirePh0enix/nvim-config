--
-- Terminal
--

term_win = -1
term_buf = -1

term_max_width = 120
term_max_height = 40

function open_window(buf)
	local ui = vim.api.nvim_list_uis()[1]
	term_win = vim.api.nvim_open_win(term_buf, true, {
		width = term_max_width,
		height = term_max_height,
		relative = "editor",
		col = ui.width / 2 - term_max_width / 2,
		row = ui.height / 2 - term_max_height / 2,
		border = 'rounded',
	})
end

function toggle_terminal()
	if term_win == -1 then
		if term_buf == -1 then
			term_buf = vim.api.nvim_create_buf(false, false)
			open_window()
			--vim.api.nvim_open_term(term_buf, {})
			vim.cmd('terminal')
		else
			open_window()
		end
	else
		vim.api.nvim_set_current_win(term_win)
		vim.api.nvim_set_current_buf(term_buf)
		vim.api.nvim_win_hide(term_win)
		term_win = -1
	end
end

function relaunch_terminal()
	if term_win == -1 then
		toggle_terminal()
		vim.cmd('close')
		term_win = -1
		term_buf = -1
		toggle_terminal()
	else
		vim.api.nvim_set_current_win(term_win)
		vim.api.nvim_set_current_buf(term_buf)
		vim.cmd('close')
		term_win = -1
		term_buf = -1
		toggle_terminal()
	end
end

vim.keymap.set('n', '<leader>t', toggle_terminal, { silent = true })
vim.keymap.set('n', '<leader>rt', relaunch_terminal, { silent = true })
vim.keymap.set('t', '<Esc>', '<C-\\><C-N>', { silent = true })

