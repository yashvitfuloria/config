return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "master",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
    },
    opts = {
      parser_install_dir = vim.fn.stdpath("data") .. "/treesitter",
      ensure_installed = {
        "bash",
        "c",
        "cpp",
        "css",
        "html",
        "javascript",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "nix",
        "python",
        "query",
        "rust",
        "tsx",
        "toml",
        "typescript",
        "vim",
        "vimdoc",
        "yaml",
      },
      highlight = { enable = true },
      indent = { enable = true },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-Space>",
          node_incremental = "<C-Space>",
          node_decremental = "<bs>",
        },
      },
      textobjects = {
        select = {
          enable = true,
          lookahead = true,
          keymaps = {
            af = "@function.outer",
            ["if"] = "@function.inner",
          },
        },
      },
    },
    config = function(_, opts)
      local parser_dir = vim.fn.stdpath("data") .. "/treesitter"
      local bundled_parser_dir = vim.fn.stdpath("data") .. "/lazy/nvim-treesitter"

      vim.opt.runtimepath:prepend(bundled_parser_dir)
      vim.opt.runtimepath:prepend(parser_dir)

      require("nvim-treesitter.configs").setup(opts)
    end,
  },
}
