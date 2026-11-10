-- Snacks 文件浏览器（<leader>e）：<Tab> 等同于 <CR>/l，
-- 目录展开/收起，文件直接打开。
return {
  {
    "folke/snacks.nvim",
    opts = {
      picker = {
        sources = {
          explorer = {
            win = {
              list = {
                keys = {
                  ["<Tab>"] = "confirm",
                },
              },
            },
          },
        },
      },
    },
  },
}
