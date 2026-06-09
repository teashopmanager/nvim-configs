-- Entry point for Neovim config: loads core settings (options/keymaps),
-- bootstraps lazy.nvim if missing, and initializes all plugins.

-- Load core config
require("config.options")
require("config.keymaps")
require("config.autocmds")

-- Bootstrap lazy.nvim FIRST
require("config.lazy")

-- Load plugins
require("lazy").setup("plugins")