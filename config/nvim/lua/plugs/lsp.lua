return {
	{
		"folke/lazydev.nvim",
		ft = "lua",
		opts = {
			library = {
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
			},
		},
	},
	{
		"williamboman/mason.nvim",
		cmd = "Mason",
		config = true,
		opts = {
			ui = {
				border = "rounded",
			},
		},
	},
	{
		"neovim/nvim-lspconfig",
		branch = "master",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
		},
		keys = {
			{ "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", desc = "Code Action" },
			{ "<leader>ld", "<cmd>FzfLua lsp_document_diagnostics<cr>", desc = "Document Diagnostics" },
			{ "<leader>lw", "<cmd>FzfLua lsp_workspace_diagnostics<cr>", desc = "Workspace Diagnostics" },
			{ "<leader>li", "<cmd>LspInfo<cr>", desc = "Info" },
			{ "<leader>lI", "<cmd>LspInstallInfo<cr>", desc = "Installer Info" },
			{ "<leader>lj", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", desc = "Next Diagnostic" },
			{ "<leader>lk", "<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>", desc = "Prev Diagnostic" },
			{ "<leader>ll", "<cmd>lua vim.lsp.codelens.run()<cr>", desc = "CodeLens Action" },
			{ "<leader>lq", "<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>", desc = "Quickfix" },
			{ "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", desc = "Rename" },
			{
				"<leader>W",
				function()
					vim.lsp.buf.format({
						filter = function(client)
							-- do not use default `lua_ls` to format
							local exclude_servers = { "lua_ls" }
							return not vim.tbl_contains(exclude_servers, client.name)
						end,
						timeout_ms = 2000,
					})
					vim.cmd([[w!]])
				end,
				desc = "Format and Save",
			},
		},
		config = function()
			--require("zero.utils").lsp_attach(function(client, buffer)
			--  require("zero.configs.lsp.keymaps").attach(client, buffer)
			--  require("zero.configs.lsp.gitsigns").attach(client, buffer)
			--  require("zero.configs.lsp.navic").attach(client, buffer)
			--  require("lsp-inlayhints").on_attach(client, buffer)

			--  if client.name == "omnisharp" or client.name == "omnisharp_mono" then
			--    client.server_capabilities.semanticTokensProvider = nil
			--  end
			--end)

			for name, icon in pairs(require("utils.icons").diagnostics) do
				name = "DiagnosticsSign" .. name:sub(1, 1):upper() .. name:sub(2)
				vim.fn.sign_define(name, { text = icon, texthl = name, numhl = "" })
			end

			---@type vim.diagnostic.Opts
			vim.diagnostic.config({
				virtual_text = {
					spacing = 4,
					source = "if_many",
					prefix = "●",
				},
				virtual_lines = false,
				update_in_insert = true,
				underline = true,
				severity_sort = true,
				signs = true,
				---@type vim.diagnostic.Opts.Float
				float = {
					border = "rounded",
					format = function(diagnostic)
						return string.format(
							"%s (%s) [%s]",
							diagnostic.message,
							diagnostic.source,
							diagnostic.code or diagnostic.user_data.lsp.code
						)
					end,
				},
			})

			--local handlers = require("zero.configs.lsp.handlers")
			local servers = require("lsp.servers")
			local capabilities = vim.tbl_deep_extend(
				"force",
				{},
				vim.lsp.protocol.make_client_capabilities() or {},
				require("cmp_nvim_lsp").default_capabilities(),
				{
					textDocument = {
						foldingRange = {
							dynamicRegistration = false,
							lineFoldingOnly = true,
						},
					},
				}
			)

			local function setup(server)
				if servers[server] and servers[server].disabled then
					return
				end

				local server_opts = vim.tbl_deep_extend("force", {
					capabilities = vim.deepcopy(capabilities),
					--handlers = vim.deepcopy(handlers),
				}, servers[server] or {})

				require("lspconfig")[server].setup(server_opts)
			end

			local available = vim.tbl_keys(require("mason-lspconfig.mappings.server").lspconfig_to_package)

			local ensure_installed = {}
			for server, server_opts in pairs(servers) do
				if server_opts then
					if not vim.tbl_contains(available, server) then
						setup(server)
					else
						ensure_installed[#ensure_installed + 1] = server
					end
				end
			end

			require("mason-lspconfig").setup({ ensure_installed = ensure_installed })
			require("mason-lspconfig").setup_handlers({ setup })
		end,
	},
	{
		"jose-elias-alvarez/null-ls.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"mason.nvim",
			{
				"nvim-lua/plenary.nvim",
				lazy = true,
			},
		},
		config = function()
			local null_ls = require("null-ls")
			local formatting = null_ls.builtins.formatting
			local diagnostics = null_ls.builtins.diagnostics

			null_ls.setup({
				debug = false,
				sources = {
					formatting.stylua,
				},
			})
		end,
	},

	{
		"jay-babu/mason-null-ls.nvim",
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			ensure_installed = {
				"stylua",
			},
			automatic_setup = true,
		},
	},
	{
		"lvimuser/lsp-inlayhints.nvim",
		lazy = true,
	},
}
