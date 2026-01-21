return {
  "CopilotC-Nvim/CopilotChat.nvim",
  opts = {
    -- Use copilot built-in selection logic
    selection = "#selection",
    auto_insert_mode = false, -- That results in navigating suddenly writing.
    window = {
      width = 0.3,
      -- This is currently being ignored, putting it here in case it gets fixed at some point.
      position = "left",
    },
    prompts = {
      ReviewAllChanges = {
        name = "Summarize Git Diff and Suggest Improvements",
        description = "Summarizes changes from 'git diff development...' and suggests improvements.",
        prompt = [[
        @copilot git diff development...

    Analyze the latest changes between the current branch and 'development'.
    Write a short summary of the changes and list possible improvements.
    Do not include the raw diff in your response.
    Tell me if there are added some TODOs in the diff. 
    ]],
      },
      -- Add more custom prompts here as needed
    },
  },
  config = function(_, opts)
    local CopilotChat = require("CopilotChat")
    CopilotChat.setup(opts)

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
