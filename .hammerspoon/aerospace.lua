Swipe = hs.loadSpoon("Swipe")

local AEROSPACE = "/opt/homebrew/bin/aerospace"

local function aerospaceExec(cmd)
  os.execute("nohup " .. AEROSPACE .. " " .. cmd .. " &")
end

-- use three finger swipe to switch workspace
local current_id, threshold
Swipe:start(3, function(direction, distance, id)
  if id == current_id then
    if distance > threshold then
      threshold = math.huge -- only trigger once per swipe
      if direction == "left" then
        aerospaceExec("workspace --wrap-around next")
      elseif direction == "right" then
        aerospaceExec("workspace --wrap-around prev")
      end
    end
  else
    current_id = id
    threshold = 0.04 -- swipe distance > 4% of trackpad
  end
end)


hs.hotkey.bind({ "ctrl" }, "right", function() aerospaceExec("workspace --wrap-around next") end)
hs.hotkey.bind({ "ctrl" }, "left", function() aerospaceExec("workspace --wrap-around prev") end)
