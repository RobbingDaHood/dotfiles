-- When starting debugger then sometimes it freezes when navigating the stacktrace.
-- The Noice log shows that it waited for "Select window:" but without any way of providing the value.
-- So this disbles this and any other prompts for selecting a view.
return {
  "folke/noice.nvim",
  opts = {
    views = {
      select = {
        enabled = false,
      },
    },
  },
}
