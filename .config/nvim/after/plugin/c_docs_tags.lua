local ns = vim.api.nvim_create_namespace("c_doc_tags")

vim.api.nvim_set_hl(0, "DocTag", { link = "@comment.tag" })

local query = vim.treesitter.query.parse("c", [[
  (comment) @comment
]])

local function highlight(buf)
  vim.api.nvim_buf_clear_namespace(buf, ns, 0, -1)

  local parser = vim.treesitter.get_parser(buf, "c")
  local tree = parser:parse()[1]
  local root = tree:root()

  for _, node in query:iter_captures(root, buf, 0, -1) do
    local sr, sc, er, ec = node:range()

    for l = sr, er do
      local line = vim.api.nvim_buf_get_lines(buf, l, l + 1, false)[1]
      if not line then goto continue end

      local start_col = (l == sr) and sc or 0
      local end_col   = (l == er) and ec or #line

      local segment   = line:sub(start_col + 1, end_col)

      for s, e in segment:gmatch("()@[%w_]+()") do
        vim.api.nvim_buf_set_extmark(buf, ns, l, start_col + s - 1, {
          end_col = start_col + e - 1,
          hl_group = "DocTag",
        })
      end

      ::continue::
    end
  end
end

vim.api.nvim_create_autocmd(
  { "BufEnter", "TextChanged", "TextChangedI", "InsertLeave" },
  {
    callback = function(args)
      if vim.bo[args.buf].filetype == "c" then
        highlight(args.buf)
      end
    end,
  }
)
