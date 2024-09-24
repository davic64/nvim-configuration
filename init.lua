require("config.lazy")
require("vim-options")
package.loaded["plugins"] = nil
require("lazy").setup("plugins")
