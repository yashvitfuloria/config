return {
  {
    "ojroques/vim-oscyank",
    keys = {
      { "<leader>y", "<Plug>OSCYankOperator", mode = "n", desc = "Yank over OSC52" },
      { "<leader>y", "<Plug>OSCYankVisual", mode = "v", desc = "Yank over OSC52" },
    },
  },
  {
    "mbbill/undotree",
    cmd = "UndotreeToggle",
    keys = {
      { "<leader>u", "<cmd>UndotreeToggle<cr>", desc = "Undo tree" },
    },
  },
  {
    "folke/persistence.nvim",
    event = "BufReadPre",
    keys = {
      {
        "<leader>qs",
        function()
          require("persistence").load()
        end,
        desc = "Restore session",
      },
      {
        "<leader>ql",
        function()
          require("persistence").load({ last = true })
        end,
        desc = "Restore last session",
      },
      {
        "<leader>qS",
        function()
          require("persistence").select()
        end,
        desc = "Select session",
      },
      {
        "<leader>qd",
        function()
          require("persistence").stop()
        end,
        desc = "Do not save session",
      },
    },
    opts = {},
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = { "MunifTanjim/nui.nvim" },
    keys = {
      {
        "<leader>un",
        function()
          require("noice").cmd("dismiss")
        end,
        desc = "Dismiss notifications",
      },
    },
    opts = {},
  },
}
