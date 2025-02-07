-- TARGET=~/.config/wezterm/wezterm.lua
-- Pull in the Wezterm
local wezterm = require("wezterm")

local k = require("utils/keys")
local act = wezterm.action

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

config.mouse_bindings = {
	{
		event = { Down = { streak = 1, button = "Right" } },
		mods = "NONE",
		action = wezterm.action_callback(function(window, pane)
			local has_selection = window:get_selection_text_for_pane(pane) ~= ""
			if has_selection then
				window:perform_action(act.CopyTo("ClipboardAndPrimarySelection"), pane)
				window:perform_action(act.ClearSelection, pane)
			else
				window:perform_action(act({ PasteFrom = "Clipboard" }), pane)
			end
		end),
	},
}

return config
