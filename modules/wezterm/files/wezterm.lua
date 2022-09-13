local wezterm = require 'wezterm'
local mux = wezterm.mux

wezterm.on('gui-startup', function(window)
  local tab, pane, window = mux.spawn_window(cmd or {})
  local gui_window = window:gui_window();
  gui_window:perform_action(wezterm.action.ToggleFullScreen, pane)
end)
return {
  font = wezterm.font("FiraCode Nerd Font"),
  color_scheme = "Gruvbox Dark",
  font_size = 15,
  native_macos_fullscreen_mode = true
}
