local g = vim.g
g.ale_sign_column_always = 1
g.ale_set_quickfix = 1
g.ale_open_list = 1
g.ale_sign_error = ''
g.ale_sign_warning = ''
g.ale_keep_list_window_open = 1
g.ale_linters = {
  cpp= {'clang'},
  vue= {'eslint'},
}
g.ale_linters_explicit = 1
g.ale_disable_lsp = 1
g.ale_lint_on_text_changed = 1
g.ale_fix_on_save = 1

