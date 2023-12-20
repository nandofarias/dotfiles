local function week_ascii_text()
  return {
    ["Monday"] = {
      "",
      "███╗   ███╗ ██████╗ ███╗   ██╗██████╗  █████╗ ██╗   ██╗",
      "████╗ ████║██╔═══██╗████╗  ██║██╔══██╗██╔══██╗╚██╗ ██╔╝",
      "██╔████╔██║██║   ██║██╔██╗ ██║██║  ██║███████║ ╚████╔╝ ",
      "██║╚██╔╝██║██║   ██║██║╚██╗██║██║  ██║██╔══██║  ╚██╔╝  ",
      "██║ ╚═╝ ██║╚██████╔╝██║ ╚████║██████╔╝██║  ██║   ██║   ",
      "╚═╝     ╚═╝ ╚═════╝ ╚═╝  ╚═══╝╚═════╝ ╚═╝  ╚═╝   ╚═╝   ",
      "",
    },
    ["Tuesday"] = {
      "",
      "████████╗██╗   ██╗███████╗███████╗██████╗  █████╗ ██╗   ██╗",
      "╚══██╔══╝██║   ██║██╔════╝██╔════╝██╔══██╗██╔══██╗╚██╗ ██╔╝",
      "   ██║   ██║   ██║█████╗  ███████╗██║  ██║███████║ ╚████╔╝ ",
      "   ██║   ██║   ██║██╔══╝  ╚════██║██║  ██║██╔══██║  ╚██╔╝  ",
      "   ██║   ╚██████╔╝███████╗███████║██████╔╝██║  ██║   ██║   ",
      "   ╚═╝    ╚═════╝ ╚══════╝╚══════╝╚═════╝ ╚═╝  ╚═╝   ╚═╝   ",
      "",
    },
    ["Wednesday"] = {
      "",
      "██╗    ██╗███████╗██████╗ ███╗   ██╗███████╗███████╗██████╗  █████╗ ██╗   ██╗",
      "██║    ██║██╔════╝██╔══██╗████╗  ██║██╔════╝██╔════╝██╔══██╗██╔══██╗╚██╗ ██╔╝",
      "██║ █╗ ██║█████╗  ██║  ██║██╔██╗ ██║█████╗  ███████╗██║  ██║███████║ ╚████╔╝ ",
      "██║███╗██║██╔══╝  ██║  ██║██║╚██╗██║██╔══╝  ╚════██║██║  ██║██╔══██║  ╚██╔╝  ",
      "╚███╔███╔╝███████╗██████╔╝██║ ╚████║███████╗███████║██████╔╝██║  ██║   ██║   ",
      " ╚══╝╚══╝ ╚══════╝╚═════╝ ╚═╝  ╚═══╝╚══════╝╚══════╝╚═════╝ ╚═╝  ╚═╝   ╚═╝   ",
      "",
    },
    ["Thursday"] = {
      "",
      "████████╗██╗  ██╗██╗   ██╗██████╗ ███████╗██████╗  █████╗ ██╗   ██╗",
      "╚══██╔══╝██║  ██║██║   ██║██╔══██╗██╔════╝██╔══██╗██╔══██╗╚██╗ ██╔╝",
      "   ██║   ███████║██║   ██║██████╔╝███████╗██║  ██║███████║ ╚████╔╝ ",
      "   ██║   ██╔══██║██║   ██║██╔══██╗╚════██║██║  ██║██╔══██║  ╚██╔╝  ",
      "   ██║   ██║  ██║╚██████╔╝██║  ██║███████║██████╔╝██║  ██║   ██║   ",
      "   ╚═╝   ╚═╝  ╚═╝ ╚═════╝ ╚═╝  ╚═╝╚══════╝╚═════╝ ╚═╝  ╚═╝   ╚═╝   ",
      "",
    },
    ["Friday"] = {
      "",
      "███████╗██████╗ ██╗██████╗  █████╗ ██╗   ██╗",
      "██╔════╝██╔══██╗██║██╔══██╗██╔══██╗╚██╗ ██╔╝",
      "█████╗  ██████╔╝██║██║  ██║███████║ ╚████╔╝ ",
      "██╔══╝  ██╔══██╗██║██║  ██║██╔══██║  ╚██╔╝  ",
      "██║     ██║  ██║██║██████╔╝██║  ██║   ██║   ",
      "╚═╝     ╚═╝  ╚═╝╚═╝╚═════╝ ╚═╝  ╚═╝   ╚═╝   ",
      "",
    },
    ["Saturday"] = {
      "",
      "███████╗ █████╗ ████████╗██╗   ██╗██████╗ ██████╗  █████╗ ██╗   ██╗",
      "██╔════╝██╔══██╗╚══██╔══╝██║   ██║██╔══██╗██╔══██╗██╔══██╗╚██╗ ██╔╝",
      "███████╗███████║   ██║   ██║   ██║██████╔╝██║  ██║███████║ ╚████╔╝ ",
      "╚════██║██╔══██║   ██║   ██║   ██║██╔══██╗██║  ██║██╔══██║  ╚██╔╝  ",
      "███████║██║  ██║   ██║   ╚██████╔╝██║  ██║██████╔╝██║  ██║   ██║   ",
      "╚══════╝╚═╝  ╚═╝   ╚═╝    ╚═════╝ ╚═╝  ╚═╝╚═════╝ ╚═╝  ╚═╝   ╚═╝   ",
      "",
    },
    ["Sunday"] = {
      "",
      "███████╗██╗   ██╗███╗   ██╗██████╗  █████╗ ██╗   ██╗",
      "██╔════╝██║   ██║████╗  ██║██╔══██╗██╔══██╗╚██╗ ██╔╝",
      "███████╗██║   ██║██╔██╗ ██║██║  ██║███████║ ╚████╔╝ ",
      "╚════██║██║   ██║██║╚██╗██║██║  ██║██╔══██║  ╚██╔╝  ",
      "███████║╚██████╔╝██║ ╚████║██████╔╝██║  ██║   ██║   ",
      "╚══════╝ ╚═════╝ ╚═╝  ╚═══╝╚═════╝ ╚═╝  ╚═╝   ╚═╝   ",
      "",
    },
  }
end
local function week_header(concat)
  local header = {
    "                     ______________               ",
    "                    /             /|              ",
    "                   /             / |              ",
    "                  /____________ /  |              ",
    "                 | ___________ |   |              ",
    "                 ||$ nvim █   ||   |              ",
    "                 ||           ||   |              ",
    "                 ||           ||   |              ",
    "                 ||___________||   |              ",
    "                 |   _______   |  /               ",
    "                /|  (_______)  | /                ",
    "               ( |_____________|/                 ",
    "               \\                                 ",
    "            .=======================.             ",
    "            | ::::::::::::::::  ::: |             ",
    "            | ::::::::::::::[]  ::: |             ",
    "            |   -----------     ::: |             ",
    "            `-----------------------`             ",
  }
  local week = week_ascii_text()
  local daysoftheweek = { "Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday" }
  local day = daysoftheweek[os.date("*t").wday]
  local tbl = {}
  local weekday = week[day]
  table.insert(tbl, "")
  table.insert(tbl, "")
  vim.list_extend(tbl, weekday)
  vim.list_extend(tbl, header)
  table.insert(tbl, "")
  table.insert(tbl, os.date("%Y-%m-%d %H:%M:%S ") .. (concat or ""))
  table.insert(tbl, "")
  return tbl
end

return {
  'glepnir/dashboard-nvim',
  event = function()
    if vim.fn.argc() == 0 then
      return "VimEnter"
    end
  end,
  config = function()
    local stats = require("lazy").stats()
    local footer = "⚡ Neovim loaded " .. stats.count .. " plugins"
    require('dashboard').setup({
      theme = 'doom',
      config = {
        header = week_header(),
        center = {
          { icon = '   ', desc = 'Find File                      ', key = 's', action = 'Telescope find_files' },
          { icon = '   ', desc = 'Find Word                      ', key = 'g', action = 'Telescope live_grep' },
          { icon = ' 󰕲  ', desc = 'Sessions                       ', key = 't', action = 'Telescope persisted' },
          { icon = '   ', desc = 'New File                       ', key = 'n', action = 'enew' },
          { icon = '   ', desc = 'Update Plugins                 ', key = 'u', action = 'Lazy sync' },
          { icon = '   ', desc = 'Settings                       ', key = 'o', action = 'edit $MYVIMRC' },
          { icon = ' 󰅘  ', desc = 'Exit                           ', key = 'q', action = 'exit' }
        },
        footer = { footer }
      },
    })
  end
}
