-- 补全：<Tab> 确认候选项，<Enter> 插入换行。
-- friendly-snippets 已禁用；C/C++ 的 LSP snippet 补全只保留预处理器指令
--（#include / #ifdef / #define 等），其余 LSP snippet（typedef/typeof 等代码模板）过滤。
return {
  { "rafamadriz/friendly-snippets", enabled = false, optional = true },
  {
    "saghen/blink.cmp",
    opts = {
      keymap = {
        preset = "super-tab",
      },
      sources = {
        providers = {
          lsp = {
            transform_items = function(_, items)
              if not vim.tbl_contains({ "c", "cpp", "objc", "objcpp", "cuda" }, vim.bo.filetype) then
                return items
              end
              -- 预处理器指令名。
              local directives = {
                ["if"] = true,
                ["ifdef"] = true,
                ["ifndef"] = true,
                ["else"] = true,
                ["elif"] = true,
                ["endif"] = true,
                ["include"] = true,
                ["include_next"] = true,
                ["define"] = true,
                ["undef"] = true,
                ["pragma"] = true,
                ["error"] = true,
                ["warning"] = true,
                ["line"] = true,
              }
              return vim.tbl_filter(function(item)
                if item.kind ~= vim.lsp.protocol.CompletionItemKind.Snippet then
                  return true
                end
                return directives[vim.trim(item.label or "")] == true
              end, items)
            end,
          },
        },
      },
    },
  },
}
