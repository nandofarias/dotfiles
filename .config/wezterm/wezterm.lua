local wezterm = require 'wezterm';

wezterm.on('toggle-opacity', function(window, pane)
  local overrides = window:get_config_overrides() or {}
  if not overrides.window_background_opacity then
    overrides.window_background_opacity = 0.5
  else
    overrides.window_background_opacity = nil
  end
  window:set_config_overrides(overrides)
end)

return {
  font = wezterm.font("MonoLisaPlus Nerd Font"),
  font_size = 14,
  line_height = 1.2,

  window_decorations = "RESIZE",
  window_close_confirmation = "NeverPrompt",
  window_background_opacity = 0.9,

  use_fancy_tab_bar = false,
  force_reverse_video_cursor = true,
  hide_tab_bar_if_only_one_tab = true,
  adjust_window_size_when_changing_font_size = false,
  max_fps = 120,

  default_cursor_style = "SteadyBar",

  color_scheme = 'Tokyo Night Moon',

  disable_default_key_bindings = true,
  debug_key_events = true,
  scrollback_lines = 1000000,

  keys = {
    { key = "q",     mods = "CMD",       action = wezterm.action.QuitApplication },
    { key = "0",     mods = "CTRL",      action = wezterm.action.ResetFontSize },
    { key = "-",     mods = "CTRL",      action = wezterm.action.DecreaseFontSize },
    { key = "=",     mods = "CTRL",      action = wezterm.action.IncreaseFontSize },
    { key = "n",     mods = "CMD|SHIFT", action = wezterm.action.SpawnWindow },
    { key = "p",     mods = "CMD|SHIFT", action = wezterm.action.ActivateCommandPalette },
    { key = "v",     mods = "CMD",       action = wezterm.action.PasteFrom("Clipboard") },
    { key = "Copy",  mods = "NONE",      action = wezterm.action.CopyTo("Clipboard") },
    { key = "Paste", mods = "NONE",      action = wezterm.action.PasteFrom("Clipboard") },
    { key = "Enter", mods = "CMD",       action = wezterm.action.ToggleFullScreen },

    { key = "d",     mods = "CMD",       action = wezterm.action { SendString = "\x02\x76" } },
    { key = "d",     mods = "CMD|SHIFT", action = wezterm.action { SendString = "\x02\x73" } },
    { key = "t",     mods = "CMD",       action = wezterm.action { SendString = "\x02\x63" } },
    { key = "w",     mods = "CMD",       action = wezterm.action { SendString = "\x02\x78" } },
    { key = "{",     mods = "CMD|SHIFT", action = wezterm.action { SendString = "\x02\x70" } },
    { key = "}",     mods = "CMD|SHIFT", action = wezterm.action { SendString = "\x02\x6e" } },
    { key = "`",     mods = "CTRL",      action = wezterm.action { SendString = "\x02\x7a" } },
    { key = "[",     mods = "CTRL",      action = wezterm.action { SendString = "\x02\x5b" } },
    { key = "h",     mods = "CMD|SHIFT", action = wezterm.action { SendString = "\x02\x3c" } },
    { key = "j",     mods = "CMD|SHIFT", action = wezterm.action { SendString = "\x02\x2d" } },
    { key = "k",     mods = "CMD|SHIFT", action = wezterm.action { SendString = "\x02\x2b" } },
    { key = "l",     mods = "CMD|SHIFT", action = wezterm.action { SendString = "\x02\x3e" } },
    { key = "k",     mods = "CMD",       action = wezterm.action { SendString = "\x63\x6C\x65\x61\x72\x0A" } },

    { key = "b",     mods = "CMD|CTRL",     action = wezterm.action.EmitEvent "toggle-opacity" },
  },
}
