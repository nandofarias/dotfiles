local wezterm = require 'wezterm';

return {
  font = wezterm.font("FiraCode Nerd Font"),
  font_size = 14,
  line_height = 1.2,

  window_decorations = "RESIZE",
  window_close_confirmation = "NeverPrompt",
  window_background_opacity = 0.8,

  color_scheme = "Dracula PRO (Van Helsing)",
  color_schemes = {
    ["Dracula PRO (Van Helsing)"] = {
      foreground = "#f8f8f2",
      background = "#0b0d0f",
      cursor_bg = "#f8f8f2",
      cursor_fg = "#0b0d0f",
      cursor_border = "#f8f8f2",
      selection_fg = "#0b0d0f",
      selection_bg = "#414d58",
      scrollbar_thumb = "#414d58",
      split = "#9580ff",
      ansi = {"#0b0d0f", "#ff9580", "#8aff80", "#ffff80", "#9580ff", "#ff80bf", "#80ffea", "#f8f8f2"},
      brights = {"#0b0d0f", "#ffaa99", "#a2ff99", "#ffff99", "#aa99ff", "#ff99cc", "#99ffee", "#ffffff"},
      indexed = {
          [136] = "#414d58"
      },
      compose_cursor = "#ff9580",
      tab_bar = {
          background = "#0b0d0f", active_tab = {
              bg_color = "#708ca9",
              fg_color = "#f8f8f2",
              intensity = "Normal",
              underline = "None",
              italic = false,
              strikethrough = false
          },
          inactive_tab = {
              bg_color = "#414d58",
              fg_color = "#f8f8f2"
          },
          inactive_tab_hover = {
              bg_color = "#708ca9",
              fg_color = "#f8f8f2",
              italic = true
          },
          new_tab = {
              bg_color = "#0b0d0f",
              fg_color = "#f8f8f2"
          },
          new_tab_hover = {
              bg_color = "#ff80bf",
              fg_color = "#f8f8f2",
              italic = true
          }
      }
    }
  },

  keys = {
    {key="d", mods="CMD", action=wezterm.action{SendString="\x02\x76"}},
    {key="d", mods="CMD|SHIFT", action=wezterm.action{SendString="\x02\x73"}},
    {key="t", mods="CMD", action=wezterm.action{SendString="\x02\x63"}},
    {key="w", mods="CMD", action=wezterm.action{SendString="\x02\x78"}},

    {key="[", mods="CMD|SHIFT", action=wezterm.action{SendString="\x02\x70"}},
    {key="]", mods="CMD|SHIFT", action=wezterm.action{SendString="\x02\x6e"}},

    {key="`", mods="CTRL", action=wezterm.action{SendString="\x02\x7a"}},

    {key="[", mods="CTRL", action=wezterm.action{SendString="\x02\x5b"}},

    {key="h", mods="CMD|SHIFT", action=wezterm.action{SendString="\x02\x3c"}},
    {key="j", mods="CMD|SHIFT", action=wezterm.action{SendString="\x02\x2d"}},
    {key="k", mods="CMD|SHIFT", action=wezterm.action{SendString="\x02\x2b"}},
    {key="l", mods="CMD|SHIFT", action=wezterm.action{SendString="\x02\x3e"}},

    {key="k", mods="CMD", action=wezterm.action{SendString="\x63\x6C\x65\x61\x72\x0A"}},
  },
}
