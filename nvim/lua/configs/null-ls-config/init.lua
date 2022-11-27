local status_ok, null_ls = pcall(require, "null-ls")
if not status_ok then
	return
end

local formatting =  null_ls.builtins.formatting
local code_actions =  null_ls.builtins.code_actions

local sources = {
	formatting.eslint_d, 
	formatting.autopep8,
	formatting.stylua,
	-- formatting.prettier.with({ extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" } }),
	formatting.rubocop,
	-- code_actions.gitsigns, 
	code_actions.eslint_d,

}


null_ls.setup({
	sources = sources,
})
