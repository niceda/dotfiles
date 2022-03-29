vim.opt.spelllang = "en,cjk"

if vim.fn.has("wsl") == 1 then
	local formatters = require("lvim.lsp.null-ls.formatters")
	formatters.setup({
		{
      exe = "rustfmt",
			---@usage arguments to pass to the formatter
			-- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
			args = { "newline_style: Unix" },
		},
	})
	vim.g.clipboard = {
		copy = {
			["+"] = "win32yank.exe -i --crlf",
			["*"] = "win32yank.exe -i --crlf",
		},
		paste = {
			["+"] = "win32yank.exe -o --lf",
			["*"] = "win32yank.exe -o --lf",
		},
	}
end
