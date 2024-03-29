local wezterm = require("wezterm")
local act = wezterm.action
local mux = wezterm.mux

wezterm.on("gui-startup", function(cmd)
	local tab, pane, window = mux.spawn_window(cmd or {})
	window:gui_window():maximize()
end)

-- local config = {}
-- if wezterm.config_builder then
-- 	config = wezterm.config_builder()
-- end
local config = wezterm.config_builder()

-- Color scheme
config.color_scheme = "Catppuccin Mocha"

-- Font
config.font = wezterm.font({
	family = "Space Mono Nerd Font",
	harfbuzz_features = { "calt=0", "clig=0", "liga=0" },
})
config.font_size = 11.0

-- Disable tab bar
config.enable_tab_bar = false

-- Wayland support
config.enable_wayland = true

-- Remove window padding
config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

-- Enable kitty graphics
config.enable_kitty_graphics = true

-- Borderless window
config.window_decorations = "RESIZE"

-- Window opacity
config.window_background_opacity = 0.85

-- Disable scrollbar
config.enable_scroll_bar = false

-- Disable dead keys
config.use_dead_keys = false

-- Cursor Style
config.default_cursor_style = "SteadyBar"

-- Enable cursor dynamic color change
config.force_reverse_video_cursor = true

-- Disable prompt when closing windows
config.window_close_confirmation = "NeverPrompt"

-- Keybindings
config.disable_default_key_bindings = true
config.keys = {
	-- Copy & Paste
	{ action = act.CopyTo("Clipboard"), mods = "CTRL|SHIFT", key = "C" },
	{ action = act.PasteFrom("Clipboard"), mods = "CTRL|SHIFT", key = "V" },
	-- Zoom in, zoom out & reset
	{ action = act.DecreaseFontSize, mods = "CTRL", key = "-" },
	{ action = act.IncreaseFontSize, mods = "CTRL", key = "=" },
	{ action = act.ResetFontSize, mods = "CTRL", key = "0" },
	-- Fullscreen
	{ action = act.ToggleFullScreen, key = "F11" },
	-- Close window
	{ action = act.CloseCurrentTab({ confirm = true }), mods = "CTRL|SHIFT", key = "W" },
}

return config
