return {
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
      }
    },
    opts = {
      hide_root_node = true,
      close_if_last_window = true,
      popup_border_style = "rounded",
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
      window = {
        popup = {
          size = {
            height = "50%",
            width = "60%",
          },
          position = "50%",
        },
      }
    },
    init = function()
      vim.g.neo_tree_remove_legacy_commands = 1
      if vim.fn.argc() == 1 then
        local stat = vim.loop.fs_stat(vim.fn.argv(0))
        if stat and stat.type == "directory" then
          require("neo-tree")
        end
      end
    end,
  },
}
