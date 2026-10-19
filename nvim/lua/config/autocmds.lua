local external_reload = vim.api.nvim_create_augroup("external_file_reload", { clear = true })

vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold", "CursorHoldI" }, {
  group = external_reload,
  desc = "Reload files changed outside Neovim",
  command = "if mode() != 'c' | checktime | endif",
})

vim.api.nvim_create_autocmd("FileChangedShellPost", {
  group = external_reload,
  desc = "Notify after reloading an externally changed file",
  callback = function()
    vim.notify("Reloaded file changed outside Neovim", vim.log.levels.INFO)
  end,
})
