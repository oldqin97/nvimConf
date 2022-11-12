local status, surround = pcall(require, "nvim-surround")
if not status then
  return
end

surround.setup({})

-- kylechui/nvim-surround

-- 默认： {
--     ["a"] = ">",
--     ["b"] = ")",
--     ["B"] = "}",
--     ["r"] = "]",
--     ["q"] = { '"', "'", "`" },
--     ["s"] = { ")", "]", "}", ">", "'", '"', "`" },
-- }
