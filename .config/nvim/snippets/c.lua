local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node

-- Config implementation
local configurator = require("utils.configurator")
local config = configurator.load_name_json("guard_schema", ".guard_snippet.ink.json")

local function project_name()
  if config.proj_name then
    return config.proj_name:upper()
  end
  local cmake = vim.fn.findfile("CMakeLists.txt", ".;")
  if cmake ~= "" then
    return vim.fn.fnamemodify(vim.fn.fnamemodify(cmake, ":h"), ":t"):upper()
  else
    return vim.fn.fnamemodify(vim.fn.getcwd(), ":t"):upper()
  end
end

local function module_path()
  local path = vim.fn.expand("%:p")
  local rel = path:gsub("^" .. vim.fn.getcwd() .. "/", "")
  for _, prefix in ipairs(config.strip_paths or {}) do
    rel = rel:gsub("^" .. prefix, "")
  end
  local parts = vim.split(rel, "/")
  table.remove(parts)
  if #parts == 0 then return "" end
  return table.concat(parts, config.mod_split_sep or "_"):upper()
end

-- Helper: get filename in uppercase, replacing dots with underscores
local function guard_name()
  local prefix = config.prefix
  local proj = project_name()
  local proj_sep = config.proj_sep or ""
  local mod = module_path()
  local mod_sep = config.mod_sep
  local ext_sep = config.ext_sep
  local file = vim.fn.expand("%:t"):upper():gsub("%.", ext_sep)
  local suffix = config.suffix

  if mod ~= "" then
    return prefix .. proj .. proj_sep .. mod .. mod_sep .. file .. suffix
  else
    return prefix .. proj .. proj_sep .. file .. suffix
  end
end

return {
  s("guard", {
    t("#ifndef "), f(guard_name, {}),
    t({ "", "#define " }), f(guard_name, {}),
    t({ "", "", "" }), i(0),
    t({ "", "", "#endif /* " }), f(guard_name, {}), t(" */"),
  }),
}
