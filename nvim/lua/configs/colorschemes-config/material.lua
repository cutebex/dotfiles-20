local status_ok, material = pcall(require, "material")
if not status_ok then
	return
end

material.setup({

})

	vim.cmd([[
	  colorscheme material
	  " highlight CursorLine guibg=#232831 ctermbg=234
	]])
