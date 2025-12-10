-- This should be able to handle:
-- path_from_root_of_project/file_name.py::class_name::method_name
-- path_from_root_of_project/file_name.py::method_name
-- path_from_root_of_project/file_name.py:line_number
local function goto_pointer(ptr)
  if not ptr or ptr == "" then
    print("Empty pointer")
    return
  end

  -- first try file:line
  local file, rest = ptr:match("^(.-):(%d+)$")
  -- if not, try file::rest (rest may contain further ::)
  if not file then
    file, rest = ptr:match("^(.-)::(.+)$")
  end

  if not (file and rest) then
    print("✗ Invalid pointer format. Use file::symbol or file:line")
    return
  end

  -- open file
  local ok, err = pcall(vim.cmd, "edit " .. file)
  if not ok then
    print("✗ Could not open file: " .. (err or "unknown error"))
    return
  end

  -- if rest is purely digits, treat as line number
  if rest:match("^%d+$") then
    vim.cmd(rest)
    vim.cmd("normal! zz")
    return
  end

  -- now rest is assumed symbol path (maybe Class::method or just function)
  -- we’ll search simply for the method/function name — ignore class for now
  -- extract the last segment after :: (so e.g. TestGetVpc::test_get_vpc → test_get_vpc)
  local symbol = rest:match("([^:]+)$")

  if not symbol then
    print("✗ Could not parse symbol from pointer")
    return
  end

  -- escape for safe search
  local pat = vim.fn.escape(symbol, "\\/.*$^~[]")
  vim.cmd("silent! /\\v(def\\s+" .. pat .. "|" .. pat .. ")")
  vim.cmd("normal! zz")
end

-- map with prompt
vim.keymap.set("n", "<leader>j", function()
  vim.ui.input({ prompt = "Go to (file::symbol or file:line): " }, function(input)
    goto_pointer(input)
  end)
end, { desc = "Jump to code pointer" })
