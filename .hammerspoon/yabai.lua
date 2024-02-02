local function yabai(commands)
  for _, cmd in ipairs(commands) do
    os.execute("/opt/homebrew/bin/yabai -m " .. cmd)
  end
end

local function cmd(key, commands)
  hs.hotkey.bind({ "alt" }, key, function()
    yabai(commands)
  end)
end

-- alpha
cmd("f", { "window --toggle zoom-fullscreen" })
cmd("r", { "space --focus recent" })
cmd("m", { "space --toggle mission-control" })
cmd("p", { "window --toggle pip" })
cmd("g", { "space --toggle padding", "space --toggle gap" })
cmd("t", { "window --toggle float", "window --grid 4:4:1:1:2:2" })

-- special characters
cmd("'", { "space --layout stack" })
cmd(";", { "space --layout bsp" })
cmd("tab", { "space --focus recent" })

local function altShift(key, commands)
  hs.hotkey.bind({ "alt", "shift" }, key, function()
    yabai(commands)
  end)
end

local function altShiftNumber(number)
  altShift(number, { "window --space " .. number, "space --focus " .. number })
end

for i = 1, 9 do
  local num = tostring(i)
  cmd(num, { "space --focus " .. num })
  altShiftNumber(num)
end

local homeRow = { h = "west", j = "south", k = "north", l = "east" }

for key, direction in pairs(homeRow) do
  cmd(key, { "window --focus " .. direction })
  altShift(key, { "window --swap " .. direction })
end
