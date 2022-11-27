vim.g.completeopt = "menu,menuone,noselect,noinsert"

local cmp_ok, cmp = pcall(require, "cmp")
local lspkind_ok, lspkind = pcall(require, "lspkind")

if cmp_ok and lspkind_ok then
	cmp.setup({
		snippet = {
			expand = function(args)
				vim.fn["vsnip#anonymous"](args.body)
			end,
		},
		mapping = cmp.mapping.preset.insert({
			["<C-k>"] = cmp.mapping.select_prev_item(),
			["<C-j>"] = cmp.mapping.select_next_item(),
			["<C-d>"] = cmp.mapping.scroll_docs(-4),
			["<C-f>"] = cmp.mapping.scroll_docs(4),
			["<C-Space>"] = cmp.mapping.complete(),
			["<CR>"] = cmp.mapping.confirm({
				behavior = cmp.ConfirmBehavior.Replace,
				select = true,
			}),
			["<Tab>"] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.select_next_item()
				else
					fallback()
				end
			end, { "i", "s" }),
			["<S-Tab>"] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.select_prev_item()
				else
					fallback()
				end
			end, { "i", "s" }),
		}),

		sources = {
			{ name = "vsnip" },
			{ name = "nvim_lsp" },
			{ name = "buffer" },
			{ name = "treesitter" },
			{ name = "path" },
			{ name = "spell" },
			{ name = "nvim_lua" },
		},

		formatting = {
			fields = { "kind", "abbr", "menu" },
			-- format = function(_, vim_item)
			-- 	vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
			-- 	return vim_item
			-- end,
			format = lspkind.cmp_format({
				with_text = true,
				menu = {
					buffer = "[buf]",
					treesitter = "[tree]",
					nvim_lsp = "[lsp]",
					nvim_lua = "[lua]",
					path = "[path]",
					spell = "[spell]",
					vsnip = "[snip]",
				},
			}),
		},
		duplicates = {
			nvim_lsp = 1,
			vsnip = 1,
			buffer = 1,
			path = 1,
		},
		confirm_opts = {
			behavior = cmp.ConfirmBehavior.Replace,
			select = false,
		},
		window = {
			documentation = {
				border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
			},
		},
		experimental = {
			ghost_text = true,
			native_menu = false,
		},
	})
end
