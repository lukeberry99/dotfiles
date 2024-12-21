local wezterm = require("wezterm")
local config = wezterm.config_builder()
wezterm.log_info("Reloading...")

require("tabs").setup(config)
require("links").setup(config)
require("mouse").setup(config)

config.cursor_blink_ease_in = "Constant"
config.cursor_blink_ease_out = "Constant"

config.color_scheme_dirs = { wezterm.home_dir .. "/colors" }
config.color_scheme = "tokyonight_night"
wezterm.add_to_config_reload_watch_list(config.color_scheme_dirs[1] .. config.color_scheme .. ".toml")

config.colors = {
	indexed = { [241] = "#65bcff" },
}

config.underline_thickness = 3
config.cursor_thickness = 4
config.underline_position = -6

-- config.window_decorations = "RESIZE"

-- Fonts
config.font_size = 14
config.font = wezterm.font({ family = "FiraCode Nerd Font" })
config.bold_brightens_ansi_colors = true
config.font_rules = {
	{
		intensity = "Bold",
		italic = true,
		font = wezterm.font({ family = "Maple Mono", weight = "Bold", style = "Italic" }),
	},
	{
		italic = true,
		intensity = "Half",
		font = wezterm.font({ family = "Maple Mono", weight = "DemiBold", style = "Italic" }),
	},
	{
		italic = true,
		intensity = "Normal",
		font = wezterm.font({ family = "Maple Mono", style = "Italic" }),
	},
}

-- Cursor
config.default_cursor_style = "BlinkingBar"
config.force_reverse_video_cursor = true
config.window_padding = { left = 0, right = 0, top = 0, bottom = 0 }
config.scrollback_lines = 10000

-- Command Palette
config.command_palette_font_size = 13
config.command_palette_bg_color = "#394b70"
config.command_palette_fg_color = "#828bb8"

return config
