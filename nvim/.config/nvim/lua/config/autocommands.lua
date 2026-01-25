-- Remove trailing whitespaces on write
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = {"*"},
  -- callback = function()
  --   local save_cursor = vim.fn.getpos(".")
  --   pcall(function() vim.cmd [[%s/\s\+$//e]] end)
  --   vim.fn.setpos(".", save_cursor)
  -- end,
  callback = function()
    require("mini.trailspace").trim()
  end,
})

-- Autoclean command line
-- vim.api.nvim_create_autocmd("CmdlineLeave", {
--     pattern = ":",
--     command = "mode"
-- })
