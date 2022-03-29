vim.opt.spelllang = "en,cjk"

if vim.fn.has("wsl") == 1 then
  -- FIXME: when formatting files, the line end with ^M
	local formatters = require("lvim.lsp.null-ls.formatters")
	formatters.setup({
		{
			exe = "rustfmt",
      filetype = {"rust"},
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
