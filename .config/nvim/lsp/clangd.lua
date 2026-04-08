return {
  cmd = {
    -- see clangd --help-hidden
    'clangd',
    '--background-index',
    -- by default, clang-tidy use -checks=clang-diagnostic-*,clang-analyzer-*
    -- to add more checks, create .clang-tidy file in the root directory
    -- and add Checks key, see https://clang.llvm.org/extra/clang-tidy/
    -- '--clang-tidy',
    '--header-insertion=iwyu'
  },
  root_markers = { 'compile_commands.json', 'compile_flags.txt' },
  filetypes = { 'c', 'cpp' },
}
