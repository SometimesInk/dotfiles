local M = {}

local started = false

M.registry = {}

function M.register(name, schema)
  if type(name) ~= "string" then
    error("Schema name must be a string")
  end
  if type(schema) ~= "table" then
    error("Schema must be a table")
  end
  M.registry[name] = schema
  print("Added schema " .. name)
end

function M.get(name)
  if started == false then
    M.start()
  end
  return M.registry[name]
end

-- Returns a list containing the name of every registered schema
function M.list()
  if started == false then
    M.start()
  end
  local names = {}
  for k in pairs(M.registry) do
    table.insert(names, k)
  end
  return names
end

function M.add_all_from_dir(dir)
  local ok, files = pcall(vim.fn.globpath, vim.fn.stdpath("config") .. "/lua/" .. dir:gsub("%.", "/"), "*.lua", 0, 1)
  if not ok or not files then return end

  for _, path in ipairs(files) do
    -- convert full path to Lua module name
    local module = path
        :gsub(vim.fn.stdpath("config") .. "/lua/", "") -- remove base
        :gsub("%.lua$", "")                            -- remove .lua extension
        :gsub("/", ".")                                -- convert / to .
    local ok2, schema_file = pcall(require, module)
    if ok2 and schema_file and schema_file.schema then
      M.register(module:match("[^.]+$"), schema_file.schema) -- register using file basename
    end
  end
end

function M.start()
  M.add_all_from_dir("utils.schemas")
  started = true
end

return M
