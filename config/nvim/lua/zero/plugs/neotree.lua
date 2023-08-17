return {
  ---@type LazyPluginSpec
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    },
    cmd = "Neotree",
    keys = {
      {
        "<leader>e",
        function()
          require("neo-tree.command").execute({
            toggle = true,
            position = "float",
            dir = require("zero.utils.root")(),
          })
        end,
        desc = "Explorer float (root-dir)",
        remap = true,
      },
      {
        "<leader>E",
        function()
          require("neo-tree.command").execute({
            toggle = true,
            position = "left",
            dir = require("zero.utils.root")(),
          })
        end,
        desc = "Explorer (root-dir)",
        remap = true,
      },
    },
    opts = {
      hide_root_node = true,
      close_if_last_window = true,
      popup_border_style = "rounded",
      follow_current_file = true,
      source_selector = {
        winbar = false, -- toggle to show selector on winbar
        content_layout = "center",
        tabs_layout = "equal",
        show_separator_on_edge = true,
        sources = {
          { source = "filesystem" },
          { source = "buffers" },
          { source = "git_status" },
        },
      },
      default_component_configs = {
        indent = {
          indent_size = 2,
          padding = 1, -- extra padding on left hand side
          with_markers = true,
          indent_marker = "│",
          last_indent_marker = "└",
          with_expanders = true, -- if nil and file nesting is enabled, will enable expanders
          expander_collapsed = "",
          expander_expanded = "",
          expander_highlight = "NeoTreeExpander",
        },
        -- git_status = { symbols = icons.git },
        diagnostics = { symbols = require("zero.utils.icond") },
      },
      window = {
        popup = {
          size = {
            height = "50%",
            width = "60%",
          },
          position = "50%",
        },
      },
    },
    init = function()
      vim.g.neo_tree_remove_legacy_commands = 1
      if vim.fn.argc() == 1 then
        ---@diagnostic disable-next-line: param-type-mismatch
        local stat = vim.loop.fs_stat(vim.fn.argv(0))
        if stat and stat.type == "directory" then
          require("neo-tree")
        end
      end
    end,
  },
}
