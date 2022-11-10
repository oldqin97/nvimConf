-- vim.o.background = "dark"
-- vim.g.tokyonight_style = "storm" -- day / night
--
-- -- 半透明
-- vim.g.tokyonight_transparent = true
-- vim.g.tokyonight_transparent_sidebar = true
-- local colorscheme = "tokyonight"
--
-- local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
-- if not status_ok then
--   vim.notify("colorscheme: " .. colorscheme .. " 没有找到！")
--   return
-- end

require("github-theme").setup({
  transparent = true,
  theme_style = "dimmed",
  function_style = "NONE",
  comment_style = "NONE",
  variable_style = "NONE",
  keyword_style = "NONE",

  sidebars = { "qf", "vista_kind", "terminal", "packer" },

  -- Change the "hint" color to the "orange" color, and make the "error" color bright red
  colors = { hint = "orange", error = "#ff0000" },

  -- Overwrite the highlight groups
  overrides = function(c)
    return {
      htmlTag = { fg = c.red, bg = "#282c34", sp = c.hint, style = "underline" },
      DiagnosticHint = { link = "LspDiagnosticsDefaultHint" },
      -- this will remove the highlight groups
      TSField = {},
    }
  end,
})
