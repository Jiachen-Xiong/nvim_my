-- 全局选项，在 lazy.nvim 启动前加载。
-- LazyVim 默认值：https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua

-- Windows：curl 从该目录读取配置（curl/.curlrc 关闭 Schannel 证书吊销检查）。
if vim.fn.has("win32") == 1 then
  vim.env.CURL_HOME = vim.fs.joinpath(vim.fn.stdpath("config"), "curl")
end

-- Linux/WSL：~/.local/bin 中的命令行工具（ripgrep、fd）。
if vim.fn.has("win32") == 0 then
  local bindir = vim.fs.joinpath(vim.fn.expand("~"), ".local", "bin")
  if vim.uv.fs_stat(bindir) and not (vim.env.PATH or ""):find(bindir, 1, true) then
    vim.env.PATH = bindir .. ":" .. (vim.env.PATH or "")
  end
end

-- 80 列竖线。
vim.opt.colorcolumn = "80"

-- 4 空格缩进。
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4

-- 文件编码识别顺序：UTF-8、GBK、GB18030（Keil/MDK 工程源码）。
vim.opt.fileencodings = "ucs-bom,utf-8,gbk,gb18030,latin1"
