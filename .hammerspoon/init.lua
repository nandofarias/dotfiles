 hs.hotkey.bind({"command"}, ";", function()
  local app = hs.application.get('Alacritty')
  if app ~= nil and app:isFrontmost() then
    app:hide()
  else
    hs.application.launchOrFocus("/Applications/Alacritty.app")
  end
end)

hs.hotkey.bind({"command"}, ".", function()
  local app = hs.application.get('kitty')
  if app ~= nil and app:isFrontmost() then
    app:hide()
  else
    app = hs.application.launchOrFocus("/Applications/Kitty.app")
    local win = hs.window.focusedWindow()
    local screen = win:screen()

    win:centerOnScreen(screen, true, 0)
  end
end)

