-- Config
vim.g.mapleader = " "
vim.g.maplocaloeader = " "

vim.g.have_nerd_font = true

vim.opt.number = true
vim.opt.relativenumber = true

-- Need this for the obsidian plugin but I don't think I want it
vim.opt.conceallevel = 2

vim.opt.mouse = "a"

vim.opt.showmode = false

vim.opt.clipboard = "unnamedplus"

vim.opt.breakindent = true

vim.opt.undofile = true

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.signcolumn = "yes"

vim.opt.updatetime = 250
vim.opt.timeoutlen = 300

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.list = true

vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

vim.opt.inccommand = "split"

vim.opt.cursorline = true

vim.opt.scrolloff = 10

vim.opt.tabstop = 2
vim.opt.softtabstop = -1
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.hlsearch = true
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Diagnostics
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next [D]igagnostic message" })
vim.keymap.set("n", "E", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- Easier exit terminal mode
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Disable arrow keys
vim.keymap.set("n", "<left>", "")
vim.keymap.set("n", "<right>", "")
vim.keymap.set("n", "<up>", "")
vim.keymap.set("n", "<down>", "")

-- Change split focus
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the upper window" })

-- Buffers
vim.keymap.set("n", "<leader>bdd", "<cmd>bd<cr>", { desc = "[B]uffer [D]elete" })
vim.keymap.set("n", "<leader>bda", "<cmd>%bd<cr>", { desc = "[B]uffer [D]elete [A]ll" })
vim.keymap.set("n", "<leader>bdb", "<cmd>%bd|e#<cr>", { desc = "[B]uffer [D]elete [B]ut this one" })

-- Obsidian
vim.keymap.set("n", "<leader>oo", ":cd ~/Library/Mobile Documents/iCloud~md~obsidian/Documents/vault<cr>", {
	desc = "[O]bsidian [O]pen Vault",
})
vim.keymap.set("n", "<leader>on", ":ObsidianTemplate note<cr> :lua vim.cmd([[1,/^\\S/s/^\\n\\{1,}//]])<cr>", {
	desc = "[O]bsidian [N]ew Note",
})
-- strip date from note title and replace dashes with spaces
-- must have cursor on title
vim.keymap.set("n", "<leader>of", ":s/\\(# \\)[^_]*_/\\1/ | s/-/ /g<cr>", { desc = "[O]bsidian [F]ormat" })

-- move file in current buffer to zettelkasten folder
vim.keymap.set(
	"n",
	"<leader>ok",
	":!mv '%' ~/Library/Mobile\\ Documents/iCloud\\~md\\~obsidian/Documents/vault/zettelkasten<cr>:bd<cr>",
	{
		desc = "[O]bsidian [K]eep",
	}
)
-- delete file in current buffer
vim.keymap.set("n", "<leader>odd", ":!rm '%:p'<cr>:bd<cr>", { desc = "[O]bsidian [D]elete" })

-- Ugly gross
vim.g["test#strategy"] = "vimux"

-- Highlight when yanking
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking text",
	group = vim.api.nvim_create_augroup("higlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- Install lazy package manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- Plugins
require("lazy").setup({
	"tpope/vim-sleuth", -- Detect tabstop and shiftwidth automatically
	{ "numToStr/Comment.nvim", opts = {} },
	{
		"lewis6991/gitsigns.nvim",
		opts = {
			signs = {
				add = { text = "+" },
				change = { text = "~" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
			},
		},
	},
	{
		"folke/which-key.nvim", -- Show pending keybinds
		event = "VimEnter",
		config = function()
			require("which-key").setup()

			-- Document existing keychains
			require("which-key").register({
				["<leader>c"] = { name = "[C]ode", _ = "which_key_ignore" },
				["<leader>d"] = { name = "[D]ocument", _ = "which_key_ignore" },
				["<leader>r"] = { name = "[R]ename", _ = "which_key_ignore" },
				["<leader>s"] = { name = "[W]orkspace", _ = "which_key_ignore" },
			})
		end,
	},
	{
		"nvim-telescope/telescope.nvim",
		event = "VimEnter",
		branch = "0.1.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "make",
				cond = function() -- Condition used to detemrine whether this plugin should be installed and loaded
					return vim.fn.executable("make") == 1
				end,
			},
			{ "nvim-telescope/telescope-ui-select.nvim" },
			{ "nvim-tree/nvim-web-devicons", enalbed = vim.g.have_nerd_font },
		},
		config = function()
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown(),
					},
				},
			})

			pcall(require("telescope").load_extension, "fzf")
			pcall(require("telescope").load_extension, "ui-select")

			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "[S]earch [H]elp" })
			vim.keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "[S]earch [K]eymaps" })
			vim.keymap.set("n", "<leader>sf", builtin.find_files, { desc = "[S]earch [F]iles" })
			vim.keymap.set("n", "<leader>ss", builtin.builtin, { desc = "[S]earch [S]elect Telescope" })
			vim.keymap.set("n", "<leader>sw", builtin.grep_string, { desc = "[S]earch current [W]ord " })
			vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "[S]earch by [G]rep" })
			vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })
			vim.keymap.set("n", "<leader>sr", builtin.resume, { desc = "[S]earch [R]esume" })
			vim.keymap.set("n", "<leader>s.", builtin.oldfiles, { desc = "[S]earch Recent Files" })
			vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "[S]earch existing buffers" })
			-- Obsidian
			-- search for files in full vault
			vim.keymap.set("n", "<leader>os", function()
				builtin.find_files({
					search_dirs = { "~/Library/Mobile Documents/iCloud~md~obsidian/Documents/vault" },
				})
			end, {
				desc = "[O]bsidian [S]earch",
			})
			-- grep for files in full vault
			vim.keymap.set("n", "<leader>og", function()
				builtin.live_grep({
					search_dirs = { "~/Library/Mobile Documents/iCloud~md~obsidian/Documents/vault" },
				})
			end, {
				desc = "[O]bsidian [G]rep",
			})
			-- grep for files in full vault
			vim.keymap.set("n", "<leader>obl", ":ObsidianBacklinks<cr>", {
				desc = "[O]bsidian [B]ack[l]inks",
			})

			vim.keymap.set("n", "<leader>/", function()
				builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
					winblend = 10,
					previewer = false,
				}))
			end, { desc = "[/] Fuzzily search in current buffer" })

			vim.keymap.set("n", "<leader>s/", function()
				builtin.live_grep({
					grep_open_files = true,
					prompt_title = "Live Grep in Open Files",
				})
			end, { desc = "[S]earch [/] in Open Files" })

			vim.keymap.set("n", "<leader>sn", function()
				builtin.find_files({ cwd = vim.fn.stdpath("config ") })
			end, { desc = "[S]earch [N]eovim files" })
		end,
	},
	{
		"neovim/nvim-lspconfig", -- LSP
		dependencies = {
			-- Automatically insstall LSPs and related tools
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",

			-- Status updates for LSP
			{ "j-hui/fidget.nvim", opts = {} },
		},
		config = function()
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
				callback = function(event)
					local map = function(keys, func, desc)
						vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
					end

					map("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")
					map("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
					map("gI", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementations")
					map("<leader>D", require("telescope.builtin").lsp_type_definitions, "Type [D]efinitions")
					map("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")
					map(
						"<leader>ws",
						require("telescope.builtin").lsp_dynamic_workspace_symbols,
						"[W]orkspace [S]ymbols"
					)
					map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
					map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
					map("K", vim.lsp.buf.hover, "Hover Documentation")
					map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")

					local client = vim.lsp.get_client_by_id(event.data.client_id)
					if client and client.server_capabilities.documentHighlightProvider then
						vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
							buffer = event.buf,
							callback = vim.lsp.buf.document_highlight,
						})

						vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
							buffer = event.buf,
							callback = vim.lsp.buf.clear_references,
						})
					end
				end,
			})

			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

			local servers = {
				gopls = {},
				tailwindcss = {},
				prettier = {},
				tsserver = {},
				lua_ls = {
					settings = {
						Lua = {
							runtime = { version = "LuaJIT" },
							workspace = {
								checkThirdParty = false,
								library = {
									"${3rd}/luv/library",
									unpack(vim.api.nvim_get_runtime_file("", true)),
								},
							},
							completion = {
								callSnippet = "Replace",
							},
							diagnostics = {
								disable = {
									"missing-fields",
								},
							},
						},
					},
				},
			}

			require("mason").setup()

			local ensure_installed = vim.tbl_keys(servers or {})
			vim.list_extend(ensure_installed, {
				"stylua",
			})
			require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

			require("mason-lspconfig").setup({
				handlers = {
					function(server_name)
						local server = servers[server_name] or {}
						server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
						require("lspconfig")[server_name].setup(server)
					end,
				},
			})
		end,
	},
	{
		"stevearc/conform.nvim", -- Formatting
		opts = {
			notify_on_error = false,
			format_on_save = {
				timeout_ms = 500,
				lsp_fallback = true,
			},
			formatters_by_ft = {
				lua = { "stylua" },
				javascript = { { "prettier" } },
				typescript = { { "prettier" } },
				typescriptreact = { { "prettier" } },
				javascriptreact = { { "prettier" } },
				json = { { "prettier" } },
				markdown = { { "prettier" } },
			},
		},
	},
	{
		"zbirenbaum/copilot.lua",
		enabled = false,
		config = function()
			require("copilot").setup({
				suggestion = { enabled = false },
				panel = { enabled = false },
			})
		end,
	},
	{
		"zbirenbaum/copilot-cmp",
		enabled = false,
		config = function()
			require("copilot_cmp").setup()
		end,
	},
	{
		"github/copilot.vim",
	},
	{
		"hrsh7th/nvim-cmp", -- Autocompletion
		event = "InsertEnter",
		dependencies = {
			{
				"L3MON4D3/LuaSnip",
				build = (function()
					if vim.fn.has("win32") == 1 or vim.fn.executable("make") == 0 then
						return
					end
					return "make install_jsregexp"
				end)(),
			},
			"saadparwaiz1/cmp_luasnip",

			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-path",
		},
		config = function()
			local cmp = require("cmp")
			local luasnip = require("luasnip")
			luasnip.config.setup({})

			cmp.setup({
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},
				completion = { completeopt = "menu,menuone,noinsert" },

				mapping = cmp.mapping.preset.insert({
					["<C-n>"] = cmp.mapping.select_next_item(),
					["<C-p>"] = cmp.mapping.select_prev_item(),
					["<C-y>"] = cmp.mapping.confirm({ select = true }),
					["<C-Space>"] = cmp.mapping.complete({}),
					["<C-l>"] = cmp.mapping(function()
						if luasnip.expand_or_locally_jumpable() then
							luasnip.expand_or_jump()
						end
					end, { "i", "s" }),
					["<C-h>"] = cmp.mapping(function()
						if luasnip.locally_jumpable(-1) then
							luasnip.jump(-1)
						end
					end, { "i", "s" }),
				}),
				sources = {
					{ name = "nvim_lsp", group_index = 2 },
					{ name = "luasnip", group_index = 2 },
					{ name = "path", group_index = 2 },
				},
			})
		end,
	},
	{
		"shaunsingh/oxocarbon.nvim",
		name = "oxocarbon",
		priority = 1000,
		config = function()
			vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
			vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
			-- vim.cmd([[colorscheme oxocarbon]])
		end,
	},
	{
		"rose-pine/neovim",
		name = "rose-pine",
		config = function()
			vim.cmd([[colorscheme rose-pine]])
		end,
	},
	{
		"folke/todo-comments.nvim",
		event = "VimEnter",
		dependencies = {
			{
				"nvim-lua/plenary.nvim",
			},
		},
		opts = {
			signs = false,
		},
	},
	{
		"echasnovski/mini.nvim",
		keys = {
			{
				"<leader>e",
				function()
					require("mini.files").open()
				end,
				{ desc = "Open [E]xplorer" },
			},
		},
		config = function()
			require("mini.ai").setup({ n_lines = 500 })
			require("mini.surround").setup()
			require("mini.starter").setup()
			require("mini.files").setup()

			local statusline = require("mini.statusline")
			statusline.setup({ use_icons = vim.g.have_nerd_font })

			statusline.section_location = function()
				return "%2l:%-2v"
			end
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = { "bash", "c", "html", "lua", "markdown", "vim", "vimdoc" },
				auto_install = true,
				highlight = { enable = true },
				indent = { enable = true },
			})
		end,
	},
	{ -- Add indentation guides even on blank lines
		"lukas-reineke/indent-blankline.nvim",
		-- Enable `lukas-reineke/indent-blankline.nvim`
		-- See `:help ibl`
		main = "ibl",
		opts = {},
	},
	{
		"christoomey/vim-tmux-navigator",
		cmd = {
			"TmuxNavigateLeft",
			"TmuxNavigateDown",
			"TmuxNavigateUp",
			"TmuxNavigateRight",
			"TmuxNavigatePrevious",
		},
		keys = {
			{ "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
			{ "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
			{ "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
			{ "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
			{ "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
		},
	},
	{
		"karb94/neoscroll.nvim",
		opts = {
			hide_cursor = false,
		},
	},
	{
		"stevearc/oil.nvim",
		enabled = false,
		opts = {},
		keys = {
			{ "<leader>e", "<cmd>Oil<cr>", { desc = "Open [E]xplorer" } },
		},
	},
	{
		"pwntester/octo.nvim",
		config = function()
			require("octo").setup({
				suppress_missing_scope = {
					projects_v2 = true,
				},
			})
		end,
		keys = {
			{ "<leader>gp", "<cmd>Octo pr list<cr>", { desc = "Open [G]ithub [P]rs" } },
			{ "<leader>grs", "<cmd>Octo review start<cr>", { desc = "[G]ithub [R]eview [S]tart" } },
			{ "<leader>grS", "<cmd>Octo review submit<cr>", { desc = "[G]ithub [R]eview [S]ubmit" } },
		},
	},
	{
		"pmizio/typescript-tools.nvim",
		dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
		opts = {},
	},
	{
		"vim-test/vim-test",
		dependencies = { "preservim/vimux" },
		keys = {
			{ "<leader>tt", "<cmd>TestFile<cr>", { desc = "[T]est [T]est" } },
			{ "<leader>tn", "<cmd>TestNearest<cr>", { desc = "[T]est [N]earest" } },
			{ "<leader>ts", "<cmd>TestSuite<cr>", { desc = "[T]est [S]uite" } },
			{ "<leader>tl", "<cmd>TestLast<cr>", { desc = "[T]est [L]ast" } },
			{ "<leader>tv", "<cmd>TestVisit<cr>", { desc = "[T]est [V]isit" } },
		},
	},
	{
		"epwalsh/obsidian.nvim",
		enabled = false,
		version = "*",
		lazy = true,
		ft = "markdown",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		config = function()
			require("obsidian").setup({
				workspaces = {
					{
						name = "zettelkasten",
						path = "~/Library/Mobile Documents/iCloud~md~obsidian/Documents/vault/",
					},
				},
				notes_subdir = "inbox",
				new_notes_location = "notes_subdir",

				disable_formatter = true,
				templates = {
					subdir = "templates",
					date_format = "%Y-%m-%d",
					time_format = "%H:%M:%S",
				},

				mappings = {
					["gf"] = {
						action = function()
							return require("obsidian").util.gf_passthrough()
						end,
						opts = {
							noremap = false,
							expr = true,
							buffer = true,
						},
					},
				},
				completion = {
					nvim_cmp = true,
					min_chars = 2,
				},
			})
		end,
	},
	{ "ellisonleao/glow.nvim", config = true, cmd = "Glow" },
	{
		"tpope/vim-fugitive",
		enabled = false,
		keys = {
			{ "<leader>gg", "<cmd>Git<cr>", { desc = "Git" } },
			{ "<leader>gp", "<cmd>Git pull<cr>", { desc = "Git pull" } },
			{ "<leader>gP", "<cmd>Git push<cr>", { desc = "Git pull" } },
		},
	},
	{
		"NeogitOrg/neogit",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"sindrets/diffview.nvim",
			"nvim-telescope/telescope.nvim",
		},
		keys = {
			{ "<leader>gg", "<cmd>Neogit<CR>", { desc = "Open Neogit" } },
			{ "<leader>gc", "<cmd>Neogit commit<CR>", { desc = "Open Neogit Commit" } },
		},
		config = true,
	},
})
