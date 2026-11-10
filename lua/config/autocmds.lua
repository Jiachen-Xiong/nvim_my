-- 附加自动命令，在 VeryLazy 时加载；LazyVim 默认自动命令保持启用。
--
-- 保存的文件以空行结尾：写入完成后，如果最后一行不是空行，则追加一个空行，
-- 并用 noautocmd 再次写入缓冲区（不触发自动命令）。
local function ensure_blank_last_line(buf)
  if not vim.api.nvim_buf_is_valid(buf) then
    return
  end
  -- 仅处理普通、可写、非二进制的文件。
  if vim.bo[buf].buftype ~= "" or vim.bo[buf].binary then
    return
  end
  if not vim.bo[buf].modifiable or vim.bo[buf].readonly then
    return
  end
  local ft = vim.bo[buf].filetype
  if ft == "gitcommit" or ft == "gitrebase" or ft == "git" then
    return
  end
  if vim.api.nvim_buf_get_name(buf) == "" then
    return
  end
  local lines = vim.api.nvim_buf_get_lines(buf, 0, -1, false)
  if #lines == 0 or lines[#lines] == "" then
    return
  end
  vim.api.nvim_buf_set_lines(buf, #lines, #lines, false, { "" })
  vim.api.nvim_buf_call(buf, function()
    pcall(vim.cmd, "silent noautocmd write")
  end)
end

vim.api.nvim_create_autocmd("BufWritePost", {
  group = vim.api.nvim_create_augroup("UserBlankLastLine", { clear = true }),
  callback = function(event)
    ensure_blank_last_line(event.buf)
  end,
})
