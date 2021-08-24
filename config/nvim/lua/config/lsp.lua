-------------------------------------------------------------------------------
--                    ~~ Nicola Leonardi's VIM Configs ~~                    --
-------------------------------------------------------------------------------

local on_attach = function(client, bufnr)
	local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
	local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

	buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

	-- Mappings.
	local opts = { noremap=true, silent=true }
	buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
	buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
	buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)

	-- Set some keybinds conditional on server capabilities
	if client.resolved_capabilities.document_formatting then
    		buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
	elseif client.resolved_capabilities.document_range_formatting then
		buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
	end

	if client.resolved_capabilities.document_highlight then
		vim.api.nvim_exec([[
			augroup lsp_document_highlight
			autocmd! * <buffer>
			autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
			autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
			augroup END
		]], false)
  	end
end

local lua_setting = {
	Lua = {
		completion = {kewordSnippet = 'Disable'},
		diagnostics = {
			enable = true,
			globals = {'use', 'vim'}
		},
		runtime = {
			version = 'LuaJIT',
			path = {'?.lua', '?/init.lua', 'lua/?.lua'}
		},
		telemetry = {
			enable = false
		},
		workspace = {
			checkThirdParty = false,
			library = vim.api.nvim_get_runtime_file('', true),
		}
	}
}

local function make_config()
	local capabilities = vim.lsp.protocol.make_client_capabilities()
	capabilities.textDocument.completion.completionItem.snippetSupport = true
	return {
		-- enable snippet support
		capabilities = capabilities,
		-- map buffer local keybindings when the language server attaches
		on_attach = on_attach,
	}
end

local function setup_servers()
	require('lspinstall').setup()

	local servers = require('lspinstall').installed_servers()

	for _, server in pairs(servers) do
		local config = make_config()

		if server == 'lua' then
			config.settings = lua_setting
		end

		require('lspconfig')[server].setup(config)
	end
end

setup_servers()

require('lspinstall').post_install_hook = function()
	setup_servers()
	vim.cmd('bufdo e')
end
