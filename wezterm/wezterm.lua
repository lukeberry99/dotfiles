local k = require("utils/keys")
local wezterm = require("wezterm")
local act = wezterm.action

local config = {
	color_scheme = "Oxocarbon Dark",
	font_size = 14.0,
	audible_bell = "Disabled",
	enable_tab_bar = false,
	native_macos_fullscreen_mode = false,
	window_close_confirmation = "NeverPrompt",
	window_background_opacity = 1,
	window_decorations = "RESIZE",

	window_padding = {
		left = 5,
		right = 5,
		top = 5,
		bottom = 5,
	},

	keys = {
		k.cmd_to_tmux_prefix("1", "1"), -- first window
		k.cmd_to_tmux_prefix("2", "2"),
		k.cmd_to_tmux_prefix("3", "3"),
		k.cmd_to_tmux_prefix("4", "4"),
		k.cmd_to_tmux_prefix("5", "5"),
		k.cmd_to_tmux_prefix("6", "6"),
		k.cmd_to_tmux_prefix("7", "7"),
		k.cmd_to_tmux_prefix("8", "8"),
		k.cmd_to_tmux_prefix("9", "9"), -- last window

		k.cmd_to_tmux_prefix("'", "'"), -- last session
		k.cmd_to_tmux_prefix(";", ";"), -- last window

		k.cmd_to_tmux_prefix("g", "g"), -- lazygit
		k.cmd_to_tmux_prefix("e", "|"), -- vertical split
		k.cmd_to_tmux_prefix("E", "-"), -- horizontal split
		k.cmd_to_tmux_prefix("o", "u"), -- open url
		k.cmd_to_tmux_prefix("z", "z"), -- zoom window
		k.cmd_to_tmux_prefix("w", "x"), -- kill window
		k.cmd_to_tmux_prefix("t", "c"), -- new window
		k.cmd_to_tmux_prefix("u", "["), -- vim mode

		-- t-smart-session-picker
		{
			mods = "CMD",
			key = "k",
			action = act.Multiple({
				act.SendKey({ mods = "CTRL", key = " " }),
				act.SendKey({ key = "T" }),
			}),
		},

		-- vim - save file
		k.cmd_key(
			"s",
			act.Multiple({
				act.SendKey({ key = "\x1b" }), -- escape
				k.multiple_actions(":w"),
			})
		),
	},
}

return config
