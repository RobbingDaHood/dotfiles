return {
  "nvim-lualine/lualine.nvim",
  opts = function(_, opts)
    -- Set the section 'C' (filename) to show full path
    opts.sections.lualine_c = {
      {
        "filename",
        path = 1, -- 0 = just filename, 1 = relative path, 2 = absolute path
      },
    }
  end,
}

