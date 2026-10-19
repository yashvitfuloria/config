return {
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    keys = {
      {
        "s",
        function()
          require("flash").jump()
        end,
        mode = { "n", "x", "o" },
        desc = "Flash",
      },
      {
        "S",
        function()
          require("flash").treesitter()
        end,
        mode = { "n", "x", "o" },
        desc = "Flash treesitter",
      },
      {
        "r",
        function()
          require("flash").remote()
        end,
        mode = "o",
        desc = "Remote flash",
      },
      {
        "R",
        function()
          require("flash").treesitter_search()
        end,
        mode = { "x", "o" },
        desc = "Treesitter search",
      },
    },
    opts = {},
  },
  {
    "numToStr/Comment.nvim",
    keys = { "gc", "gcc" },
    opts = {},
  },
  {
    "MagicDuck/grug-far.nvim",
    cmd = "GrugFar",
    keys = {
      { "<leader>sr", "<cmd>GrugFar<cr>", mode = { "n", "x" }, desc = "Search and replace" },
    },
    opts = {},
  },
  {
    "stevearc/conform.nvim",
    keys = {
      {
        "<leader>cF",
        function()
          require("conform").format({ async = true, formatters = { "injected" } })
        end,
        mode = { "n", "x" },
        desc = "Format injected langs",
      },
    },
    opts = {},
  },
}
