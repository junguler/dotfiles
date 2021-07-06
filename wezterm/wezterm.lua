local wezterm = require 'wezterm';
return {
  default_prog = {"/bin/zsh", "-l"},
  font_size = 11.0,
  line_height = 0.9,
  bold_brightens_ansi_colors = false,
  check_for_updates = false,
  show_update_window = false,
  pane_focus_follows_mouse = true,
  window_close_confirmation = "NeverPrompt",
  -- disable_default_key_bindings = true,
  -- disable_default_mouse_bindings = true,
  hide_tab_bar_if_only_one_tab = true,
  default_cursor_style = "SteadyBar",
  color_scheme = "MaterialDarker", -- "SpaceGray Eighties"
  window_padding = {
    left = 6,
    right = 6,
  },
  colors = {
      foreground = "#B9B9B9",
      background = "#1E1E1E",
    },
  keys = {
    {key="v", mods="ALT",
      action=wezterm.action{SplitHorizontal={domain="CurrentPaneDomain"}}},
    {key="h", mods="ALT",
      action=wezterm.action{SplitVertical={domain="CurrentPaneDomain"}}},
    {key="w", mods="ALT",
     action=wezterm.action{CloseCurrentPane={confirm=false}}},
    {key="v", mods="CTRL", action="Paste"},
  },
  font_rules = {
    {
      italic = false,
      bold = false,
      font = wezterm.font("Cascadia Mono PL"),
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
