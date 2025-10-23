return {
  "CopilotC-Nvim/CopilotChat.nvim",
  opts = {
    -- Use copilot built-in selection logic
    selection = "#selection",
    window = {
      width = 0.2,
      -- This is currently being ignored, putting it here in case it gets fixed at some point.
      position = "left",
    },
  },
  config = function(_, opts)
    require("CopilotChat").setup(opts)

    -- Unet <C-l> for copilot chat, because that would reset the window.
    -- Delay unmapping to after CopilotChat sets its keymaps
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "copilot-chat",
      callback = function(args)
        local buf = args.buf

        -- Delay just enough for CopilotChat to finish setting keymaps
        vim.defer_fn(function()
          pcall(vim.keymap.del, "n", "<C-l>", { buffer = buf })
          pcall(vim.keymap.del, "i", "<C-l>", { buffer = buf })
        end, 50) -- 50ms delay; adjust if needed
      end,
    })
  end,
}
