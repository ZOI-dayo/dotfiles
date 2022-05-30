local api = vim.api
local g = vim.g
local o = vim.o
local opt = vim.opt
local keymap = vim.keymap
local fn = vim.fn
function file_exists(name)
  local f=io.open(name,'r')
  if f~=nil then io.close(f) return true else return false end
end
opt.fenc = 'utf-8'
opt.backup = false
opt.swapfile = false
opt.autoread = true
opt.hidden = true
opt.showcmd = true
-- o.append({["$LANG"] = "ja"})
opt.helplang = 'ja'
opt.number = true
opt.numberwidth = 3
opt.cursorline = true
opt.virtualedit = 'onemore'
opt.smartindent = true
opt.visualbell = true
opt.showmatch = true
opt.laststatus = 2
opt.wildmode = 'list:longest'
keymap.set('n', 'j', 'gj')
keymap.set('n', 'k', 'gk')
opt.whichwrap = 'b,s,h,l,<,>,[,],~'
opt.title = true
opt.list = true
opt.listchars = 'tab:▸-'
opt.expandtab = true
opt.tabstop = 2
opt.shiftwidth = 2
opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true
opt.wrapscan = true
opt.hlsearch = true
keymap.set('n', '<Esc><Esc>', ':nohlsearch<CR><ESC>', {remap = true})
opt.clipboard = 'unnamed'
vim.cmd('augroup source-vimrc')
vim.cmd('autocmd!')
vim.cmd('autocmd BufWritePost *vimrc source $MYVIMRC | set foldmethod=marker')
vim.cmd('autocmd BufWritePost *gvimrc if has("gui_running") source $MYGVIMRC')
vim.cmd('augroup END')
vim.cmd('augroup auto_comment_off')
vim.cmd('autocmd!')
vim.cmd('autocmd BufEnter * setlocal formatoptions-=r')
vim.cmd('autocmd BufEnter * setlocal formatoptions-=o')
vim.cmd('augroup END')
vim.cmd('augroup MyXML')
vim.cmd('autocmd!')
vim.cmd('autocmd Filetype xml inoremap <buffer> </ </<C-x><C-o>')
vim.cmd('autocmd Filetype html inoremap <buffer> </ </<C-x><C-o>')
vim.cmd('augroup END')
opt.mouse = 'a'
opt.foldenable = false
opt.foldcolumn = "0"
vim.cmd('filetype plugin on')
g.netrw_liststyle = 1
g.netrw_banner = 0
g.netrw_sizestyle = 'H'
g.netrw_timefmt = '%Y/%m/%d(%a) %H:%M:%S'
g.netrw_preview = 1
vim.cmd('augroup readonly')
vim.cmd('autocmd!')
vim.cmd('autocmd BufEnter * if &readonly == 1 | set nomodifiable | else | set modifiable | endif')
vim.cmd('augroup END')
opt.guifont = 'Cica:h14'
opt.printfont = 'Cica:h9'
opt.ambiwidth = 'double'
-- vim.cmd('command Term bo terminal')
g.ale_disable_lsp = 1
if not (file_exists('~/.config/nvim/autoload/jetpack.vim')) then
  os.execute('curl -fLo ~/.config/nvim/autoload/jetpack.vim --create-dirs https://raw.githubusercontent.com/tani/vim-jetpack/master/autoload/jetpack.vim')
  vim.cmd('autocmd VimEnter * JetpackSync | source $MYVIMRC')
end
if not (file_exists('~/.config/nvim/lua/jetpack.lua')) then
  os.execute('curl -fLo ~/.config/nvim/lua/jetpack.lua --create-dir https://raw.githubusercontent.com/tani/vim-jetpack/master/lua/jetpack.lua')
end
require('jetpack').setup {
  'vim-jp/vimdoc-ja',
  'markonm/traces.vim',
  'itchyny/lightline.vim',
  'hallzy/lightline-iceberg',
  'preservim/nerdtree',
  'jistr/vim-nerdtree-tabs',
  'ryanoasis/vim-devicons',
  'mengelbrecht/lightline-bufferline',
  'udalov/kotlin-vim',
  'w0rp/ale',
  'tpope/vim-fugitive',
  'maximbaz/lightline-ale',
  'zoi-dayo/cheatsheet.vim',
  'Yggdroot/indentLine',
  'thinca/vim-quickrun',
  'mattn/webapi-vim',
  'tyru/open-browser.vim',
  'superbrothers/vim-quickrun-markdown-gfm',
  'digitaltoad/vim-pug',
  {'prettier/vim-prettier', run = 'yarn install --frozen-lockfile --production' },
  'vim-denops/denops.vim',
  'Shougo/ddc.vim',
  'Shougo/ddc-matcher_head',
  'Shougo/ddc-sorter_rank',
  'Shougo/ddc-around',
  'Shougo/ddc-nvim-lsp',
  'neovim/nvim-lspconfig',
  'williamboman/nvim-lsp-installer',
  'LumaKernel/ddc-file',
  'matsui54/ddc-buffer',
  'Shougo/pum.vim',
  'vim-skk/skkeleton',
  'j-hui/fidget.nvim',
  {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'},
  'Shougo/ddx.vim',
  'ntpeters/vim-better-whitespace',
  'lewis6991/gitsigns.nvim',
  'jghauser/mkdir.nvim',
  "SmiteshP/nvim-gps",
  'akinsho/bufferline.nvim',
  'petertriho/nvim-scrollbar'
}
vim.cmd('command Jetpack JetpackSync')
o.NERDTreeShowHidden = 1
vim.cmd('command! Tree NERDTreeTabsToggle')
g.nerdtree_tabs_open_on_console_startup = 1
if not (file_exists('~/.config/nvim/colors/iceberg.vim')) then
  os.execute('curl -fLo ~/.config/nvim/colors/iceberg.vim --create-dirs https://raw.githubusercontent.com/cocopon/iceberg.vim/master/colors/iceberg.vim')
end
opt.background = 'dark'
vim.cmd('colorscheme iceberg')
g.WebDevIconsUnicodeDecorateFolderNodes = 1
g.lightline = {
  colorscheme = 'iceberg',
  separator = {
    left = "",
    right = ""
  },
  subseparator= {
    left= "",
    right= ""
  },
  active= {
    left= {
      {'mode', 'paste'},
      {'readonly', 'filename', 'modified'},
      {'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok'}
    }
  }
}

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

g.lightline.component_expand = {
  linter_checking= 'lightline#ale#checking',
  linter_warnings= 'lightline#ale#warnings',
  linter_errors= 'lightline#ale#errors',
  linter_ok= 'lightline#ale#ok',
}
g.lightline.component_type = {
  linter_checking= 'left',
  linter_warnings= 'warning',
  linter_errors= 'error',
  linter_ok= 'left',
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

g.indentLine_enabled = 1
g.indentLine_char = '|'

fn["ddc#custom#patch_global"]('sources', {'around', 'file', 'buffer', 'skkeleton', 'nvim-lsp'})
fn['ddc#custom#patch_global']('sourceOptions', {
  _= {
    matchers= {'matcher_head'},
    sorters= {'sorter_rank'}
  },
  file= {
    mark= 'F',
    isVolatile= true,
    forceCompletionPattern= [[\S/\S*]],
  },
  buffer= {mark= 'B'},
  skkeleton= {
    mark= 'skkeleton',
    matchers= {'skkeleton'},
    sorters= {}
  },
  ['nvim-lsp']= {
    mark="L",
    forceCompletionPattern=[[\.\w*|:\w*|->\w*]],
    kindLabels = { Class = "c"}
  }
})
fn['ddc#custom#patch_filetype']({'ps1', 'dosbatch', 'autohotkey', 'registry'}, {
  sourceOptions= {
    file= {
      forceCompletionPattern= [[\S\\\S*]],
    },
  }
})
fn['ddc#custom#patch_global']('sourceParams', {
  buffer= {
    requireSameFiletype=false,
    limitBytes=5000000,
    fromAltBuf=true,
    forceCollect=true,
  },
})
fn['ddc#custom#patch_global']('completionMenu', 'pum.vim')
fn['ddc#enable']()

g.quickrun_config = {
  markdown = {
    type = 'markdown/gfm',
    outputter = 'browser'
  }
}

keymap.set('i', '<Tab>', function()
  if(fn['pum#visible']()) then
    return '<Cmd>call pum#map#insert_relative(+1)<CR>'
  else
    if(fn.col('.') or fn.getline('.')[fn.col('.') - 2] ~= [[\s]]) then
      return '<TAB>'
    else
      fn['ddc#manual_complete']()
    end
  end
end)
keymap.set('i', '<S-Tab>', function()
  if(fn['pum#visible']()) then
    return '<Cmd>call pum#map#insert_relative(-1)<CR>'
  else
    return '<S-Tab>'
  end
end)
keymap.set('i', '<Enter>', function()
  if(fn['pum#visible']()) then
    return '<Cmd>call pum#map#confirm()<CR>'
  else
    return '<Enter>'
  end
end)
keymap.set({'i','c'}, 'jk', '<Plug>(skkeleton-toggle)', {remap = true})
keymap.set('i', '<Esc>', function()
  if(fn['skkeleton#is_enabled']()) then
    return '<Plug>(skkeleton-disable)'
  else
    return '<Esc>'
  end
end)
fn['skkeleton#config']({
  eggLikeNewline= true,
  globalJisyo= '~/.skk/SKK-JISYO.L',
  registerConvertResult= true
})
require("fidget").setup{}
require('nvim-treesitter.configs').setup {
  ensure_installed = { "c", "lua", "rust" },
  sync_install = false,
  highlight = {
    enable = true,
    --additional_vim_regex_highlighting = false,
  },
  rainbow = {
    enable = true,
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = nil, -- Do not enable for files with more than n lines, int
  },
  autotag = {
    enable = true
  }
}
require('gitsigns').setup()
require("nvim-gps").setup()
opt.termguicolors = true
require("bufferline").setup{}
require("scrollbar").setup()

require("nvim-lsp-installer").on_server_ready(function(server)
  server:setup({
    on_attach = function(client,buffer_number)
      print(vim.inspect(client))
      print(buffer_number)
    end
  })
end)
