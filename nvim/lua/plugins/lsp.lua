return {
  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    keys = {
      { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" },
    },
    opts = {},
  },
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      vim.diagnostic.config({
        virtual_text = true,
        severity_sort = true,
        float = { border = "rounded" },
      })

      local mason_bin = vim.fn.stdpath("data") .. "/mason/bin"
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      local ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")

      if ok then
        capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
      end

      vim.lsp.config("lua_ls", {
        cmd = { mason_bin .. "/lua-language-server" },
        capabilities = capabilities,
        settings = {
          Lua = {
            diagnostics = { globals = { "vim" } },
            workspace = { checkThirdParty = false },
          },
        },
      })

      vim.lsp.config("clangd", {
        cmd = { mason_bin .. "/clangd" },
        capabilities = capabilities,
      })

      vim.lsp.config("rust_analyzer", {
        cmd = { mason_bin .. "/rust-analyzer" },
        capabilities = capabilities,
      })

      vim.lsp.config("taplo", {
        cmd = { mason_bin .. "/taplo", "lsp", "stdio" },
        capabilities = capabilities,
      })

      vim.lsp.config("markdown_oxide", {
        cmd = { mason_bin .. "/markdown-oxide" },
        capabilities = capabilities,
      })

      vim.lsp.config("pyright", {
        cmd = { mason_bin .. "/pyright-langserver", "--stdio" },
        capabilities = capabilities,
      })

      vim.lsp.config("ts_ls", {
        cmd = { "typescript-language-server", "--stdio" },
        capabilities = capabilities,
      })

      vim.lsp.enable({
        "lua_ls",
        "clangd",
        "rust_analyzer",
        "taplo",
        "markdown_oxide",
        "pyright",
        "ts_ls",
      })
    end,
  },
  {
    "folke/trouble.nvim",
    cmd = "Trouble",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
      { "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", desc = "Diagnostics" },
      { "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "Buffer diagnostics" },
      { "<leader>cs", "<cmd>Trouble symbols toggle<cr>", desc = "Symbols" },
      { "<leader>cS", "<cmd>Trouble lsp toggle<cr>", desc = "LSP references/definitions" },
    },
    opts = {},
  },
}
