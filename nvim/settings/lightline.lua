local g = vim.g
g.lightline = {
  colorscheme = 'iceberg',
  separator = {
    left = "",
    right = ""
  },
  subseparator= {
    left = "",
    right = ""
  },
  active = {
    left = {
      {'mode', 'paste'},
      {'readonly', 'filename', 'modified'},
      {'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok'}
    }
  }
}

g.lightline.component_expand = {
  linter_checking = 'lightline#ale#checking',
  linter_warnings = 'lightline#ale#warnings',
  linter_errors = 'lightline#ale#errors',
  linter_ok = 'lightline#ale#ok',
}
g.lightline.component_type = {
  linter_checking = 'left',
  linter_warnings = 'warning',
  linter_errors = 'error',
  linter_ok = 'left',
}
g['lightline#ale#indicator_checking'] = [[\uf110]]
g['lightline#ale#indicator_infos'] = [[\uf129]]
g['lightline#ale#indicator_warnings'] = [[\uf071]]
g['lightline#ale#indicator_errors'] = [[\uf05e]]
g['lightline#ale#indicator_ok'] = [[\uf00c]]

--[[
if fn.has('gui_running') then
  opt.guioptions:remove({'e'})
end
]]

g.lightline.tab = {
  active= { 'tabnum', 'filename', 'modified' },
  inactive= { 'tabnum', 'filename', 'modified' }
}

