-- ~/.config/wezterm/keymaps.lua

local wezterm = require 'wezterm'

local mod = "ALT"

return {
  {
    key = "t",
    mods = mod,
    action = wezterm.action.SpawnTab "CurrentPaneDomain",
  },
  {
    key = "w",
    mods = mod,
    action = wezterm.action.CloseCurrentTab { confirm = false },
  },
  {
    key = "h",
    mods = mod,
    action = wezterm.action.ActivateTabRelative(-1),
  },
  {
    key = "l",
    mods = mod,
    action = wezterm.action.ActivateTabRelative(1),
  },
  {
    key = "1",
    mods = mod,
    action = wezterm.action.ActivateTab(0),
  },
  {
    key = "2",
    mods = mod,
    action = wezterm.action.ActivateTab(1),
  },
  {
    key = "3",
    mods = mod,
    action = wezterm.action.ActivateTab(2),
  },
  {
    key = "4",
    mods = mod,
    action = wezterm.action.ActivateTab(3),
  },
  {
    key = "5",
    mods = mod,
    action = wezterm.action.ActivateTab(4),
  },
  {
    key = "6",
    mods = mod,
    action = wezterm.action.ActivateTab(5),
  },
  {
    key = "7",
    mods = mod,
    action = wezterm.action.ActivateTab(6),
  },
  {
    key = "8",
    mods = mod,
    action = wezterm.action.ActivateTab(7),
  },
  {
    key = "9",
    mods = mod,
    action = wezterm.action.ActivateTab(-1),
  },
}

