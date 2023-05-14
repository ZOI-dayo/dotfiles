local g = vim.g

vim.cmd([[
function L_eskk_get_mode()
    if (mode() == 'i') && eskk#is_enabled()
        return g:eskk#statusline()
    else
        return ''
    endif
endfunction

function L_filepath()
  let l:file = expand('%:p')
  if l:file == ''
    return ''
  endif
  let l:home = expand('$HOME')
  let l:file = substitute(l:file, l:home, '~', '')
  return l:file
endfunction
]])

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
      {'lsp_info', 'lsp_hints', 'lsp_errors', 'lsp_warnings', 'lsp_ok' }, { 'lsp_status' },
      {'readonly', 'filename', 'eskk', 'modified'},
      {'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok'},
    }
  },
  component_function = {
     eskk = 'L_eskk_get_mode',
     filename = 'L_filepath',
  },
  tab_component_function= {
    tabnum= 'LightlineWebDevIcons',
  },
  --[[
  tabline = {
    left = {{'buffers'}},
    right = {{'close'}}
  },
  component_expand = {
    buffers = 'lightline#bufferline#buffers'
  },
  component_type = {
    buffers = 'tabsel'
  }
  ]]
}
vim.cmd([[
function! LightlineWebDevIcons(n)
  let l:bufnr = tabpagebuflist(a:n)[tabpagewinnr(a:n) - 1]
  return WebDevIconsGetFileTypeSymbol(bufname(l:bufnr))
endfunction
]])

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

--[[
g.lightline.component_raw = { buffers = 1 }
g['lightline#bufferline#unicode_symbols'] = 1
g['lightline#bufferline#enable_devicons'] = 1
g['lightline#bufferline#enable_nerdfont'] = 1
]]
-- g['lightline#ale#indicator_checking'] = [[\uf110]]
-- g['lightline#ale#indicator_infos'] = [[\uf129]]
-- g['lightline#ale#indicator_warnings'] = [[\uf071]]
-- g['lightline#ale#indicator_errors'] = [[\uf05e]]
-- g['lightline#ale#indicator_ok'] = [[\uf00c]]

g['lightline#lsp#indicator_warnings'] = ''
g['lightline#lsp#indicator_errors'] = ''
g['lightline#lsp#indicator_info'] = ''
g['lightline#lsp#indicator_hints'] = ''
g['lightline#lsp#indicator_ok'] = '﫠'
vim.cmd("call lightline#lsp#register()");

--[[
if fn.has('gui_running') then
  opt.guioptions:remove({'e'})
end
]]

--[[
g.lightline.tab = {
  active= { 'tabnum', 'filename', 'modified' },
  inactive= { 'tabnum', 'filename', 'modified' }
}
]]

