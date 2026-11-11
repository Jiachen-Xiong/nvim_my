-- C/C++ 语言服务器（clangd）。
-- Windows：使用 LLVM 安装目录中的 clangd（PATH）。
-- Linux/WSL：clangd 由 mason 安装并管理。
-- 格式化风格来自 %USERPROFILE%\.clang-format 或 ~/.clang-format，
-- 项目内的 .clang-format 优先。
return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      -- C/C++ 不显示参数名 inlay hint（printf(format: ...)）。
      inlay_hints = {
        exclude = { "vue", "c", "cpp", "objc", "objcpp", "cuda" },
      },
      servers = {
        clangd = {
          -- Windows 使用 PATH 上的 clangd；Linux/WSL 交给 mason。
          mason = vim.fn.has("win32") == 0,
          keys = {
            { "<leader>ch", "<cmd>LspClangdSwitchSourceHeader<cr>", desc = "Switch Source/Header (C/C++)" },
          },
          cmd = {
            "clangd",
            "--background-index",
            "--clang-tidy",
            -- 不自动插入 #include（补全和代码操作都不会加头文件）。
            "--header-insertion=never",
            "--completion-style=detailed",
          },
          -- 工程根标记；.clang-format 不参与根目录判断（全局风格文件位于用户主目录）。
          root_markers = {
            ".clangd",
            "compile_commands.json",
            "compile_flags.txt",
            ".git",
          },
          init_options = {
            clangdFileStatus = true,
          },
        },
      },
    },
  },
}
