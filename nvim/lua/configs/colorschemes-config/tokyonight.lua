local status_ok, tokyonight = pcall(require, "tokyonight")

if not status_ok then
	return
end

tokyonight.setup({
	-- use the night style
	style = "night",
	-- disable italic for functions
	styles = {
		functions = {},
		sidebars = "normal",
	},
	sidebars = { "qf", "vista_kind", "terminal", "packer" },
	day_brightness = 1,
	-- Change the "hint" color to the "orange" color, and make the "error" color bright red
	on_colors = function(colors)
		colors.hint = colors.orange
		colors.error = "#F44336"
	end,
})
vim.cmd([[
		colorscheme tokyonight
		highlight CursorLine guibg=#252527 ctermbg=234
		highlight Cursor guifg=white guibg=yellow
		highlight iCursor guifg=white guibg=yellow
		set guicursor=n-v-c:block-Cursor
		set guicursor+=i:ver100-iCursor
		set guicursor+=n-v-c:blinkon0
		set guicursor+=i:blinkwait10
		
	]])
