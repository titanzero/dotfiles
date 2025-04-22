return {
	"goolord/alpha-nvim",
	config = function()
		local alpha = require('alpha')
		local dashboard = require('alpha.themes.dashboard')

		dashboard.section.header.val = vim.fn.readfile(vim.fs.normalize("~/.config/nvim/rc/one_ring.txt"))
		dashboard.section.footer.val = "Total plugins: " .. require("lazy").stats().count

		dashboard.section.buttons.val = {
			dashboard.button("f", " Find file", ":FzfLua files<CR>"),
			dashboard.button("e", " New file", ":enew<CR>"),
			dashboard.button("b", " Jump to bookmarks", ":FzfLua marks<CR>"),
			dashboard.button("p", " Update plugins", ":Lazy sync<CR>"),
			dashboard.button("h", "󰞋 Help", ":FzfLua helptags<CR>"),
			dashboard.button("q", " Exit", ":qa!<CR>"),
		}

		alpha.setup(dashboard.config)
	end,
}
