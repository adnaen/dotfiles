return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		{
			"L3MON4D3/LuaSnip",
			build = (function()
				if vim.fn.has("win32") == 1 or vim.fn.executable("make") == 0 then
					return
				end
				return "make install_jsregexp"
			end)(),
			dependencies = {},
		},
		"saadparwaiz1/cmp_luasnip",

		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-path",
		-- {
		-- 	"zbirenbaum/copilot-cmp",
		-- 	event = "InsertEnter",
		-- 	config = function()
		-- 		require("copilot_cmp").setup()
		-- 	end,
		-- 	dependencies = {
		-- 		"zbirenbaum/copilot.lua",
		-- 		cmd = "Copilot",
		-- 		config = function()
		-- 			require("copilot").setup({
		-- 				suggestion = { enabled = false },
		-- 				panel = { enabled = false },
		-- 			})
		-- 		end,
		-- 	},
		-- },
	},
	config = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")
		luasnip.config.setup({})

		cmp.setup({
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			completion = { completeopt = "menu,menuone,noinsert" },

			mapping = cmp.mapping.preset.insert({
				["<C-j>"] = cmp.mapping.select_next_item(),
				["<C-k>"] = cmp.mapping.select_prev_item(),
				["<C-b>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),

				["<Tab>"] = cmp.mapping.confirm({ select = true }),

				["<C-Space>"] = cmp.mapping.complete({}),

				["<C-l>"] = cmp.mapping(function()
					if luasnip.expand_or_locally_jumpable() then
						luasnip.expand_or_jump()
					end
				end, { "i", "s" }),
				["<C-h>"] = cmp.mapping(function()
					if luasnip.locally_jumpable(-1) then
						luasnip.jump(-1)
					end
				end, { "i", "s" }),
			}),
			sources = {
				{
					name = "lazydev",
					group_index = 0,
				},
				{ name = "copilot" },
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
				{ name = "path" },
			},
		})
	end,
}
