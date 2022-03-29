lvim.autocommands.custom_groups = {
	{ "BufReadPost", [[* if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif"]] },
	{
		"Filetype",
		"rust",
		"nnoremap <leader>m <cmd>lua require('lvim.core.terminal')._exec_toggle({cmd='cargo build;read',count=2,direction='float'})<CR>",
	},
}
