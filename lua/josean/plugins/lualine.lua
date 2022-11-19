-- import lualine plugin safely
local status, lualine = pcall(require, "lualine")
if not status then
  return
end

-- configure lualine with modified theme
lualine.setup({
  options = {
    -- theme = "edge",
    theme = "horizon",

    -- 分割线
    component_separators = {
      left = "|",
      right = "|",
    },
    section_separators = {
      left = "",
      right = "",
    },
    globalstatus = true,
  },
  extensions = { "nvim-tree" },
  sections = {
    lualine_c = {
      "filename",
    },
    lualine_x = {
      "filesize",
      "encoding",
      "filetype",
    },
  },
})
