local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
	return
end
lualine.setup({
	options = {
		globalstatus = true,
		theme = "tokyonight",
		always_divide_middle = true,
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "," },
	},
})
