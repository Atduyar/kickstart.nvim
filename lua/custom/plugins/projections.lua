vim.api.nvim_create_autocmd("User", {
	pattern = "ProjectionsPreStoreSession",
	callback = function()
		-- vim.print("eee")
		vim.lsp.stop_client(vim.lsp.get_clients())
	end
})

vim.opt.sessionoptions:append("localoptions")

return {
	'gnikdroy/projections.nvim',
	branch = 'dev',
	opts = {
		workspaces = {
			{ path = "~/repos",     patterns = {} },
			{ path = "~/repos/shc", patterns = {} },
			{ path = "~/.dotfiles/nvim/.config", patterns = {} },
			{ path = "~/.dotfiles/i3/.config", patterns = {} },
			{ path = "~/.dotfiles/polybar/.config", patterns = {} },
		},
	},
}
