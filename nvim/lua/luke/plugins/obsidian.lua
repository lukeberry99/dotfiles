return {
	"epwalsh/obsidian.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	version = "*",
	event = "VeryLazy",
	keys = {
		{
			"<Leader>on",
			":ObsidianNew ",
			desc = "Obsidian: New Note",
		},
		{
			"<Leader>oo",
			"<cmd>ObsidianOpen<cr>",
			desc = "Obsidian: Open",
		},
		{
			"<Leader>fo",
			"<cmd>ObsidianQuickSwitch<cr>",
			desc = "Obsidian: Quick Switch",
		},
		{
			"<Leader>oss",
			"<cmd>ObsidianSearch<cr>",
			desc = "Obsidian: Search",
		},
		{
			"<Leader>ott",
			"<cmd>ObsidianToday<cr>",
			desc = "Obsdiain: Today",
		},
	},
	opts = {
		note_id_func = function(title)
			-- Create note IDs in a Zettelkasten format with a timestamp and a suffix.
			-- In this case a note with the title 'My new note' will be given an ID that looks
			-- like '1657296016-my-new-note', and therefore the file name '1657296016-my-new-note.md'
			local suffix = ""
			if title ~= nil then
				-- If title is given, transform it into valid file name.
				suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
			else
				-- If title is nil, just add 4 random uppercase letters to the suffix.
				for _ = 1, 4 do
					suffix = suffix .. string.char(math.random(65, 90))
				end
			end
			return tostring(os.time()) .. "-" .. suffix
		end,
		workspaces = {
			{
				name = "personal",
				path = "~/Library/Mobile Documents/iCloud~md~obsidian/Documents/personal",
			},
			{
				name = "writing",
				path = "~/Library/Mobile Documents/iCloud~md~obsidian/Documents/writing",
			},
		},
		daily_notes = {
			-- Optional, if you want to change the date format for the ID of daily notes.
			date_format = "%Y-%m-%d",
			-- Optional, if you want to change the date format of the default alias of daily notes.
			alias_format = "%B %-d, %Y",
			-- Optional, if you want to automatically insert a template from your template directory like 'daily.md'
			template = nil,
		},
		ui = {
			enable = true,
			update_debounce = 200,
			checkboxes = {
				-- NOTE: the 'char' value has to be a single character, and the highlight groups are defined below.
				[" "] = { char = "󰄱", hl_group = "ObsidianTodo" },
				["x"] = { char = "", hl_group = "ObsidianDone" },
				[">"] = { char = "", hl_group = "ObsidianRightArrow" },
				["~"] = { char = "󰰱", hl_group = "ObsidianTilde" },
			},
			external_link_icon = { char = "", hl_group = "ObsidianExtLinkIcon" },
			reference_text = { hl_group = "ObsidianRefText" },
			highlight_text = { hl_group = "ObsidianHighlightText" },
			tags = { hl_group = "ObsidianTag" },
			hl_groups = {
				-- The options are passed directly to `vim.api.nvim_set_hl()`. See `:help nvim_set_hl`.
				ObsidianTodo = { bold = true, fg = "#f78c6c" },
				ObsidianDone = { bold = true, fg = "#89ddff" },
				ObsidianRightArrow = { bold = true, fg = "#f78c6c" },
				ObsidianTilde = { bold = true, fg = "#ff5370" },
				ObsidianRefText = { underline = true, fg = "#c792ea" },
				ObsidianExtLinkIcon = { fg = "#c792ea" },
				ObsidianTag = { italic = true, fg = "#89ddff" },
				ObsidianHighlightText = { bg = "#75662e" },
			},
		},
	},
}
