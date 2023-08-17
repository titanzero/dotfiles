return {
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
      { "<leader>ld", "<cmd>Telescope lsp_document_diagnostics<cr>", desc = "Document Diagnostics" },
      { "<leader>lw", "<cmd>Telescope lsp_workspace_diagnostics<cr>", desc = "Workspace Diagnostics" },
      { "<leader>li", "<cmd>LspInfo<cr>", desc = "Info" },
      { "<leader>lI", "<cmd>LspInstallInfo<cr>", desc = "Installer Info" },
      { "<leader>lj", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", desc = "Next Diagnostic" },
      { "<leader>lk", "<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>", desc = "Prev Diagnostic" },
      { "<leader>ll", "<cmd>lua vim.lsp.codelens.run()<cr>", desc = "CodeLens Action" },
      { "<leader>lq", "<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>", desc = "Quickfix" },
      { "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", desc = "Rename" },
      { "<leader>ls", "<cmd>Telescope lsp_document_symbols<cr>", desc = "Document Symbols" },
      { "<leader>lS", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", desc = "Workspace Symbols" },
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
      -- ===== Early setup NeoDev
      require("neodev").setup({})

      require("zero.utils.lspattach")(function(client, buffer)
        require("zero.config.lsp.keymaps")(client, buffer)
      end)

      for name, icon in pairs(require("zero.utils.icond")) do
        name = "DiagnosticsSign" .. name:sub(1, 1):upper() .. name:sub(2)
        vim.fn.sign_define(name, { text = icon, texthl = name, numhl = "" })
      end

      vim.diagnostic.config({
        signs = {
          severity = {
            min = vim.diagnostic.severity.WARN,
          },
        },
        virtual_text = {
          spacing = 2,
          source = "if_many",
          prefix = "●",
          severity = {
            min = vim.diagnostic.severity.WARN,
          },
        },
        virtual_lines = false,
        update_in_insert = true,
        underline = true,
        severity_sort = true,
        float = {
          focusable = false,
          style = "minimal",
          border = "rounded",
          source = "always",
          header = "",
          prefix = "",
        },
      })

      local handlers = require("zero.config.lsp.handlers")
      local servers = require("zero.config.lsp.servers")
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
          handlers = vim.deepcopy(handlers),
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
}
