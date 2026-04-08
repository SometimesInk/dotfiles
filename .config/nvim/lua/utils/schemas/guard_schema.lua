local M = {}

M.schema = {
  prefix = { type = "string", default = "__", description = "Include guard prefix, optional." },
  proj_name = { type = "string", default = nil, description = "Project name, optional." },
  proj_sep = { type = "string", default = nil, description = "Separator added after project name, optional." },
  mod_split_sep = { type = "string", default = nil, description = "Separator which replaces directories in module, optional." },
  mod_sep = { type = "string", default = nil, description = "Separator added after module, optional." },
  ext_sep = { type = "string", default = "_", description = "Separator which replaces dots in filename." },
  suffix = { type = "string", default = "_H__", description = "Include guard suffix, optional." },
  strip_paths = { type = "array", default = { "src/" }, description = "Paths to strip from full path to identify modules, optional." },
}

return M
