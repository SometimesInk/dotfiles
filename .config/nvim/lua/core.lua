-- Setup schema registry
local schema_reg = require("utils.schema_registry")

local command_utils = require("utils.command_utils")
local configurator = require("utils.configurator")

-- Add schema commands
vim.api.nvim_create_user_command(
  "InkCreateJson",
  function(opts)
    local name = opts.fargs[1]
    local fn = opts.fargs[2]
    local schema = schema_reg.get(name)
    if schema == nil then
      error("No schema with name '" .. name .. "'.")
      return
    end
    configurator.write_defaults(schema, fn)
    print("Created json with name '" .. name .. "' at '" .. fn .. "'.")
  end,
  {
    nargs = '+',
    complete = function(ArgLead, CmdLind, CursorPos)
      local i = command_utils.nargs(CmdLind)
      if i == 2 then
        return command_utils.filter(schema_reg.list(), ArgLead)
      elseif i == 3 then
        local files = vim.fn.glob("*", false, true)
        return command_utils.filter(files, ArgLead);
      end
      return {}
    end,
  }
)
vim.api.nvim_create_user_command(
  "InkCreateSchema",
  function(opts)
    local name = opts.fargs[1]
    local fn = opts.fargs[2]
    local schema = schema_reg.get(name)
    if schema == nil then
      error("No schema with name '" .. name .. "'.")
      return
    end
    configurator.write_json_schema(schema, fn)
    print("Created schema with name '" .. name .. "' at '" .. fn .. "'.")
  end,
  {
    nargs = '+',
    complete = function(ArgLead, CmdLind, CursorPos)
      local i = command_utils.nargs(CmdLind)
      if i == 2 then
        return command_utils.filter(schema_reg.list(), ArgLead)
      elseif i == 3 then
        local files = vim.fn.glob("*", false, true)
        return command_utils.filter(files, ArgLead);
      end
      return {}
    end,
  }
)
vim.api.nvim_create_user_command(
  "InkUpdateSchemas",
  function(opts)
    local dir = vim.fn.stdpath("config") .. "/lua/utils/.schemas/"
    for index, value in ipairs(schema_reg.list()) do
      configurator.write_json_schema(schema_reg.get(value), dir .. value .. ".json")
    end
    print("Wrote schemas.")
  end,
  { nargs = '*', }
)
--TODO: Add a `InkGetSchemaPath` command to get the path from the /lua/utils/.schemas/ dir
vim.api.nvim_create_user_command(
  "InkGetSchemaPath",
  function(opts)
    local name = opts.fargs[1]
    local dir = vim.fn.stdpath("config") .. "/lua/utils/.schemas/" .. name .. ".json"
    vim.fn.setreg("+", dir)
  end,
  {
    nargs = 1,
    complete = function(ArgLead, CmdLead, CursorPos)
      return command_utils.filter(schema_reg.list(), ArgLead)
    end
  }
)

-- Custom highlight groups
vim.api.nvim_set_hl(0, "@comment.tag", {
  fg = "#fca7ea",
  italic = true
})

-- Custom filetypes
vim.filetype.add({
  extension = {
    inc = "c",
  }
})
