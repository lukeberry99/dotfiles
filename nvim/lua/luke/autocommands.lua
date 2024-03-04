local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
	group = highlight_group,
	pattern = "*",
})

-- Automatically close NvimTree if it's the last buffer on window
vim.api.nvim_create_autocmd("QuitPre", {
	callback = function()
		local invalid_win = {}
		local wins = vim.api.nvim_list_wins()
		for _, w in ipairs(wins) do
			local bufname = vim.api.nvim_buf_get_name(vim.api.nvim_win_get_buf(w))
			if bufname:match("NvimTree_") ~= nil then
				table.insert(invalid_win, w)
			end
		end
		if #invalid_win == #wins - 1 then
			-- Should quit, so we close all invalid windows.
			for _, w in ipairs(invalid_win) do
				vim.api.nvim_win_close(w, true)
			end
		end
	end,
})

-- These commands should only be applied to files in ~/journal directory
vim.cmd([[
augroup JournalGroup
    autocmd!
    autocmd BufReadPre,BufReadPost ~/journal/* lua ApplyJournalCommands()
augroup END
]])

function ApplyJournalCommands()
	-- insert fancy signifiers with abbrevs
	vim.cmd([[iabbrev todo ·]])
	vim.cmd([[iabbrev done ×]])

	-- select the task list and hit `gq` to sort and group by status
	vim.opt_local.formatprg = "sort -V"

	-- syntax highlighting
	vim.cmd([[
    setfiletype journal
    syntax match JournalAll /.*/
    syntax match JournalDone /^×.*/
    syntax match JournalTodo /^·.*/
    syntax match JournalEvent /^o.*/
    syntax match JournalNote /^- .*/
    syntax match JournalMoved /^>.*/
    syntax match JournalHeader /^\<\u\+\>.*/
    highlight JournalAll ctermfg=12
    highlight JournalDone ctermfg=12
    highlight JournalHeader ctermfg=12
    highlight JournalEvent ctermfg=6
    highlight JournalMoved ctermfg=5
    highlight JournalNote ctermfg=3
    highlight VertSplit ctermfg=0 ctermbg=0
  ]])

	-- Hide UI Elements
	vim.cmd([[
    set laststatus=0
    set noruler nonumber nocursorline nocursorcolumn norelativenumber
    set scrollbind
  ]])

	-- syntax highlighting turned on
	vim.cmd("syntax on")
end
