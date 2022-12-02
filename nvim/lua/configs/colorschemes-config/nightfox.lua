local status_ok, nightfox = pcall(require, "nightfox")
if status_ok then
	nightfox.setup({
		options = {
			terminal_colors = true,
			transparent = true,
			styles = {
				comments = "italic",
				keywords = "bold",
				-- conditionals = "italic",
				types = "italic,bold",
			},
		},
		palettes = {
			-- Everything defined under `all` will be applied to each style.
			all = {
				-- Each palette defines these colors:
				--   black, red, green, yellow, blue, magenta, cyan, white, orange, pink
				--
				-- These colors have 3 shades: base, bright, and dim
				--
				-- Defining just a color defines it's base color
				red = "#ec4093",
			},
		},

		specs = {
			all = {
				diag_bg = {
					error = "#252D38",
					warn = "#252D38",
					info = "#252D38",
					hint = "#252D38",
					-- warn = "yellow.base",
					-- info = "blue.base",
					-- hint = "orange.base",
				},
				diag = {
					error = "red.base",
					warn = "yellow.base",
					info = "blue.base",
					hint = "orange.base",
				},
				syntax = {
					-- Specs allow you to define a value using either a color or template. If the string does
					-- start with `#` the string will be used as the path of the palette table. Defining just
					-- a color uses the base version of that color.
					keyword = "magenta.base",
					builtin0 = "#ff784e", -- Builtin variable

					const = "#7dcfff",
					-- Adding either `.bright` or `.dim` will change the value
					conditional = "#CCA2FA",
					-- conditional = "#ff784e",
					number = "white",
				},
				git = {
					-- A color define can also be used
					changed = "#ff784e",
				},
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
