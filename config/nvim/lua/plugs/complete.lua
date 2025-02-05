return {
	"iguanacucumber/magazine.nvim",
	dependencies = {
		{
			"iguanacucumber/mag-buffer",
			name = "cmp-buffer",
		},
		{
			"iguanacucumber/mag-nvim-lsp",
			name = "cmp-nvim-lsp",
		},
		"saadparwaiz1/cmp_luasnip",
		"https://codeberg.org/FelipeLema/cmp-async-path",
	},
	name = "nvim-cmp",
	lazy = true,
	event = "InsertEnter",
	opts = function()
		local cmp = require("cmp")
		local icons = require("utils.icons").kinds

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
			formatting = {
				fields = { "kind", "abbr", "menu" },
				format = function(entry, item)
					item.kind = icons[item.kind]
					item.menu = ({
						buffer = "Buffer",
						path = "Path",
					})[entry.source.name]

					return item
				end,
			},
			---@type cmp.SourceConfig[]
			sources = {
				{
					name = "nvim_lsp",
				},
				{
					name = "nvim_lua",
				},
				{
					name = "lazydev",
				},
				{
					name = "luasnip",
				},
				-- async path
				{
					name = "async_path",
					option = {
						traling_slash = true,
					},
				},
				{
					name = "buffer",
				},
			},
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
					require("luasnip").unlink_current()
					fallback()
				end),
			},
		}
	end,
}
