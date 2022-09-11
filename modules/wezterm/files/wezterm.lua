local wezterm = require 'wezterm'
local mux = wezterm.mux

wezterm.on('gui-startup', function(window)
  local tab, pane, window = mux.spawn_window(cmd or {})
  local gui_window = window:gui_window();
  gui_window:maximize()
end)
return {
  font = wezterm.font("FiraCode Nerd Font"),
  color_scheme = "Gruvbox Dark",
  native_macos_fullscreen_mode = true
}
