local M = {}

local scratch_names = {
  "scratch",
  "notes",
}

local function find_buf(name)
  for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
    if vim.api.nvim_buf_is_valid(bufnr) and vim.api.nvim_buf_get_name(bufnr):match(name .. "$") then
      return bufnr
    end
  end
end

local function open_buf(name)
  local bufnr = find_buf(name)
  if not bufnr then
    bufnr = vim.api.nvim_create_buf(true, true)
    vim.api.nvim_buf_set_name(bufnr, name)
    vim.bo[bufnr].buftype = "nofile"
    vim.bo[bufnr].bufhidden = "hide"
    vim.bo[bufnr].swapfile = false
  end
  vim.api.nvim_set_current_buf(bufnr)
end

function M.toggle()
  if vim.api.nvim_buf_get_name(0):match("scratch$") then
    vim.cmd("buffer #")
    return
  end
  open_buf("scratch")
end

function M.select()
  vim.ui.select(scratch_names, { prompt = "Scratch buffer" }, function(name)
    if name then
      open_buf(name)
    end
  end)
end

return M
