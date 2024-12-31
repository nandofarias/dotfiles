local function open_app(appName, appPath)
  return function()
    local app = hs.application.get(appName)
    if app ~= nil and app:isFrontmost() then
      app:hide()
    else
      hs.application.launchOrFocus(appPath)
    end
  end
end

hs.hotkey.bind({ "command" }, ".", open_app("Ghostty", "/Applications/Ghostty.app"))
hs.hotkey.bind({ "command", "ctrl", "alt" }, "4", open_app("Arc", "/Applications/Arc.app"))
hs.hotkey.bind({ "command", "ctrl", "alt" }, "5", open_app("Dash", "/Applications/Dash.app"))
hs.hotkey.bind({ "command", "ctrl", "alt" }, "6", open_app("Slack", "/Applications/Slack.app"))
hs.hotkey.bind({ "command", "ctrl", "alt" }, "7", open_app("WhatsApp", "/Applications/WhatsApp.app"))
