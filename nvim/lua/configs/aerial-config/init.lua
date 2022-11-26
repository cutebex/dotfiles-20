local status_ok, Aerial = pcall(require, "aerial")
if not status_ok then
	return
end

local map = vim.api.nvim_buf_set_keymap

Aerial.setup({
	backends = { "lsp", "treesitter", "markdown" },
	layout = {
		min_width = 28,
	},
	show_guides = true,
	filter_kind = false,
	icons = {
		Array = "",
		Boolean = "⊨",
		Class = "",
		Constant = "",
		Constructor = "",
		Key = "",
		Function = "",
		Method = "ƒ",
		Namespace = "",
		Null = "NULL",
		Number = "#",
		Object = "⦿",
		Property = "",
		TypeParameter = "𝙏",
		Variable = "",
		Enum = "ℰ",
		Package = "",
		EnumMember = "",
		File = "",
		Module = "",
		Field = "",
		Interface = "ﰮ",
		String = "𝓐",
		Struct = "𝓢",
		Event = "",
		Operator = "+",
	},
	guides = {
		whitespace = "  ",
		mid_item = "├ ",
		last_item = "└ ",
		nested_top = "│ ",
	},
	on_attach = function(bufnr)
		-- Toggle the aerial window with <leader>a
		map(bufnr, "n", "<leader>a", "<cmd>AerialToggle!<CR>", {})
		-- Jump forwards/backwards with '{' and '}'
		map(bufnr, "n", "{", "<cmd>AerialPrev<CR>", {})
		map(bufnr, "n", "}", "<cmd>AerialNext<CR>", {})
		-- Jump up the tree with '[[' or ']]'
		map(bufnr, "n", "[[", "<cmd>AerialPrevUp<CR>", {})
		map(bufnr, "n", "]]", "<cmd>AerialNextUp<CR>", {})
	end,
})
