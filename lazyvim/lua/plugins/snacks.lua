return {
  "folke/snacks.nvim",
    opts = {
      picker = {
        formatters = {
          file = {
          -- whatever sane or insane value you need, default was 40
	  -- Used for default size of UI elements and paths throughout nvim
          truncate = 300,
        },
      },
    },
  },
}
