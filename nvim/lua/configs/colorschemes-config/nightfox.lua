local status_ok, nightfox = pcall(require, "nightfox")
if status_ok then
	nightfox.setup({
		options = {
			terminal_colors = true,
			transparent = true,
			styles = {
				comments = "italic",
				keywords = "bold",
				types = "italic,bold",
			},
		},
	})
	vim.cmd([[
		colorscheme duskfox
		highlight CursorLine guibg=#232831 ctermbg=234
		highlight Cursor guifg=white guibg=yellow
		highlight iCursor guifg=white guibg=yellow
		set guicursor=n-v-c:block-Cursor
		set guicursor+=i:ver100-iCursor
		set guicursor+=n-v-c:blinkon0
		set guicursor+=i:blinkwait10
		
	]])
end
