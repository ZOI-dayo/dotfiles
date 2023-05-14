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
--[[
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
]]

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

opt.undodir = vim.env.HOME .. "/.vim/undo"
opt.undofile = true

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
--[[if not (file_exists('~/.local/share/nvim/site/pack/jetpack/opt/vim-jetpack/plugin/jetpack.vim')) then
  os.execute('curl -fLo ~/.local/share/nvim/site/pack/jetpack/opt/vim-jetpack/plugin/jetpack.vim --create-dirs https://raw.githubusercontent.com/tani/vim-jetpack/master/plugin/jetpack.vim')
end]]
-- vim.cmd('packadd vim-jetpack')
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
require('lazy').setup({
  -- {'tani/vim-jetpack', opt = 1},
  'vim-jp/vimdoc-ja',
  'markonm/traces.vim',
  'itchyny/lightline.vim',
  {'hallzy/lightline-iceberg', dependencies='lightline.vim'},
  'josa42/nvim-lightline-lsp',
  -- 'preservim/nerdtree',
  -- {'jistr/vim-nerdtree-tabs', dependencies='nerdtree'},
  'lambdalisue/nerdfont.vim',
  {'lambdalisue/glyph-palette.vim',
  dependencies={'vim-devicons', 'nerdfont.vim'},
  config=function()
    vim.cmd('augroup my-glyph-palette')
    vim.cmd('  autocmd! *')
    vim.cmd('  autocmd FileType fern call glyph_palette#apply()')
    vim.cmd('  autocmd FileType nerdtree,startify call glyph_palette#apply()')
    vim.cmd('augroup END')
  end},
  'lambdalisue/fern.vim',
  {'lambdalisue/fern-hijack.vim', dependencies='fern.vim'},
  {'lambdalisue/fern-renderer-nerdfont.vim', dependencies={'fern.vim', 'nerdfont.vim'}},
  'lambdalisue/fern-git-status.vim',
  'ryanoasis/vim-devicons',
  'nvim-tree/nvim-web-devicons',
  {'mengelbrecht/lightline-bufferline', dependencies='lightline.vim'},
  -- 'udalov/kotlin-vim',
  -- 'w0rp/ale',
  -- 'tpope/vim-fugitive', -- git
  -- 'maximbaz/lightline-ale',
  -- 'zoi-dayo/cheatsheet.vim',
  {'Yggdroot/indentLine', config=function() vim.g.indentLine_enabled = 1 vim.g.indentLine_char = '▏' end},
  -- 'thinca/vim-quickrun',
  -- 'mattn/webapi-vim',
  -- 'tyru/open-browser.vim',
  -- 'superbrothers/vim-quickrun-markdown-gfm',
  -- 'digitaltoad/vim-pug',
  -- {'prettier/vim-prettier', run = 'yarn install --frozen-lockfile --production' },
  --[[
  'vim-denops/denops.vim',
  {'Shougo/ddc.vim', dependencies='denops.vim'},
  {'Shougo/ddc-ui-pum', dependencies={'ddc.vim', 'pum.vim'}},
  {'Shougo/ddc-matcher_head', dependencies='ddc.vim'},
  {'Shougo/ddc-sorter_rank', dependencies='ddc.vim'},
  {'Shougo/ddc-around', dependencies='ddc.vim'},
  {'Shougo/ddc-source-nvim-lsp', dependencies='ddc.vim'},
  {'LumaKernel/ddc-source-file', dependencies='ddc.vim'},
  {'matsui54/ddc-buffer', dependencies='ddc.vim'},
  ]]
  'neovim/nvim-lspconfig',
  -- 'williamboman/nvim-lsp-installer', -- no longer maintained
  {'williamboman/mason.nvim'},
  {'williamboman/mason-lspconfig.nvim', dependencies={'mason.nvim', 'nvim-lspconfig'}},
  --[[
  {'Shougo/pum.vim', config=function()
    keymap.set('i', '<Up>', function()
      if(fn['pum#visible']()) then
        return '<Cmd>call pum#close()<CR><Up>'
      else
        return '<Up>'
      end
    end, {silent=true, expr=true})
    keymap.set('i', '<Down>', function()
      if(fn['pum#visible']()) then
        return '<Cmd>call pum#close()<CR><Down>'
      else
        return '<Down>'
      end
    end, {silent=true, expr=true})
  end},
  ]]
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-path',
  'hrsh7th/cmp-cmdline',
  'hrsh7th/nvim-cmp',
  -- 'vim-skk/skkeleton',
  -- {'delphinus/skkeleton_indicator.nvim', dependencies='skkeleton'},
  'vim-skk/eskk.vim',
  {'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },
  {'ntpeters/vim-better-whitespace', config=function() g.better_whitespace_guicolor='#880000' end},
  'lewis6991/gitsigns.nvim',
  'jghauser/mkdir.nvim',
  {'SmiteshP/nvim-navic', dependencies='nvim-lspconfig'},
  {'j-hui/fidget.nvim', dependencies='nvim-lspconfig'}, -- なぜか動かない
  {'petertriho/nvim-scrollbar'},
  -- 'Shougo/ddu.vim',
  -- 'Shougo/ddu-ui-ff',
  -- 'Shougo/ddu-kind-file',
  -- 'Shougo/ddu-source-file_rec',
  -- 'Shougo/ddu-filter-matcher_substring',
  -- 'Shougo/ddu-source-file_old',
  -- 'ray-x/lsp_signature.nvim',
  --[[
  'matsui54/denops-popup-preview.vim',
  'matsui54/denops-signature_help',
  ]]
  'vim-scripts/sudo.vim',
  -- 'ueokande/popupdict.vim',
  'github/copilot.vim',
  'nvim-lua/plenary.nvim',
  {'nvim-telescope/telescope.nvim', dependencies='plenary.nvim'},
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
    dependencies = {
      "nui.nvim",
      "nvim-notify"
    }
  },]]
  'hrsh7th/vim-vsnip',
  'hrsh7th/vim-vsnip-integ',
  'akinsho/toggleterm.nvim',
  'dstein64/vim-startuptime',
  --{'Shougo/ddx.vim', dependencies='denops.nvim'},
  'andweeb/presence.nvim',
  {'folke/trouble.nvim', dependencies = 'nvim-web-devicons', config = function()
    require('trouble').setup {}
  end},
  {'machakann/vim-sandwich', config=function() vim.cmd('let g:sandwich#recipes = deepcopy(g:sandwich#default_recipes)') end},
  -- 'segeljakt/vim-silicon', -- not working with neovide
  -- {'krivahtoo/silicon.nvim', run = './install.sh build'}, -- chash on neovide
  'mbbill/undotree',
  'rbtnn/vim-ambiwidth',
  {'mfussenegger/nvim-lint', config=function()
    require('lint').linters_by_ft = {
      cpp = {'cpplint'}
    }
    vim.api.nvim_create_autocmd({ "BufWritePost" }, {
      callback = function()
        require("lint").try_lint()
      end,
    })
  end},
  'thinca/vim-fontzoom',
  {'drzel/vim-gui-zoom', config = function()
    keymap.set('n', '<C-+>', ':ZoomIn<CR>')
    keymap.set('n', '<C-->', ':ZoomOut<CR>')
  end},
})

-- require ('settings.ddc')
require ('settings.lightline')
-- require('settings.navic')

require('settings.lsp')

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
require('settings.skk')

--treesitter
require('nvim-treesitter.configs').setup {
  ensure_installed = {'vim', 'lua', 'cpp'},
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


-- require"fidget".setup{}

keymap.set('t', '<ESC>', [[<C-\><C-n>]], {silent=true})

-- require "lsp_signature".setup({})
-- fn["signature_help#enable"]()
-- fn["popup_preview#enable"]()

-- api.nvim_create_user_command('Dict', function() g.popup_enabled = -g.popup_enabled + 1 end, {nargs = 1})

-- vim.g.copilot_node_command = "~/.nodenv/versions/16.16.0/bin/node"
-- g.copilot_no_tab_map = true
g.copilot_no_tab_map = true
keymap.set('i', '<C-J>', 'copilot#Accept("<CR>")', {silent=true, expr=true, script = true, replace_keycodes = false})



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
-- opt.splitbelow = true
-- vim.cmd('command! Term terminal')
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


local cmp = require'cmp'

cmp.setup({
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
      -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
      -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
      -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
    end,
  },
  window = {
    -- completion = cmp.config.window.bordered(),
    -- documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    ['<Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      else
        fallback()
      end
    end,
    ['<S-Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      else
        fallback()
      end
    end,
  }),
  sources = cmp.config.sources(
  {
    { name = 'nvim_lsp' },
    -- { name = 'vsnip' }, -- For vsnip users.
    -- { name = 'luasnip' }, -- For luasnip users.
    -- { name = 'ultisnips' }, -- For ultisnips users.
    -- { name = 'snippy' }, -- For snippy users.
  },
  {
    experimental = {
      ghost_text = true,
    },
    { name = 'buffer' },
  })
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
  sources = cmp.config.sources({
    { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
  }, {
    { name = 'buffer' },
  })
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})

-- Set up lspconfig.
-- local capabilities = require('cmp_nvim_lsp').default_capabilities()
-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
--[[require('lspconfig')['<YOUR_LSP_SERVER>'].setup {
  capabilities = capabilities
}]]

--[[
require('silicon').setup({
  font = 'FantasqueSansMono Nerd Font=16',
  theme = 'Monokai Extende',
})
]]

keymap.set('n', '<leader>u', ':UndotreeToggle<CR>')

-- なんか確率的にエラーでるんだけど
vim.g['fern#renderer']='nerdfont'
vim.cmd("redraw!")
