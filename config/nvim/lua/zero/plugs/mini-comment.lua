return {
  {
    "echasnovski/mini.comment",
    version = "*",
    event = "InsertEnter",
    lazy = true,
    opts = {
      options = {
        pad_comments_parts = false,
      },
      mappings = {
        comment = "ccb",

        -- Toggle comment on current line
        comment_line = "ccl",

        -- Define 'comment' textobject (like `dgc` - delete whole comment block)
        textobject = "cco",
      },
    },
  },
}
