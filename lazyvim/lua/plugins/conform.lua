return {
  "stevearc/conform.nvim",
  opts = function(_, opts)
    opts.formatters_by_ft = {
	lua = { "stylua" },
	go = { "gofmt" },
	python = { "black" },
	markdown = { "markdownlint" },
	json = { "fixjson" },
    }
  end,
}

