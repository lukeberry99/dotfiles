local wezterm = require("wezterm")
local config = wezterm.config_builder()
wezterm.log_info("Reloading...")

require("tabs").setup(config)
require("links").setup(config)
require("mouse").setup(config)

config.enable_wayland = true
config.webgpu_power_preference = "HighPerformance"

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

if wezterm.target_triple:find("windows") then
	config.default_prog = { "pwsh" }
	config.window_decorations = "RESIZE|TITLE"
	wezterm.on("gui-startup", function(cmd)
		local screen = wezterm.gui.screens().active
		local tab, pane, window = wezterm.mux.spawn_window(cmd or {})
		local gui = window:gui_window()
		local width = 0.7 * screen.width
		local height = 0.7 * screen.height
		gui:set_inner_size(width, height)
		gui:set_position((screen.width - width) / 2, (screen.height - height) / 2)
	end)
else
	config.term = "wezterm"
	config.window_decorations = "NONE"
end

-- Fonts
config.font_size = 10
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
-- window_background_opacity = 0.9,
-- cell_width = 0.9,
config.scrollback_lines = 10000

-- Command Palette
config.command_palette_font_size = 13
config.command_palette_bg_color = "#394b70"
config.command_palette_fg_color = "#828bb8"

return config
-- local k = require("utils/keys")
-- local wezterm = require("wezterm")
-- local act = wezterm.action
-- --
-- -- local appearance_themes = {
-- -- 	Light = "Rosé Pine Dawn (base16)",
-- -- 	Dark = "Rosé Pine (base16)",
-- -- }
-- --
-- -- local appearance = wezterm.gui.get_appearance()
--
-- local config = {
-- 	color_scheme = "Gruvbox Dark (Gogh)",
-- 	font_size = 10.0,
-- 	font = wezterm.font("Menlo"),
-- 	audible_bell = "Disabled",
-- 	enable_tab_bar = false,
-- 	native_macos_fullscreen_mode = false,
-- 	window_close_confirmation = "NeverPrompt",
-- 	window_background_opacity = 1,
-- 	window_decorations = "RESIZE",
--
-- 	window_padding = {
-- 		left = 0,
-- 		right = 0,
-- 		top = 0,
-- 		bottom = 0,
-- 	},
--
-- 	keys = {
-- 		k.cmd_to_tmux_prefix("1", "1"), -- first window
-- 		k.cmd_to_tmux_prefix("2", "2"),
-- 		k.cmd_to_tmux_prefix("3", "3"),
-- 		k.cmd_to_tmux_prefix("4", "4"),
-- 		k.cmd_to_tmux_prefix("5", "5"),
-- 		k.cmd_to_tmux_prefix("6", "6"),
-- 		k.cmd_to_tmux_prefix("7", "7"),
-- 		k.cmd_to_tmux_prefix("8", "8"),
-- 		k.cmd_to_tmux_prefix("9", "9"), -- last window
--
-- 		k.cmd_to_tmux_prefix("'", "'"), -- last session
-- 		k.cmd_to_tmux_prefix(";", ";"), -- last window
--
-- 		k.cmd_to_tmux_prefix("g", "g"), -- lazygit
-- 		k.cmd_to_tmux_prefix("e", "|"), -- vertical split
-- 		k.cmd_to_tmux_prefix("E", "-"), -- horizontal split
-- 		k.cmd_to_tmux_prefix("o", "u"), -- open url
-- 		k.cmd_to_tmux_prefix("z", "z"), -- zoom window
-- 		k.cmd_to_tmux_prefix("w", "x"), -- kill window
-- 		k.cmd_to_tmux_prefix("t", "c"), -- new window
-- 		k.cmd_to_tmux_prefix("u", "["), -- vim mode
--
-- 		-- t-smart-session-picker
-- 		{
-- 			mods = "CMD",
-- 			key = "k",
-- 			action = act.Multiple({
-- 				act.SendKey({ mods = "CTRL", key = " " }),
-- 				act.SendKey({ key = "T" }),
-- 			}),
-- 		},
--
-- 		-- vim - save file
-- 		k.cmd_key(
-- 			"s",
-- 			act.Multiple({
-- 				act.SendKey({ key = "\x1b" }), -- escape
-- 				k.multiple_actions(":w"),
-- 			})
-- 		),
-- 	},
-- }
--
-- return config
