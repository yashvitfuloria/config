local function root()
  local markers = { ".git", "package.json", "pyproject.toml", "Cargo.toml", "go.mod" }
  local found = vim.fs.find(markers, { upward = true, path = vim.api.nvim_buf_get_name(0) })
  return found[1] and vim.fs.dirname(found[1]) or vim.uv.cwd()
end

local function grep_word(cwd)
  local builtin = require("telescope.builtin")
  local mode = vim.fn.mode()
  if mode == "v" or mode == "V" then
    vim.cmd([[normal! "vy]])
    builtin.grep_string({ search = vim.fn.getreg("v"), cwd = cwd })
  else
    builtin.grep_string({ search = vim.fn.expand("<cword>"), cwd = cwd })
  end
end

return {
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    keys = {
      {
        "<leader><space>",
        function()
          require("telescope.builtin").find_files({ cwd = root() })
        end,
        desc = "Find files",
      },
      {
        "<leader>ff",
        function()
          require("telescope.builtin").find_files({ cwd = root() })
        end,
        desc = "Find files root",
      },
      {
        "<leader>fF",
        function()
          require("telescope.builtin").find_files({ cwd = vim.uv.cwd() })
        end,
        desc = "Find files cwd",
      },
      { "<leader>fg", "<cmd>Telescope git_files<cr>", desc = "Git files" },
      { "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Recent files" },
      {
        "<leader>/",
        function()
          require("telescope.builtin").live_grep({ cwd = root() })
        end,
        desc = "Grep root",
      },
      {
        "<leader>sg",
        function()
          require("telescope.builtin").live_grep({ cwd = root() })
        end,
        desc = "Grep root",
      },
      {
        "<leader>sG",
        function()
          require("telescope.builtin").live_grep({ cwd = vim.uv.cwd() })
        end,
        desc = "Grep cwd",
      },
      {
        "<leader>sw",
        function()
          grep_word(root())
        end,
        mode = { "n", "x" },
        desc = "Search word root",
      },
      {
        "<leader>sW",
        function()
          grep_word(vim.uv.cwd())
        end,
        mode = { "n", "x" },
        desc = "Search word cwd",
      },
      { "<leader>sk", "<cmd>Telescope keymaps<cr>", desc = "Keymaps" },
      { "<leader>sh", "<cmd>Telescope help_tags<cr>", desc = "Help" },
      { "<leader>sc", "<cmd>Telescope command_history<cr>", desc = "Command history" },
      { "<leader>sC", "<cmd>Telescope commands<cr>", desc = "Commands" },
      { "<leader>,", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
      { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
      { "<leader>gS", "<cmd>Telescope git_stash<cr>", desc = "Git stash" },
      { "<leader>gs", "<cmd>Telescope git_status<cr>", desc = "Git status" },
    },
    config = function()
      local actions = require("telescope.actions")
      require("telescope").setup({
        defaults = {
          mappings = {
            i = {
              ["<C-j>"] = actions.move_selection_next,
              ["<C-k>"] = actions.move_selection_previous,
            },
          },
        },
      })
    end,
  },
}
