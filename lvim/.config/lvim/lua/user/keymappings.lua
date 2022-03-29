lvim.leader = "space"
lvim.keys = {
	insert_mode = {
		["jk"] = false,
		["kj"] = false,
		["jj"] = false,
		["<A-j>"] = false,
		["<A-k>"] = false,
		["<A-Up>"] = false,
		["<A-Down>"] = false,
		["<A-Left>"] = false,
		["<A-Right>"] = false,
	},

	normal_mode = {
		["<S-l>"] = false,
		["<S-h>"] = false,
		["<A-j>"] = false,
		["<A-k>"] = false,
		["<C-n>"] = ":BufferLineCycleNext<CR>",
		["<C-p>"] = ":BufferLineCyclePrev<CR>",
		["Y"] = "y$",
		["<leader>r"] = ":call CompileRunGcc()<CR>",
		["]d"] = "<cmd>lua vim.diagnostic.goto_next()<cr>",
		["[d"] = "<cmd>lua vim.diagnostic.goto_prev()<cr>",
		["<esc><esc>"] = "<cmd>nohlsearch<cr>",
	},

	visual_mode = {
		["<A-j>"] = false,
		["<A-k>"] = false,
		["p"] = '"_dP',
		-- ["P"] = '"_dP',
	},
}

local _, actions = pcall(require, "telescope.actions")
lvim.builtin.telescope.defaults.mappings = {
	-- for input mode
	i = {
		["<C-u>"] = false,
		["<C-d>"] = false,
		["<C-b>"] = actions.preview_scrolling_up,
		["<C-f>"] = actions.preview_scrolling_down,
		["<C-n>"] = actions.move_selection_next,
		["<C-p>"] = actions.move_selection_previous,
		["<C-j>"] = actions.cycle_history_next,
		["<C-k>"] = actions.cycle_history_prev,
	},
	-- for normal mode
	n = {
		["<esc>"] = actions.close,
		["q"] = actions.close,
		["<CR>"] = actions.select_default + actions.center,
	},
}

-- Use which-key to add extra bindings with the leader-key prefix
lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
lvim.builtin.which_key.mappings["h"] = nil
lvim.builtin.which_key.mappings["<CR>"] = { "<cmd>nohlsearch<CR>", "No Highlight" }
lvim.builtin.which_key.mappings["z"] ={ "<cmd>ZenMode<CR>", "Zen" }

lvim.builtin.treesitter.textobjects = {
	-- mChange
	select = {
		enable = true,
		lookahead = true,
		keymaps = {
			-- You can use the capture groups defined in textobjects.scm
			["af"] = "@function.outer",
			["if"] = "@function.inner",
			["ac"] = "@class.outer",
			["ic"] = "@class.inner",
			["al"] = "@loop.outer",
			["il"] = "@loop.inner",
			["aa"] = "@parameter.outer",
			["ia"] = "@parameter.inner",
		},
	},
	-- TODO
	-- swap = {
	--   enable = true,
	--   swap_next = {
	--     ["<leader><M-a>"] = "@parameter.inner",
	--     ["<leader><M-f>"] = "@function.outer",
	--     ["<leader><M-e>"] = "@element",
	--   },
	--   swap_previous = {
	--     ["<leader><M-A>"] = "@parameter.inner",
	--     ["<leader><M-F>"] = "@function.outer",
	--     ["<leader><M-E>"] = "@element",
	--   },
	-- },
	move = {
		enable = true,
		set_jumps = true, -- whether to set jumps in the jumplist
		goto_next_start = {
			["]p"] = "@parameter.inner",
			["]f"] = "@function.outer",
			["]]"] = "@class.outer",
		},
		goto_next_end = {
			["]F"] = "@function.outer",
			["]["] = "@class.outer",
		},
		goto_previous_start = {
			["[p"] = "@parameter.inner",
			["[f"] = "@function.outer",
			["[["] = "@class.outer",
		},
		goto_previous_end = {
			["[F"] = "@function.outer",
			["[]"] = "@class.outer",
		},
	},
}
