local M = {}

local reg = require("utils.schema_registry")

-- Load JSON config from file, returns table or empty table
function M.load_json_config(fn)
  local path = vim.fn.findfile(fn, ".;")
  if path == "" then return {} end

  local f = io.open(path, "r")
  if not f then return {} end

  local content = f:read("*a")
  f:close()

  local ok, tbl = pcall(vim.fn.json_decode, content)
  if ok and type(tbl) == "table" then
    return tbl
  else
    return {}
  end
end

function M.deep_copy(v)
  if type(v) ~= "table" then return v end
  local copy = {}
  for k, val in pairs(v) do
    copy[k] = M.deep_copy(val)
  end
  return copy
end

function M.load_typed_json(default_tbl, fn)
  local tbl = M.deep_copy(default_tbl)

  local json_tbl = M.load_json_config(fn)
  for k, v in pairs(json_tbl) do
    tbl[k] = v
  end

  return tbl;
end

function M.parse_schema(schema_tbl)
  local defaults = {}
  for key, elem in pairs(schema_tbl) do
    if elem.default ~= nil then
      defaults[key] = M.deep_copy(elem.default)
    else
      defaults[key] = nil
    end
  end
  return defaults
end

function M.load_schema_json(schema_tbl, fn)
  return M.load_typed_json(M.parse_schema(schema_tbl), fn)
end

function M.load_name_json(schema_name, fn)
  local schema = reg.get(schema_name);
  if not schema then
    error("Schema not found in registry: " .. schema_name)
  end
  return M.load_schema_json(schema, fn)
end

function M.validate(schema, tbl)
  for k, info in pairs(schema) do
    local val = tbl[k]
    if val ~= nil then
      if info.type == "string" and type(val) ~= "string" then return false end
      if info.type == "array" and type(val) ~= "table" then return false end
    end
  end
  return true
end

function M.generate_defaults(schema)
  local tbl = {}
  for k, info in pairs(schema) do
    tbl[k] = M.deep_copy(info.default)
  end
  return tbl
end

function M.write_defaults(schema, filename)
  local tbl = M.generate_defaults(schema)
  local f = io.open(filename, "w")
  if not f then error("Cannot write file: " .. filename) end
  f:write(vim.fn.json_encode(tbl))
  f:close()
end

function M.to_json_schema(schema_tbl)
  local properties = {}
  local required = {}

  for key, info in pairs(schema_tbl) do
    local prop = {}

    -- === TYPE ===
    if info.type == "string" then
      prop.type = "string"
    elseif info.type == "number" then
      prop.type = "number"
    elseif info.type == "boolean" then
      prop.type = "boolean"
    elseif info.type == "array" then
      prop.type = "array"

      -- 2020-12 requires proper "items"
      prop.items = info.items or { type = "string" }
    elseif info.type == "object" then
      prop.type = "object"

      -- allow nested schemas
      if info.properties then
        prop.properties = M.to_json_schema(info.properties).properties
      end
    else
      error("Unknown type: " .. tostring(info.type))
    end

    -- === DEFAULT ===
    if info.default ~= nil then
      prop.default = info.default
    end

    -- === DESCRIPTION ===
    if info.description then
      prop.description = info.description
    end

    -- === ENUM ===
    if info.enum then
      prop.enum = info.enum
    end

    -- === REQUIRED (explicit only) ===
    if info.required == true then
      table.insert(required, key)
    end

    properties[key] = prop
  end

  local schema = {
    ["$schema"] = "https://json-schema.org/draft/2020-12/schema",
    type = "object",
    properties = properties,
    additionalProperties = false,
  }

  if #required > 0 then
    schema.required = required
  end

  return schema
end

function M.write_json_schema(schema_tbl, filename)
  local json_schema = M.to_json_schema(schema_tbl)

  local f = io.open(filename, "w")
  if not f then
    error("Cannot write JSON schema: " .. filename)
  end

  f:write(vim.fn.json_encode(json_schema))
  f:close()
end

return M
