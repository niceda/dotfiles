lvim.plugins = {
	{
		"tpope/vim-surround",
		config = function()
			vim.g.surround_no_insert_mappings = true
		end,
	},
	{
		"simrat39/symbols-outline.nvim",
		config = function()
			require("user.outline").config()
		end,
	},
	{
		"iamcco/markdown-preview.nvim",
		run = ":call mkdp#util#install()",
		ft = "markdown",
	},
	{
		"ray-x/lsp_signature.nvim",
		event = "InsertEnter",
		config = function()
			require("user.lsp_signature").config()
		end,
	},
	{
		"unblevable/quick-scope",
		config = function()
			require("user.quickscope")
		end,
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		-- event = "BufReadPre",
		config = function()
			require("user.blankline")
		end,
	},
	{
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("user.colorizer").config()
		end,
	},
	{
		"kevinhwang91/nvim-bqf",
		event = "BufRead",
	},
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		after = "nvim-treesitter",
	},
	-- {
	--   "ggandor/lightspeed.nvim",
	--   event = "BufRead",
	-- },
	{ "p00f/nvim-ts-rainbow" },
	{ "folke/zen-mode.nvim",
    config = function()
      require("user.zen-mode")
    end
  },
}
