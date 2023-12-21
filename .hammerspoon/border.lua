hs.window.highlight.ui.overlay = true
hs.window.highlight.ui.overlayColor = { 0, 0, 0, 0.001 }
hs.window.highlight.ui.frameWidth = 2
hs.window.highlight.ui.frameColor = { 0, 1, 0, 0.5 }

local highlight_running = false
hs.hotkey.bind({ "ctrl", "alt" }, "i", function()
  if not highlight_running then
    hs.window.highlight.start()
    highlight_running = true
  else
    hs.window.highlight.stop()
    highlight_running = false
  end
end)
