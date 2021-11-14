local wezterm = require 'wezterm';
return {
  default_prog = {"/bin/zsh", "-l"},
  font_size = 11.0,
  line_height = 0.8, -- 0.9
  check_for_updates = false,
  show_update_window = false,
  pane_focus_follows_mouse = true,
  window_close_confirmation = "NeverPrompt",
  disable_default_key_bindings = true,
  disable_default_mouse_bindings = true,
  hide_tab_bar_if_only_one_tab = true,
  default_cursor_style = "BlinkingBar", -- "SteadyBar"
  cursor_blink_rate = 600,
  color_scheme = "MaterialDarker", -- "SpaceGray Eighties"
  bold_brightens_ansi_colors = false,
  window_padding = {
    left = 6,
    right = 6,
  },
  colors = {
      foreground = "#868686",
      background = "#1E1E1E",
    tab_bar = {
      background = "#212121",
      },
    },
  inactive_pane_hsb = {
      -- hue = 0.7,
      saturation = 0.7,
      brightness = 0.7,
  },
  keys = {
    {key="v", mods="ALT",
      action=wezterm.action{SplitHorizontal={domain="CurrentPaneDomain"}}},
    {key="h", mods="ALT",
      action=wezterm.action{SplitVertical={domain="CurrentPaneDomain"}}},
    {key="t", mods="ALT",
      action=wezterm.action{SpawnTab="CurrentPaneDomain"}},
    {key="w", mods="ALT",
     action=wezterm.action{CloseCurrentPane={confirm=false}}},
    {key="v", mods="CTRL", action="Paste"},
    {key="LeftArrow", mods="ALT", action=wezterm.action{AdjustPaneSize={"Left", 27}}},
    {key="DownArrow", mods="ALT", action=wezterm.action{AdjustPaneSize={"Down", 1}}},
    {key="UpArrow", mods="ALT", action=wezterm.action{AdjustPaneSize={"Up", 1}}},
    {key="RightArrow", mods="ALT", action=wezterm.action{AdjustPaneSize={"Right", 27}}},
  },
  font_rules = {
    {
      -- italic = false,
      -- bold = false,
      -- intensity = "Normal", -- Medium
      -- weight = "Regular",
      -- font = wezterm.font("Cascadia Mono PL"),
      font = wezterm.font("Cascadia Mono PL", {weight="Regular", italic=false, bold=false}) -- Medium
      -- font = wezterm.font("Hack"),
    }
  },
  mouse_bindings = {
    {
      event={Up={streak=1, button="Right"}},
      mods="NONE",
      action="Paste",
    },
    {
      event={Up={streak=1, button="Middle"}},
      mods="NONE",
      action=wezterm.action{CloseCurrentPane={confirm=false}},
    },
  }
}
