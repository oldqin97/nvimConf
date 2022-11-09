
local status, db = pcall(require, "dashboard")
if not status then
  vim.notify("没有找到 dashboard")
  return
end

db.custom_footer = {
  "",
  "",
  " -> The best way to explain it is to do it",
}

db.custom_center = {
  {
    icon = "    ",
    desc = "  Projects                            ",
    action = "  Telescope projects",
  },
  {
    icon = "    ",
    desc = "  Recently files                      ",
    action = "  Telescope oldfiles",
  },
  {
    icon = "    ",
    desc = "  Edit Projects                       ",
    action = "  edit ~/.local/share/nvim/project_nvim/project_history",
  },
}
db.custom_header = {
  [[]],
  [[          ▀████▀▄▄              ▄█ ]],
  [[            █▀    ▀▀▄▄▄▄▄    ▄▄▀▀█ ]],
  [[    ▄        █          ▀▀▀▀▄  ▄▀  ]],
  [[   ▄▀ ▀▄      ▀▄              ▀▄▀  ]],
  [[  ▄▀    █     █▀   ▄█▀▄      ▄█    ]],
  [[  ▀▄     ▀▄  █     ▀██▀     ██▄█   ]],
  [[   ▀▄    ▄▀ █   ▄██▄   ▄  ▄  ▀▀ █  ]],
  [[    █  ▄▀  █    ▀██▀    ▀▀ ▀▀  ▄▀  ]],
  [[   █   █  █      ▄▄           ▄▀   ]],
  [[]],
  [[]],
  [[]],
  [[]],
  [[]],
}