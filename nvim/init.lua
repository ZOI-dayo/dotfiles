local api = vim.api
local g = vim.g
local o = vim.o
local opt = vim.opt
local keymap = vim.keymap
local fn = vim.fn
function file_exists(name)
  return fn.empty(fn.glob(path)) == 1
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
keymap.set('n', 'j', 'gj', {silent=true})
keymap.set('n', 'k', 'gk', {silent=true})
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
-- opt.ambiwidth = 'double'
-- vim.cmd('command Term bo terminal')
-- g.ale_disable_lsp = 1
if not (file_exists('~/.config/nvim/autoload/jetpack.vim')) then
  os.execute('curl -fLo ~/.config/nvim/autoload/jetpack.vim --create-dirs https://raw.githubusercontent.com/tani/vim-jetpack/master/autoload/jetpack.vim')
  -- vim.cmd('autocmd VimEnter * JetpackSync | source $MYVIMRC')
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
  -- 'w0rp/ale',
  'tpope/vim-fugitive',
  -- 'maximbaz/lightline-ale',
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
  {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'},
  'ntpeters/vim-better-whitespace',
  'lewis6991/gitsigns.nvim',
  'jghauser/mkdir.nvim',
  "SmiteshP/nvim-gps",
  'j-hui/fidget.nvim',
  'petertriho/nvim-scrollbar',
  'delphinus/skkeleton_indicator.nvim',
  'Shougo/ddu.vim',
  'Shougo/ddu-ui-ff',
  'Shougo/ddu-kind-file',
  'Shougo/ddu-source-file_rec',
  'Shougo/ddu-filter-matcher_substring',
  'Shougo/ddu-source-file_old',
  'ray-x/lsp_signature.nvim',
  'denops-popup-preview.vim',
  'denops-signature_help',
}
-- require ('settings.ale')
require ('settings.ddc')
require ('settings.lightline')
-- vim.cmd('command Jetpack JetpackSync')
vim.cmd("let NERDTreeShowHidden = 1")
vim.cmd('command! Tree NERDTreeTabsToggle')
g.nerdtree_tabs_open_on_gui_startup = 0
if not(file_exists('~/.config/nvim/colors/iceberg.vim')) then
  os.execute('curl -fLo ~/.config/nvim/colors/iceberg.vim --create-dirs https://raw.githubusercontent.com/cocopon/iceberg.vim/master/colors/iceberg.vim')
end
opt.background = 'dark'
vim.cmd('colorscheme iceberg')
g.WebDevIconsUnicodeDecorateFolderNodes = 1

g.indentLine_enabled = 1
g.indentLine_char = '|'

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
end, {silent=true, expr=true})
keymap.set('i', '<S-Tab>', function()
  if(fn['pum#visible']()) then
    return '<Cmd>call pum#map#insert_relative(-1)<CR>'
  else
    return '<S-Tab>'
  end
end, {silent=true, expr=true})
keymap.set('i', '<Enter>', function()
  if(fn['pum#visible']() == 1) then
    return '<Cmd>call pum#map#confirm()<CR>'
  else
    return '<Enter>'
  end
end, {silent=true, expr=true})
keymap.set({'i', 'c'}, 'jk', '<Plug>(skkeleton-toggle)')
fn["skkeleton#register_kanatable"]('rom', {jk = 'disable'})
--[[ keymap.set('i', '<Esc>', function()
  if(fn['skkeleton#is_enabled']()) then
    return '<Plug>(skkeleton-disable)'
  else
    return '<Esc>'
  end
end, {expr=true})
]]
fn['skkeleton#config']({
  eggLikeNewline= true,
  globalJisyo= '~/.skk/SKK-JISYO.L',
  registerConvertResult= true
})
require('nvim-treesitter.configs').setup {
  ensure_installed = {},
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
require("scrollbar").setup()

keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)

require("nvim-lsp-installer").on_server_ready(function(server)
  local opts = {}

  opts.on_attach = function(client,buffer_number)
    -- print(vim.inspect(client))
    -- print(buffer_number)
  end

  server:setup(opts)
end)
require("nvim-lsp-installer").settings({
  ui = {
    icons = {
      server_installed = '◍',
      server_pending = '◍',
      server_uninstalled = '◍',
    },
    keymaps = {
      toggle_server_expand = '<CR>',
      install_server = 'i',
      update_server = 'u',
      uninstall_server = 'x',
    },
  },
})
require"fidget".setup{}
function _G.disable_arrows()
  if not (file_exists('/Library/Application Support/org.pqrs/Karabiner-Elements/bin/karabiner_cli')) then return end
  os.execute([['/Library/Application Support/org.pqrs/Karabiner-Elements/bin/karabiner_cli' --set-variables '{"nvim_enable_arrows": false}']])
end
function _G.enable_arrows()
  if not (file_exists('/Library/Application Support/org.pqrs/Karabiner-Elements/bin/karabiner_cli')) then return end
  os.execute([['/Library/Application Support/org.pqrs/Karabiner-Elements/bin/karabiner_cli' --set-variables '{"nvim_enable_arrows": true}']])
end
vim.cmd("augroup skkeleton_karabiner")
vim.cmd("  autocmd!")
vim.cmd("  autocmd VimEnter call v:lua.enable_arrows()")
vim.cmd("  autocmd User skkeleton-enable-pre call v:lua.disable_arrows()")
vim.cmd("  autocmd User skkeleton-disable-pre call v:lua.enable_arrows()")
vim.cmd("augroup END")
require('skkeleton_indicator').setup{}
fn["ddu#custom#patch_global"]({
  ui= 'ff',
  sources= {
    {
      name={{name= 'file_rec', params= {}},
          {name= 'file'},
          {name= 'colorscheme'},
          {name= 'buffer'},
          {name= 'file_old'}},
      params= {
        ignoredDirectories= {'.git', 'node_modules', 'vendor', '.next'}
      }
    }
  },
  sourceOptions= {
    ['_']= {
      matchers= {'matcher_substring'},
    },
  },
  filterParams= {
    matcher_substring= {
      highlightMatched= 'Title',
    },
  },
  kindOptions= {
    file= {
      defaultAction= 'open',
    },
  },
  uiParams= {
    ff= {
      startFilter= true,
      prompt= '> ',
      split= 'floating',
    }
  },
})
fn["ddu#custom#patch_local"]('grep', {
   uiParams= {
     ff= {
       startFilter= false,
     }
   },
 })
function ddu_my_settings()
  keymap.set('n', '<CR>', [[<Cmd>call ddu#ui#ff#do_action('itemAction')<CR>]] ,{buffer=true, silent=true})
  keymap.set('n', '<Space>', [[<Cmd>call ddu#ui#ff#do_action('toggleSelectItem')<CR>]] ,{buffer=true, silent=true})
  keymap.set('n', 'i', [[<Cmd>call ddu#ui#ff#do_action('openFilterWindow')<CR>]] ,{buffer=true, silent=true})
  keymap.set('n', 'q', [[<Cmd>call ddu#ui#ff#do_action('quit')<CR>]] ,{buffer=true, silent=true})
end
vim.cmd('autocmd FileType ddu-ff call v:lua.ddu_my_settings()')
function ddu_filter_my_settings()
  keymap.set('i', '<CR>', [[<Esc><Cmd>close<CR>]] ,{buffer=true, silent=true})
  keymap.set('n', '<CR>', [[<Cmd>close<CR>]] ,{buffer=true, silent=true})
  keymap.set('n', 'q', [[<Cmd>close<CR>]] ,{buffer=true, silent=true})
end
vim.cmd('autocmd FileType ddu-ff-filter call v:lua.ddu_filter_my_settings()')
-- keymap.set('n', ';;', [[<Cmd>call ddu#start({})<CR>]] ,{buffer=true, silent=true})
keymap.set('n', ';f', [[<Cmd>call ddu#start({'sources': [{'name': 'file_rec'}], 'sourceOptions': {'file_rec': {'path': getcwd()}}})<CR>]] ,{buffer=true, silent=true})
keymap.set('n', ';h', [[<Cmd>call ddu#start({'sources': [{'name': 'file_old'}]})<CR>]] ,{buffer=true, silent=true})

keymap.set('t', '<ESC>', [[<C-\><C-n>]], {silent=true})

-- require "lsp_signature".setup({})
fn["signature_help#enable"]()
fn["popup_preview#enable"]()

