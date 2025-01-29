-- Pull in the Wezterm
local wezterm = require("wezterm")

local k = require("utils/keys")

---@type Config
---@diagnostic disable: missing-fields

-- This will hold the configuration
local config = wezterm.config_builder()

config.font = wezterm.font("MesloLGSDZ Nerd Font Mono")
config.font_size = 19
config.enable_tab_bar = false
config.window_decorations = "RESIZE"
config.color_scheme = "Catppuccin Mocha"
config.window_background_opacity = 0.8
config.macos_window_background_blur = 10
config.send_composed_key_when_left_alt_is_pressed = true
config.term = "wezterm"

return config
