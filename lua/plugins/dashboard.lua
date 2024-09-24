return {
  "nvimdev/dashboard-nvim",
  event = "VimEnter",
  config = function()
    local logo = [[
      ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗      
      ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║      
      ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║      
      ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║      
      ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║      
      ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝      
    ]]

    logo = string.rep("\n", 8) .. logo .. "\n\n"

    require("dashboard").setup({
      theme = "doom",
      hide = {
        statusline = false,
      },
      config = {
        header = vim.split(logo, "\n"),
        center = {
          { icon = " ", desc = "New file", action = "enew", key = "n" },
          { icon = "󰈞  ", desc = "Find file", action = "Telescope find_files", key = "SPC ff" },
          { icon = "󰊄  ", desc = "Recently opened files", action = "Telescope oldfiles", key = "SPC fh" },
          { icon = "󰈬  ", desc = "Find word", action = "Telescope live_grep", key = "SPC fg" },
          { icon = "  ", desc = "Open last session", action = "SessionLoad", key = "SPC sl" },
          {
            icon = "  ",
            desc = "Quit",
            action = function()
              vim.api.nvim_input("<cmd>qa<cr>")
            end,
            key = "q",
          },
        },
        footer = function()
          local stats = require("lazy").stats()
          local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
          return { "⚡ Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms" }
        end,
      },
    })
  end,
  dependencies = { { "nvim-tree/nvim-web-devicons" } },
}
