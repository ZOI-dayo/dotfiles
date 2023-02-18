local api = vim.api
local g = vim.g
local o = vim.o
local opt = vim.opt
local keymap = vim.keymap
local fn = vim.fn
function file_exists(path)
  return fn.filereadable(fn.expand(path)) ~= 0
end

-- default plugins
g.loaded_gzip = 1
g.loaded_tar = 1
g.loaded_tarPlugin = 1
g.loaded_zip = 1
g.loaded_zipPlugin = 1
g.loaded_rrhelper = 1
g.loaded_2html_plugin = 1
g.loaded_vimball = 1
g.loaded_vimballPlugin = 1
g.loaded_getscript = 1
g.loaded_getscriptPlugin = 1
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1
g.loaded_netrwSettings = 1
g.loaded_netrwFileHandlers = 1

g.mapleader = "\\"
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
opt.laststatus = 3
opt.wildmode = 'list:longest'
keymap.set('n', 'j', 'gj', {silent=true})
keymap.set('n', 'k', 'gk', {silent=true})
opt.whichwrap = 'b,s,h,l,<,>,[,],~'
opt.title = true
opt.list = true
opt.listchars = 'tab:▸-,space:･'
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
--[[
g.netrw_liststyle = 1
g.netrw_banner = 0
g.netrw_sizestyle = 'H'
g.netrw_timefmt = '%Y/%m/%d(%a) %H:%M:%S'
g.netrw_preview = 1
]]
vim.cmd('augroup readonly')
vim.cmd('autocmd!')
vim.cmd('autocmd BufEnter * if &readonly == 1 | set nomodifiable | else | set modifiable | endif')
vim.cmd('augroup END')
opt.guifont = 'Cica:h14'
opt.printfont = 'Cica:h9'
keymap.set('i', '<C-v>u', '<C-r>=nr2char(0x)<Left>', {remap = true})
keymap.set('v', 'x', '"_x')
keymap.set('n', 'x', '"_x')
vim.cmd('augroup cd-on-start')
vim.cmd('autocmd!')
vim.cmd([[autocmd VimEnter * execute ":cd ".fnamemodify(substitute(expand("%"), ".*file:\\\/\\\/\\|\\$$", "", "g"), ":p:h")]])
vim.cmd('augroup END')
keymap.set('n', '<S-Left>', '<C-w><<CR>')
keymap.set('n', '<S-Right>', '<C-w>><CR>')
keymap.set('n', '<S-Up>', '<C-w>-<CR>')
keymap.set('n', '<S-Down>', '<C-w>+<CR>')

if g.neovide then
  g.mapleader = "¥"
  -- Helper function for transparency formatting
  local alpha = function()
    return string.format("%x", math.floor(255 * g.neovide_transparency_point or 0.8))
  end
  -- g:neovide_transparency should be 0 if you want to unify transparency of content and title bar.
  g.neovide_transparency = 0.0
  g.neovide_transparency_point = 1.0
  g.neovide_background_color = "#0f1117" .. alpha()
  g.neovide_confirm_quit = true
  g.neovide_input_use_logo = 1 -- enable use of the logo (cmd) key
  g.neovide_background_image_path = "/Users/zoi/.neovide/background/Vol.3.png"
  g.neovide_background_image_transparent = 0.25
  keymap.set('n', '<D-s>', ':w<CR>') -- Save
  keymap.set('v', '<D-c>', '"+y') -- Copy
  keymap.set('n', '<D-v>', '"+P') -- Paste normal mode
  keymap.set('v', '<D-v>', '"+P') -- Paste visual mode
  keymap.set('c', '<D-v>', '<C-R>+') -- Paste command mode
  keymap.set('i', '<D-v>', '<ESC>l"+Pli') -- Paste insert mode
  -- g.neovide_profiler = true
end

-- opt.ambiwidth = 'double'
if not (file_exists('~/.local/share/nvim/site/pack/jetpack/opt/vim-jetpack/plugin/jetpack.vim')) then
  os.execute('curl -fLo ~/.local/share/nvim/site/pack/jetpack/opt/vim-jetpack/plugin/jetpack.vim --create-dirs https://raw.githubusercontent.com/tani/vim-jetpack/master/plugin/jetpack.vim')
end
vim.cmd('packadd vim-jetpack')
require('jetpack.paq') {
  {'tani/vim-jetpack', opt = 1},
  'vim-jp/vimdoc-ja',
  'markonm/traces.vim',
  'itchyny/lightline.vim',
  {'hallzy/lightline-iceberg', requires='lightline.vim'},
  'josa42/nvim-lightline-lsp',
  -- 'preservim/nerdtree',
  -- {'jistr/vim-nerdtree-tabs', requires='nerdtree'},
  'lambdalisue/nerdfont.vim',
  {'lambdalisue/glyph-palette.vim',
  requires={'vim-devicons', 'nerdfont.vim', 'fern-renderer-nerdfont.vim'},
  config=function()
    vim.cmd('augroup my-glyph-palette')
    vim.cmd('  autocmd! *')
    vim.cmd('  autocmd FileType fern call glyph_palette#apply()')
    vim.cmd('  autocmd FileType nerdtree,startify call glyph_palette#apply()')
    vim.cmd('augroup END')
  end},
  'lambdalisue/fern.vim',
  {'lambdalisue/fern-hijack.vim', requires='fern.vim'},
  {'lambdalisue/fern-renderer-nerdfont.vim', requires={'fern.vim', 'nerdfont.vim'}, config=function() vim.g['fern#renderer']='nerdfont' vim.cmd("redraw!") end},
  'lambdalisue/fern-git-status.vim',
  'ryanoasis/vim-devicons',
  'nvim-tree/nvim-web-devicons',
  {'mengelbrecht/lightline-bufferline', requires='lightline.vim'},
  -- 'udalov/kotlin-vim',
  -- 'w0rp/ale',
  -- 'tpope/vim-fugitive',
  -- 'maximbaz/lightline-ale',
  -- 'zoi-dayo/cheatsheet.vim',
  {'Yggdroot/indentLine', config=function() vim.g.indentLine_enabled = 1 vim.g.indentLine_char = '▏' end},
  -- 'thinca/vim-quickrun',
  -- 'mattn/webapi-vim',
  -- 'tyru/open-browser.vim',
  -- 'superbrothers/vim-quickrun-markdown-gfm',
  -- 'digitaltoad/vim-pug',
  -- {'prettier/vim-prettier', run = 'yarn install --frozen-lockfile --production' },
  'vim-denops/denops.vim',
  {'Shougo/ddc.vim', requires='denops.vim'},
  {'Shougo/ddc-ui-pum', requires={'ddc.vim', 'pum.vim'}},
  {'Shougo/ddc-matcher_head', requires='ddc.vim'},
  {'Shougo/ddc-sorter_rank', requires='ddc.vim'},
  {'Shougo/ddc-around', requires='ddc.vim'},
  {'Shougo/ddc-source-nvim-lsp', requires='ddc.vim'},
  {'LumaKernel/ddc-source-file', requires='ddc.vim'},
  {'matsui54/ddc-buffer', requires='ddc.vim'},
  'neovim/nvim-lspconfig',
  -- 'williamboman/nvim-lsp-installer', -- no longer maintained
  {'williamboman/mason.nvim'},
  {'williamboman/mason-lspconfig.nvim', requires={'mason.nvim', 'nvim-lspconfig'}, config=function()
    require('settings.mason')
  end},
  'Shougo/pum.vim',
  'vim-skk/skkeleton',
  {'delphinus/skkeleton_indicator.nvim', requires='skkeleton'},
  {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' },
  'ntpeters/vim-better-whitespace',
  'lewis6991/gitsigns.nvim',
  'jghauser/mkdir.nvim',
  {'SmiteshP/nvim-navic', requires='nvim-lspconfig'--[[, config=function()require('settings.navic')end]]},
  {'j-hui/fidget.nvim', requires='nvim-lspconfig'},
  {'petertriho/nvim-scrollbar'},
  -- 'Shougo/ddu.vim',
  -- 'Shougo/ddu-ui-ff',
  -- 'Shougo/ddu-kind-file',
  -- 'Shougo/ddu-source-file_rec',
  -- 'Shougo/ddu-filter-matcher_substring',
  -- 'Shougo/ddu-source-file_old',
  -- 'ray-x/lsp_signature.nvim',
  'matsui54/denops-popup-preview.vim',
  'matsui54/denops-signature_help',
  'vim-scripts/sudo.vim',
  -- 'ueokande/popupdict.vim',
  -- 'github/copilot.vim',
  'nvim-lua/plenary.nvim',
  {'nvim-telescope/telescope.nvim', requires='plenary.nvim'},
  -- {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
  --  "MunifTanjim/nui.nvim",
  'rcarriga/nvim-notify',
  --[[ {
    "folke/noice.nvim",
    config = function()
      require("noice").setup({
        -- add any options here
      })
    end,
    requires = {
      "nui.nvim",
      "nvim-notify"
    }
  },]]
  'hrsh7th/vim-vsnip',
  'hrsh7th/vim-vsnip-integ',
  'akinsho/toggleterm.nvim',
  'dstein64/vim-startuptime',
  {'Shougo/ddx.vim', requires='denops.nvim'},
  'andweeb/presence.nvim',
  {'folke/trouble.nvim', requires = 'nvim-web-devicons', config = function()
    require('trouble').setup {}
  end},
  {'machakann/vim-sandwich', config=function() vim.cmd('let g:sandwich#recipes = deepcopy(g:sandwich#default_recipes)') end},
}

require ('settings.ddc')
require ('settings.lightline')
require('settings.navic')

--[[
-- NERDTree
vim.cmd("let NERDTreeShowHidden = 1")
vim.cmd('command! Tree NERDTreeTabsToggle')
g.nerdtree_tabs_open_on_gui_startup = 0
if not(file_exists('~/.config/nvim/colors/iceberg.vim')) then
  os.execute('curl -fLo ~/.config/nvim/colors/iceberg.vim --create-dirs https://raw.githubusercontent.com/cocopon/iceberg.vim/master/colors/iceberg.vim')
end
]]

-- Fern
g['fern#default_hidden']=1
vim.cmd('command! Tree Fern . -drawer -reveal=%')

-- theme
opt.background = 'dark'
vim.cmd('colorscheme iceberg')
g.WebDevIconsUnicodeDecorateFolderNodes = 1


--[[ g.quickrun_config = {
  markdown = {
    type = 'markdown/gfm',
    outputter = 'browser'
  }
}]]

-- skkeleton
require('settings.skkeleton')

--treesitter
require('nvim-treesitter.configs').setup {
  ensure_installed = {'vim', 'help', 'lua'},
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

-- gitsigns
require('gitsigns').setup {
  signcolumn = false,
  numhl = true,
}
opt.termguicolors = true

require("scrollbar").setup()

--[[ keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
g['lsp_diagnostics_echo_cursor'] = 1
]]
--[[ require("nvim-lsp-installer").on_server_ready(function(server)
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
]]
require"fidget".setup{}


--[[fn["ddu#custom#patch_global"]({
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
]]
-- function ddu_my_settings()
  --   keymap.set('n', '<CR>', [[<Cmd>call ddu#ui#ff#do_action('itemAction')<CR>]] ,{buffer=true, silent=true})
  --   keymap.set('n', '<Space>', [[<Cmd>call ddu#ui#ff#do_action('toggleSelectItem')<CR>]] ,{buffer=true, silent=true})
  --   keymap.set('n', 'i', [[<Cmd>call ddu#ui#ff#do_action('openFilterWindow')<CR>]] ,{buffer=true, silent=true})
  --   keymap.set('n', 'q', [[<Cmd>call ddu#ui#ff#do_action('quit')<CR>]] ,{buffer=true, silent=true})
  -- end
  -- vim.cmd('autocmd FileType ddu-ff call v:lua.ddu_my_settings()')
  -- function ddu_filter_my_settings()
    --   keymap.set('i', '<CR>', [[<Esc><Cmd>close<CR>]] ,{buffer=true, silent=true})
    --   keymap.set('n', '<CR>', [[<Cmd>close<CR>]] ,{buffer=true, silent=true})
    --   keymap.set('n', 'q', [[<Cmd>close<CR>]] ,{buffer=true, silent=true})
    -- end
    -- vim.cmd('autocmd FileType ddu-ff-filter call v:lua.ddu_filter_my_settings()')
    -- -- keymap.set('n', ';;', [[<Cmd>call ddu#start({})<CR>]] ,{buffer=true, silent=true})
    -- keymap.set('n', ';f', [[<Cmd>call ddu#start({'sources': [{'name': 'file_rec'}], 'sourceOptions': {'file_rec': {'path': getcwd()}}})<CR>]] ,{buffer=true, silent=true})
    -- keymap.set('n', ';h', [[<Cmd>call ddu#start({'sources': [{'name': 'file_old'}]})<CR>]] ,{buffer=true, silent=true})

    keymap.set('t', '<ESC>', [[<C-\><C-n>]], {silent=true})

    -- require "lsp_signature".setup({})
    fn["signature_help#enable"]()
    fn["popup_preview#enable"]()

    -- api.nvim_create_user_command('Dict', function() g.popup_enabled = -g.popup_enabled + 1 end, {nargs = 1})

    -- vim.g.copilot_node_command = "~/.nodenv/versions/16.16.0/bin/node"
    -- g.copilot_no_tab_map = true



    local actions_layout = require("telescope.actions.layout")
    local themes = require("telescope.themes")
    require("telescope").setup(themes.get_ivy({
      defaults = {},
    }))
    require("telescope").setup(themes.get_ivy({
      defaults = {
        selection_caret = "  ",
      },
    }))
    -- require("telescope").load_extension("fzf")
    --[[ require('telescope').setup({
      defaults = {
        layout_config = {
          vertical = { width = 0.5 }
        },
      },
      pickers = {
        find_files = {
          theme = "cursor",
        }
      },
    })]]

    local builtin = require('telescope.builtin')
    keymap.set('n', '<leader>ff', builtin.find_files, {})
    keymap.set('n', '<leader>fg', builtin.live_grep, {})
    keymap.set('n', '<leader>fb', builtin.buffers, {})
    keymap.set('n', '<leader>fh', builtin.help_tags, {})

    --[[ require'nvim-web-devicons'.setup {
      override = {
        zsh = {
          icon = "",
          color = "#428850",
          cterm_color = "65",
          name = "Zsh"
        }
      };
      color_icons = true;
      default = true;
    }
    ]]

    require("toggleterm").setup()
    vim.cmd('command! Term ToggleTerm')
    vim.cmd('command! Format lua vim.lsp.buf.format()')

    vim.keymap.set('n', '<leader>qf', function()
      vim.lsp.buf.code_action({
        filter = function(a) return a.isPreferred end,
        apply = true
      })
    end, { noremap=true, silent=true })

    local opts = { noremap=true, silent=true }
    keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
    keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
    keymap.set('n', ']d', vim.diagnostic.goto_next, opts)


    require("presence").setup({
      log_level           = "error",
      editing_text        = "%sを編集中",
      file_explorer_text  = "%sを探索中",
      git_commit_text     = "変更をコミット中",
      plugin_manager_text = "プラグインを整理中",
      reading_text        = "%sを読み中",
      workspace_text      = "%sで仕事中",
      line_number_text    = "%s/%s行目にいます",
    })
