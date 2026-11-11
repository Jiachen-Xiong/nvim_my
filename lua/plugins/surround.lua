-- 环绕符号操作：gsa 添加、gsd 删除、gsr 替换、gsh 高亮、gsf/gsF 查找、gsn 调整行数。
return {
  {
    "nvim-mini/mini.surround",
    opts = {
      mappings = {
        add = "gsa",
        delete = "gsd",
        find = "gsf",
        find_left = "gsF",
        highlight = "gsh",
        replace = "gsr",
        update_n_lines = "gsn",
      },
    },
  },
}
