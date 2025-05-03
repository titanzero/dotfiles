return {
	"hrsh7th/nvim-cmp",
	enabled = false,
	dependencies = {
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
	},
	lazy = true,
	event = "InsertEnter",
	opts = function()
		local cmp = require("cmp")

		---@type cmp.ConfigSchema
		return {
			window = {
				completion = {
					border = "rounded",
					scrollbar = true,
				},
				documentation = {
					border = "rounded",
					scrollbar = "║",
				},
			},
			completion = {
				completeopt = "menu,menuone,noinsert,noselect",
			},
			sources = {
				{ name = "buffer" },
				{ name = "path" },
			},
--			formatting = {
--				fields = { "kind", "abbr", "menu" },
--				format = function(entry, item)
--					local menu_icon = {
--						nvim_lsp = "λ",
--						luasnip = "⋗",
--						buffer = "Ω",
--						path = "/",
--					}
--
--					item.menu = menu_icon[entry.source.name]
--					return item
--				end,
--			},
			mapping = {
				["<C-Space>"] = cmp.mapping.complete(),
				["<Down>"] = cmp.mapping(cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }), { "i" }),
				["<Up>"] = cmp.mapping(cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }), { "i" }),
				["<Tab>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
				["<S-Tab>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
				["<CR>"] = cmp.mapping({
					i = function(fallback)
						if cmp.visible() and cmp.get_active_entry() then
							cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })
						else
							fallback()
						end
					end,
				}),
				["<Esc>"] = cmp.mapping(function(fallback)
					--require("luasnip").unlink_current()
					fallback()
				end),
			},
		}
	end,
}
