-- Set leader key to space
vim.g.mapleader = " "

-- Bootstraps Lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"--single-branch",
		"https://github.com/folke/lazy.nvim.git",
		lazypath,
	})
end
vim.opt.runtimepath:prepend(lazypath)

require("lazy").setup("venom.plugins", {
	install = { colorscheme = { "duskfox", "habamax" } },
	checker = { enabled = true },
	diff = {
		cmd = "terminal_git",
	},
	performance = {
		rtp = {
			disabled_plugins = {
				"gzip",
				"matchit",
				"matchparen",
				"netrwPlugin",
				"tarPlugin",
				"tohtml",
				"tutor",
				"zipPlugin",
			},
		},
	},
})
vim.keymap.set("n", "<leader>l", "<cmd>:Lazy<cr>", { desc = "Open Lazy UI" })
