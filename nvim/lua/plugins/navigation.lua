return {
  {
    "stevearc/oil.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
      {
        "<leader>e",
        function()
          local markers = { ".git", "package.json", "pyproject.toml", "Cargo.toml", "go.mod" }
          local found = vim.fs.find(markers, { upward = true, path = vim.api.nvim_buf_get_name(0) })
          require("oil").open(found[1] and vim.fs.dirname(found[1]) or vim.uv.cwd())
        end,
        desc = "Explorer root",
      },
      {
        "<leader>E",
        function()
          require("oil").open(vim.uv.cwd())
        end,
        desc = "Explorer cwd",
      },
    },
    opts = {},
  },
  {
    "akinsho/bufferline.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event = "VeryLazy",
    keys = {
      { "<leader>bp", "<cmd>BufferLineTogglePin<cr>", desc = "Toggle buffer pin" },
      { "<leader>bj", "<cmd>BufferLinePick<cr>", desc = "Pick buffer" },
    },
    opts = {},
  },
}
