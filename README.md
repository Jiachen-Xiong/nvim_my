# Neovim 配置（Windows / WSL2）

基于 [LazyVim](https://github.com/LazyVim/LazyVim) 的个人配置。Windows 与 WSL2/Linux
共用同一个仓库，平台差异由 Lua 中的 `vim.fn.has("win32")` 判断。

## 安装

1. 安装 [Neovim](https://github.com/neovim/neovim/releases)（0.11 及以上，当前测试版本 0.12.6）。
2. 安装基础工具：`git`、`curl`、`tar`、`unzip`，以及 C 编译器（`gcc` 或 `clang`，用于编译 treesitter parser）。
3. 克隆到 Neovim 配置目录：

   Windows（PowerShell）：

   ```powershell
   git clone <repo-url> "$env:LOCALAPPDATA\nvim"
   ```

   WSL2 / Linux：

   ```bash
   git clone <repo-url> ~/.config/nvim
   ```

4. 复制全局 clang-format 风格文件：

   Windows：`copy clang-format %USERPROFILE%\.clang-format`

   WSL2 / Linux：`cp clang-format ~/.clang-format`

5. 启动 `nvim`。首次启动会自动安装插件、treesitter parser 和 mason 工具。

## 平台差异

| 项目 | Windows | WSL2 / Linux |
| --- | --- | --- |
| clangd | LLVM 安装目录（PATH） | mason 安装 |
| ripgrep / fd | 需在 PATH | `~/.local/bin`（`lua/config/options.lua` 会加入 PATH） |
| clang-format 风格 | `%USERPROFILE%\.clang-format` | `~/.clang-format` |
| curl 配置 | `curl/.curlrc`（`CURL_HOME` 指定） | 不使用 |

## 行为说明

- `<Tab>`：确认补全候选；`<Enter>`：换行。
- 保存文件时自动在末尾补一个空行。
- C/C++：4 空格缩进、第 80 列竖线、clang-format 使用仓库中的 `clang-format` 风格。
- GBK/ANSI 编码的工程文件（Keil/MDK）可正常打开和保存。
- `lazy-lock.json` 固定插件版本。

## 可选组件

- 系统剪贴板：Windows 安装 `win32yank`；WSL 安装 `wl-clipboard`（WSLg）或 `win32yank`。
- Nerd Font 字体：用于文件/图标显示。
