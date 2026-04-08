local M = {}

function M.nargs(cmd_line)
  return #vim.split(cmd_line, "%s+")
end

function M.filter(list, arg_lead)
  local matches = {}
  for _, item in ipairs(list) do
    if item:sub(1, #arg_lead) == arg_lead then
      table.insert(matches, item)
    end
  end
  table.sort(matches)
  return matches
end

return M
