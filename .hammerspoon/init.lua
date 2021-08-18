 hs.hotkey.bind({"command"}, ";", function()
  app = hs.application.get('Alacritty')
  if app ~= nil and app:isFrontmost() then
    app:hide()
  else
    hs.application.launchOrFocus("/Applications/Alacritty.app")
  end
end)

