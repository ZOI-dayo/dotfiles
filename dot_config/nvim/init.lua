local api = vim.api
local g = vim.g
local o = vim.o
local bo = vim.bo
local opt = vim.opt
local keymap = vim.keymap
local fn = vim.fn
local function file_exists(path)
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
opt.helplang = 'ja'
opt.number = true
opt.numberwidth = 3
-- opt.cursorline = true
opt.virtualedit = 'onemore'
opt.smartindent = true
opt.visualbell = true
opt.showmatch = true
opt.laststatus = 3
-- opt.laststatus = 2
opt.wildmode = 'list:longest'
keymap.set('n', 'j', 'gj', {silent=true})
keymap.set('n', 'k', 'gk', {silent=true})
opt.whichwrap = 'b,s,h,l,<,>,[,],~'
opt.title = true
opt.list = true
opt.listchars = 'tab:▸-,space:･,eol:↲'
opt.expandtab = true
opt.tabstop = 2
opt.shiftwidth = 2
opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true
opt.wrapscan = true
opt.hlsearch = true
opt.relativenumber = true
opt.signcolumn = 'yes'
keymap.set('n', ';', '$', {silent=true})
keymap.set('n', '<Esc><Esc>', ':nohlsearch<CR><ESC>', {remap = true})
keymap.set('n', '  ', ':nohlsearch<CR><ESC>', {remap = true})
opt.clipboard = 'unnamedplus'
api.nvim_create_autocmd('BufEnter', {
  group = api.nvim_create_augroup('AutoCommentOff', { clear = true }),
  command = 'setlocal formatoptions-=cro',
})
--[[
vim.cmd('augroup auto_comment_off')
vim.cmd('autocmd!')
-- vim.cmd('autocmd BufEnter * setlocal formatoptions-=r')
vim.cmd('autocmd BufEnter * setlocal formatoptions-=o')
vim.cmd('augroup END')
]]
opt.mouse = 'a'
keymap.set('n', '<RightMouse>', '<Nop>')
keymap.set('i', '<RightMouse>', '<Nop>')
opt.foldenable = false
-- opt.foldcolumn = "0"
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.cmd('filetype plugin on')

--[[
g.netrw_liststyle = 1
g.netrw_banner = 0
g.netrw_sizestyle = 'H'
g.netrw_timefmt = '%Y/%m/%d(%a) %H:%M:%S'
g.netrw_preview = 1
]]

api.nvim_create_autocmd('BufEnter', {
  group = api.nvim_create_augroup('Readonly', { clear = true }),
  command = 'if &readonly == 1 | set nomodifiable | else | set modifiable | endif',
})
--[[
vim.cmd('augroup readonly')
vim.cmd('autocmd!')
vim.cmd('autocmd BufEnter * if &readonly == 1 | set nomodifiable | else | set modifiable | endif')
vim.cmd('augroup END')
]]
opt.guifont = 'Cica:h16'

opt.termguicolors = true
-- opt.printfont = 'Cica:h9'
keymap.set('i', '<C-v>u', '<C-r>=nr2char(0x)<Left>', {remap = true})
keymap.set('v', 'x', '"_x')
keymap.set('n', 'x', '"_x')
keymap.set('n', '<S-Left>', '<C-w><<CR>')
keymap.set('n', '<S-Right>', '<C-w>><CR>')
keymap.set('n', '<S-Up>', '<C-w>-<CR>')
keymap.set('n', '<S-Down>', '<C-w>+<CR>')

opt.undodir = vim.env.HOME .. "/.vim/undo"
opt.undofile = true

g.python3_host_prog = '~/.pyenv/shims/python'

keymap.set('n', 'gb', ':bnext<CR>')
keymap.set('n', 'gB', ':bprev<CR>')

g.markdown_recommended_style = 0

--[[
api.nvim_create_autocmd("VimEnter", {
  callback = function()
    require("telescope").extensions.recent_files.pick(require('telescope.themes').get_dropdown())
  end
})
]]

if g.neovide then
  g.mapleader = "¥"
  -- Helper function for transparency formatting
  local alpha = function()
    return string.format("%x", math.floor((255 * g.neovide_transparency_point) or 0.8))
  end
  -- g:neovide_transparency should be 0 if you want to unify transparency of content and title bar.

  g.neovide_transparency = 0.0
  g.neovide_transparency_point = 1.0
  g.neovide_background_color = "#0f1117" .. alpha()
  g.neovide_background_image_path = "/Users/zoi/.neovide/background/Vol.3.png"
  g.neovide_background_image_transparent = 0.25

  g.neovide_confirm_quit = true
  g.neovide_input_use_logo = 1 -- enable use of the logo (cmd) key
  g.neovide_touch_deadzone = 6.0
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
local lazypath = fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
opt.rtp:prepend(lazypath)
require('lazy').setup({
  --[[
  {
    'cocopon/iceberg.vim',
    config = function()
      vim.cmd('colorscheme iceberg')
      opt.background = 'dark'
    end,
  },
  ]]
  'vim-jp/vimdoc-ja',
  'markonm/traces.vim',
  {
    'nvim-lualine/lualine.nvim',
    dependencies = {
      'nvim-web-devicons',
      -- 'iceberg.vim',
      'nightfox.nvim',
      'eskk.vim',
    },
    config = function()
      local function eskk()
        if(api.nvim_get_mode().mode == 'i' and fn['eskk#is_enabled']() == 1) then
          return fn['eskk#statusline']()
        else
          return ''
        end
      end
      local custom_fname = require('lualine.components.filename'):extend()
      local highlight = require'lualine.highlight'
      local default_status_colors = { saved = '#228B22', modified = '#C70039' }

      function custom_fname:init(options)
        custom_fname.super.init(self, options)
        self.status_colors = {
          saved = highlight.create_component_highlight_group(
            {bg = default_status_colors.saved}, 'filename_status_saved', self.options),
          modified = highlight.create_component_highlight_group(
            {bg = default_status_colors.modified}, 'filename_status_modified', self.options),
        }
        if self.options.color == nil then self.options.color = '' end
      end

      function custom_fname:update_status()
        local data = custom_fname.super.update_status(self)
        data = highlight.component_format_highlight(vim.bo.modified
          and self.status_colors.modified
          or self.status_colors.saved) .. data
        return data
      end

      require('lualine').setup {
        options = {
          icons_enabled = true,
          -- theme = 'iceberg',
          component_separators = { left = '', right = ''},
          section_separators = { left = '󾂰', right = '󾂲'},
          disabled_filetypes = {
            statusline = {},
            winbar = {},
          },
          ignore_focus = {},
          always_divide_middle = true,
          globalstatus = true,
          refresh = {
            statusline = 1000,
            tabline = 1000,
            winbar = 1000,
          }
        },
        sections = {
          lualine_a = {'mode', eskk},
          lualine_b = {'branch', 'diff', 'diagnostics'},
          lualine_c = {'filename'},
          lualine_x = {'encoding', 'fileformat', 'filesize', 'filetype'},
          lualine_y = {'progress'},
          lualine_z = {'location'}
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = {'filename', custom_fname},
          lualine_x = {'location'},
          lualine_y = {},
          lualine_z = {}
        },
        tabline = {
          lualine_a = {
            {
              'tabs',
              mode = 1,
            }
            -- 'buffers'
          },
          lualine_b = {},
          lualine_c = {},
          lualine_x = {},
          lualine_y = {},
          lualine_z = {'searchcount'}
        },
        winbar = {},
        inactive_winbar = {},
        extensions = {}
      }
    end,
  },
  -- 'lambdalisue/nerdfont.vim',
  -- {'Yggdroot/indentLine', config = function() g.indentLine_enabled = 1 g.indentLine_char = '▏' end},
  {
    'lukas-reineke/indent-blankline.nvim',
    opts = {},
    config = function()
      require("ibl").setup {
        -- char = "▏",
        -- buftype_exclude = {"terminal"},
        -- filetype_exclude = {"help", "packer", "dashboard", "NvimTree", "TelescopePrompt", "TelescopeResults", "Trouble"},
        -- show_current_context = true,
        -- show_current_context_start = true,
      }
    end
  },
  {
    'williamboman/mason.nvim',
    dependencies = {
      'nvim-lspconfig',
      'mason-lspconfig.nvim',
    },
    opts = {
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗"
        }
      }
    },
    event = 'BufRead',
  },
  -- {
    -- 'lvimuser/lsp-inlayhints.nvim',
    -- opts = {},
  -- },
  {
    'williamboman/mason-lspconfig.nvim',
    dependencies = {
      'mason.nvim',
      'neovim/nvim-lspconfig',
      'cmp-nvim-lsp',
      -- 'lsp-inlayhints.nvim',
    },
    config = function()
      local lspconfig = require('lspconfig')
      local mason_lspconfig = require('mason-lspconfig')
      local cmp_nvim_lsp = require("cmp_nvim_lsp")
      -- local lsp_inlayhints = require("lsp-inlayhints")
      mason_lspconfig.setup_handlers({
        function(server_name)
          local capabilities = vim.lsp.protocol.make_client_capabilities()
          capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
          local opts = {
            capabilities = capabilities,
            on_attach = function(client, bufnr)
              local bufopts = { silent = true, buffer = bufnr }
              vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
              vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
              vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
              vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
              vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
              vim.keymap.set('n', 'gf', vim.lsp.buf.format, bufopts)
              vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
              vim.keymap.set('n', '<leader>fx', vim.lsp.buf.code_action, bufopts)
              vim.keymap.set('n', '<leader>K', vim.diagnostic.open_float, bufopts)
              -- lsp_inlayhints.on_attach(client, bufnr)

              vim.api.nvim_create_augroup("lsp_augroup", { clear = true })
              vim.api.nvim_create_autocmd("InsertEnter", {
                buffer = bufnr,
                callback = function() vim.lsp.inlay_hint.enable(bufnr, true) end,
                group = "lsp_augroup",
              })
              vim.api.nvim_create_autocmd("InsertLeave", {
                buffer = bufnr,
                callback = function() vim.lsp.inlay_hint.enable(bufnr, false) end,
                group = "lsp_augroup",
              })
            end
          }
          local node_root_dir = lspconfig.util.root_pattern("package.json")
          local is_node_dir = node_root_dir(vim.api.nvim_buf_get_name(0)) ~= nil
          if(server_name == 'denols') then
            if is_node_dir then return end
            opts.root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc")
            opts.init_options = {
              lint = true,
              unstable = true,
              suggest = {
                imports = {
                  hosts = {
                    ["https://deno.land"] = true,
                    ["https://cdn.nest.land"] = true,
                    ["https://crux.land"] = true,
                  },
                },
              },
            }
          elseif(server_name == 'tsserver') then
            if not is_node_dir then return end
            opts.root_dir = node_root_dir
          elseif(server_name == 'lua_ls') then
            opts.settings = { Lua = { diagnostics = { globals = { 'vim' }}}}
          elseif(server_name == 'clangd') then
            opts.capabilities = cmp_nvim_lsp.default_capabilities()
            opts.cmd = {
              "clangd",
              "--offset-encoding=utf-16",
              "--all-scopes-completion",
              "--suggest-missing-includes",
              "--background-index",
              "--pch-storage=disk",
              "--cross-file-rename",
              "--log=info",
              "--completion-style=detailed",
              "--enable-config", -- clangd 11+ supports reading from .clangd configuration file
              "--clang-tidy",
              -- "--clang-tidy-checks=-*,llvm-*,clang-analyzer-*,modernize-*,-modernize-use-trailing-return-type",
              -- "--fallback-style=Google",
              -- "--header-insertion=never",
              -- "--query-driver=<list-of-white-listed-complers>"
            }
          end

          lspconfig[server_name].setup(opts)
        end
      })
    end
  },
  -- {'j-hui/fidget.nvim', dependencies = 'nvim-lspconfig', config = function() require'fidget'.setup{} end},

  {
    'dcampos/nvim-snippy',
    opts = {
      mappings = {
        is = {
          ['<Tab>'] = 'expand_or_advance',
          ['<S-Tab>'] = 'previous',
        },
        nx = {
          ['<leader>x'] = 'cut_text',
        },
      },
    },
  },
  --[[
  {
    'zbirenbaum/copilot-cmp',
    dependencies = { 'copilot.lua' },
    config = function ()
      require('copilot_cmp').setup()
    end
  },
  ]]
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      --'hrsh7th/cmp-vsnip',
      'nvim-snippy',
      'dcampos/cmp-snippy',
      -- 'hrsh7th/cmp-copilot',
      -- 'copilot-cmp',
      'hrsh7th/cmp-emoji',
      'chrisgrieser/cmp-nerdfont',
      {
        'KadoBOT/cmp-plugins',
        opts = {
          files = { ".*\\.lua" }  -- default
        }
      },
      'hrsh7th/cmp-nvim-lsp-signature-help',
      --'vim-vsnip',
    },
    config = function()
      local cmp = require'cmp'

      cmp.setup({
        -- view = 'wildmenu',
        snippet = {
          expand = function(args)
            -- vim.fn["vsnip#anonymous"](args.body)
            require('snippy').expand_snippet(args.body)
          end,
        },
        window = {
          -- completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.abort(),
          ['<CR>'] = cmp.mapping.confirm({ select = false }),
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
            { name = 'path' },
            --{ name = 'vsnip' },
            { name = 'snippy' },
            -- { name = 'copilot' },
            { name = 'emoji' },
            { name = 'nerdfont' },
            { name = 'plugins' },
            { name = 'nvim_lsp_signature_help' },
          },
          {
            { name = 'buffer' },
          }),
        experimental = {
          -- ghost_text = true,
        },
        preselect = cmp.PreselectMode.None,
      })
      -- opt.completeopt = 'menu,menuone,noselect'
      cmp.setup.cmdline({ '/', '?' }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = 'buffer' }
        }
      })

      cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources(
          {
            { name = 'path' }
          }, {
            { name = 'cmdline' }
          }
        )
      })
    end,
  },
  --'hrsh7th/vim-vsnip',
  --'hrsh7th/vim-vsnip-integ',
  {
    'vim-skk/eskk.vim',
    config = function()
      vim.g['eskk#directory'] = '~/.skk'
      vim.g['eskk#large_dictionary'] = {
        path = '~/.skk/SKK-JISYO.L',
        sorted = 1,
        encoding = 'euc-jp',
      }
      api.nvim_create_autocmd('VimEnter', {

        callback = function()
          keymap.set({'i','c'}, 'jk', '<Plug>(eskk:toggle)')
        end
      })
      --[[
      vim.cmd('autocmd VimEnter * imap jk <Plug>(eskk:toggle)')
      vim.cmd('autocmd VimEnter * cmap jk <Plug>(eskk:toggle)')
      ]]
    end,
  },
  {
    'nvim-treesitter/nvim-treesitter',
    -- dependencies = 'nvim-ts-rainbow2',
    config = function()
      require('nvim-treesitter.configs').setup {
        ensure_installed = 'all',
        sync_install = false,
        highlight = {
          enable = true,
          --additional_vim_regex_highlighting = false,
        },
        -- rainbow = {
        -- enable = true,
        -- query = 'rainbow-parens',
        -- strategy = require('ts-rainbow').strategy.global,
        -- },
        indent = {
          enable = true,
        },
        autotag = {
          enable = true
        }
      }
    end,
    build = ':TSUpdate',
    lazy = true,
    event = 'BufRead',
  },
  {'ntpeters/vim-better-whitespace', dependencies = 'nightfox.nvim', config = function() g.better_whitespace_guicolor = g.terminal_color_1 end},
  {
    'lewis6991/gitsigns.nvim',
    opts = {
      signcolumn = false,
      numhl = true,
      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns
        keymap.set('n', '<leader>gd', gs.diffthis)
        keymap.set('n', '<leader>gb', gs.toggle_current_line_blame)
      end
    },
    event = 'BufRead',
  },
  'jghauser/mkdir.nvim',
  -- {'petertriho/nvim-scrollbar', config=function() require("scrollbar").setup() end},
  'vim-scripts/sudo.vim',
  --[[
  {
    'github/copilot.vim',
    config = function()
      g.copilot_no_tab_map = true
      keymap.set('i', '<C-J>', 'copilot#Accept("<CR>")', {silent=true, expr=true, script = true, replace_keycodes = false})
    end,
  },
  ]]
  {
    'zbirenbaum/copilot.lua',
    cmd = 'Copilot',
    event = 'InsertEnter',
    config = function()
      -- issue #273のためソースが編集されています
      require("copilot").setup({
        panel = { enabled = false },
        suggestion = {
          enabled = true,
          auto_trigger = true,
          debounce = 75,
          keymap = {
            accept = "<C-j>",
            accept_word = false,
            accept_line = false,
            next = false,
            prev = false,
            dismiss = false,
          },
        },
        filetypes = {
          cpp = true,
          ["."] = false,
        },
      })
    end,
  },
  {'nvim-telescope/telescope.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'debugloop/telescope-undo.nvim',
      {'smartpde/telescope-recent-files'},
      {'nvim-telescope/telescope-fzf-native.nvim', build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' },
      'marcuscaisey/olddirs.nvim',
      "nvim-telescope/telescope-frecency.nvim",
      "nvim-telescope/telescope-file-browser.nvim",
      -- 'noice.nvim',
    },
    config = function()
      local themes = require("telescope.themes")
      local telescope = require('telescope')
      telescope.setup(
        themes.get_ivy({
          defaults = {
            selection_caret = "  ",
            file_ignore_patterns = { "node_modules/.*", "Library/.*", ".cache/.*", ".vscode/.*", ".git/.*", "ios/Runner/.*", "Xcode/.*", "%.png", "%.PNG", "%.jpeg", "%.jpg", ".*/venv/.*", ".DS_Store", ".*/tmp/.*", "%.class"}
          },
          extensions = {
            undo = {
              use_delta = true,
              use_custom_command = nil,
              side_by_side = false,
              diff_context_lines = vim.o.scrolloff,
              entry_format = "state #$ID, $STAT, $TIME",
              mappings = {
                i = {
                  ["<cr>"] = require("telescope-undo.actions").yank_additions,
                  ["<S-cr>"] = require("telescope-undo.actions").yank_deletions,
                  ["<C-cr>"] = require("telescope-undo.actions").restore,
                },
              },
            },
            fzf = {
              fuzzy = true,
              override_generic_sorter = false,
              override_file_sorter = true,
              case_mode = "smart_case",
            },
            recent_files = {
              attach_mappings = function(prompt_bufnr, _)
                local actions = require("telescope.actions")
                local action_state = require("telescope.actions.state")
                actions.select_default:replace(function()
                  actions.close(prompt_bufnr)
                  local selection = action_state.get_selected_entry()
                  local bufinfo = vim.fn.getbufinfo({buflisted = 1})
                  local src_buf_name = api.nvim_buf_get_name(0)
                  vim.cmd("e " .. selection[1])
                  if (src_buf_name == '') then
                    if (#bufinfo == 1) then
                      vim.cmd([[execute ":cd ".fnamemodify(substitute(expand("%"), ".*file:\\\/\\\/\\|\\$$", "", "g"), ":p:h")]])
                    else
                      vim.cmd([[execute ":lcd ".fnamemodify(substitute(expand("%"), ".*file:\\\/\\\/\\|\\$$", "", "g"), ":p:h")]])
                    end
                  end
                end)
                return true
              end,
              stat_files = false,
              show_current_file = true,
            },
            olddirs = {
              selected_dir_callback = function(dir)
                vim.cmd.cd(dir)
                vim.cmd('Tree')
              end,
            },
            file_browser = {
              theme = "ivy",
              mappings = {
                ["i"] = {
                },
                ["n"] = {
                },
              },
            },
          }
        })
      )
      telescope.load_extension('undo')
      telescope.load_extension('fzf')
      telescope.load_extension('recent_files')
      telescope.load_extension('olddirs')
      telescope.load_extension('frecency')
      telescope.load_extension('file_browser')
      -- telescope.load_extension('noice')

      local builtin = require('telescope.builtin')
      keymap.set('n', '<leader>ff', builtin.find_files, {})
      keymap.set('n', '<leader>fg', builtin.live_grep, {})
      keymap.set('n', '<leader>fb', builtin.buffers, {})
      keymap.set('n', '<leader>fh', builtin.help_tags, {})
      keymap.set('n', '<leader>fu', '<cmd>Telescope undo<cr>')
      keymap.set('n', '<leader>fo', function() telescope.extensions.recent_files.pick(require('telescope.themes').get_dropdown()) end)
      keymap.set('n', '<leader>fr', builtin.lsp_references, {})
      keymap.set('n', '<leader>fd', function() telescope.extensions.olddirs.picker() end, {})
      keymap.set('n', '<leader>fd', '<Cmd>Telescope frecency<CR>', {})
      keymap.set('n', '<leader>fn', '<Cmd>Telescope file_browser path=%:p:h<CR>', {})
      -- keymap.set('n', '<leader>fm', '<cmd>Telescope noice<cr>', {})
    end,
  },
  {
    'dstein64/vim-startuptime',
    lazy = true,
    cmd = 'StartupTime',
  },
  {
    'andweeb/presence.nvim',
    opts = {
      log_level           = "error",
      editing_text        = "%sを編集中",
      file_explorer_text  = "%sを探索中",
      git_commit_text     = "変更をコミット中",
      plugin_manager_text = "プラグインを整理中",
      reading_text        = "%sを読み中",
      workspace_text      = "%sで仕事中",
      line_number_text    = "%s/%s行目にいます",
    },
  },
  {'machakann/vim-sandwich', config=function() g['sandwich#recipes'] = fn.deepcopy(g['sandwich#default_recipes']) end},
  'segeljakt/vim-silicon',
  --[[ {
    'krivahtoo/silicon.nvim',
    build = './install.sh',
    config=function()
    require('silicon').setup({
      font = 'FantasqueSansMono Nerd Font=16',
      theme = 'Monokai Extended',
    })
  end},
  ]]
  'rbtnn/vim-ambiwidth',
  {
    'mfussenegger/nvim-lint',
    config = function()
      require('lint').linters_by_ft = {
        cpp = {'cpplint'}
      }
      vim.api.nvim_create_autocmd('BufWritePost', {
        callback = function()
          require("lint").try_lint()
        end,
      })
    end,
  },
  {
    'drzel/vim-gui-zoom', config = function()
      keymap.set('n', '<C-+>', ':ZoomIn<CR>')
      keymap.set('n', '<C-->', ':ZoomOut<CR>')
    end,
    keys = {'<C-+>','<C-->'},
  },
  -- 'tpope/vim-surround',
  'vim-scripts/dbext.vim',
  --[[
  {
    'ErichDonGubler/lsp_lines.nvim',
    dependencies = 'nvim-lspconfig',
    config = function()
      require('lsp_lines').setup({
        icons = {
          error = " ",
          warning = " ",
          info = " ",
          hint = " "
        }
      })
      vim.diagnostic.config({
        virtual_text = false,
      })
    end,
  },
  ]]
  {
    'rmagatti/auto-session',
    opts = {
      log_level = 'info',
      auto_session_enabled = true,
      auto_save_enabled = true,
      auto_restore_enabled = false,
      auto_session_create_enabled = false,
      session_lens = {
        load_on_setup = true,
        path_display = {'shorten'},
        theme_conf = { border = true },
      },
    },
    lazy = true,
    cmd = {'SessionSave', 'SessionDelete', 'SessionRestore', 'SessionRestoreFromFile'},
  },
  {
    'hiphish/rainbow-delimiters.nvim',
    -- depenencies = 'nightfox.nvim',
    -- depenencies = {'iceberg.vim', 'nvim-treesitter'},
    config = function()
      api.nvim_create_autocmd('ColorScheme', {
        callback=function()
          vim.api.nvim_set_hl(0, 'RainbowDelimiterRed', { default=false, fg = g.terminal_color_1 })
          vim.api.nvim_set_hl(0, 'RainbowDelimiterYellow', { default=false, fg = g.terminal_color_2 })
          vim.api.nvim_set_hl(0, 'RainbowDelimiterBlue', { default=false, fg = g.terminal_color_3 })
          vim.api.nvim_set_hl(0, 'RainbowDelimiterOrange', { default=false, fg = g.terminal_color_4  })
          vim.api.nvim_set_hl(0, 'RainbowDelimiterGreen', { default=false, fg = g.terminal_color_5  })
          vim.api.nvim_set_hl(0, 'RainbowDelimiterViolet', { default=false, fg = g.terminal_color_6 })
          vim.api.nvim_set_hl(0, 'RainbowDelimiterCyan', { default=false, fg = g.terminal_color_7 })
        end
      })
      local rainbow_delimiters = require('rainbow-delimiters')
      require('rainbow-delimiters.setup'){
        strategy = {
          [''] = rainbow_delimiters.strategy['global'],
          commonlisp = rainbow_delimiters.strategy['local'],
        },
        query = {
          [''] = 'rainbow-delimiters',
          latex = 'rainbow-blocks',
        },
        highlight = {
          'RainbowDelimiterRed',
          'RainbowDelimiterYellow',
          'RainbowDelimiterBlue',
          'RainbowDelimiterOrange',
          'RainbowDelimiterGreen',
          'RainbowDelimiterViolet',
          'RainbowDelimiterCyan',
        },
        blacklist = {'c', 'cpp'},
      }
    end,
    lazy = true,
    event = 'BufReadPre',
  },
  -- {'karb94/neoscroll.nvim', opts = {}},
  'MattesGroeger/vim-bookmarks',
  {
    'nvim-tree/nvim-tree.lua',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      api.nvim_create_user_command('Tree', ':NvimTreeOpen', {})
      require("nvim-tree").setup {
        -- renderer = {
        update_focused_file = {
          enable = true,
          -- update_root = true,
        },
        -- },
        filters = { dotfiles = false, git_ignored = false },
        sync_root_with_cwd = true,
        reload_on_bufenter = true,
        auto_reload_on_write = true,
        hijack_cursor = true,
      }
      api.nvim_set_hl(0, 'NvimTreeNormal', { link = 'Normal' })
    end,
    lazy = true,
    cmd = 'Tree',
  },
  {
    'EdenEast/nightfox.nvim',
    config = function()
      opt.background = 'dark'
      require('nightfox').setup({
        options = {
          transparent = true,
        },
        palettes = {
          nordfox = {
            comment = "#748aa6",
          },
        },
        groups = {
          nordfox = {
            ExtraWhitespace = {fg = "#60728a"},
          },
        },
      })
      vim.cmd('colorscheme nordfox')
    end,
  },
  --[[
  {
    'skywind3000/vim-keysound',
    config = function()
      g.keysound_enable = 1;
    end
  },
  ]]
  {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup({
        toggler = {
          line = '<C-/>',
          block = '<C-S-/>',
        },
        opleader = {
          line = 'cc',
          block = 'cb',
        },
      })
    end
  },
  --[[
  {
    "folke/noice.nvim",
    --event = "VeryLazy",
    opts = {
      -- add any options here
    },
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      "rcarriga/nvim-notify",
    }
  },
  ]]
  --[[
  {'sunjon/shade.nvim',
    config = function()
      require'shade'.setup({
        overlay_opacity = 65,
        opacity_step = 1,
        keys = {
          brightness_up    = '<C-Up>',
          brightness_down  = '<C-Down>',
          toggle           = '<Leader>s',
        }
      })
    end
  },
  ]]
  {
    'monaqa/dial.nvim',
    config = function()
      local map = require('dial.map')
      keymap.set("n", "<C-a>", map.inc_normal(), {noremap = true})
      keymap.set("n", "<C-x>", map.dec_normal(), {noremap = true})
      keymap.set("n", "g<C-a>", map.inc_gnormal(), {noremap = true})
      keymap.set("n", "g<C-x>", map.dec_gnormal(), {noremap = true})
      keymap.set("v", "<C-a>", map.inc_visual(), {noremap = true})
      keymap.set("v", "<C-x>", map.dec_visual(), {noremap = true})
      keymap.set("v", "g<C-a>", map.inc_gvisual(), {noremap = true})
      keymap.set("v", "g<C-x>", map.dec_gvisual(), {noremap = true})

      local augend = require("dial.augend")
      require("dial.config").augends:register_group{
        default = {
          augend.integer.alias.decimal_int,
          augend.integer.alias.hex,
          augend.constant.alias.bool,
          augend.date.alias["%Y/%m/%d"],
          augend.date.alias["%Y-%m-%d"],
          augend.date.alias["%H:%M:%S"],
          augend.constant.alias.alpha,
          augend.constant.alias.Alpha,
          augend.semver.alias.semver,
        },
      }
    end
  },
  {
    'simrat39/symbols-outline.nvim',
    config = function()
      require("symbols-outline").setup({
        auto_preview = true,
      })
      keymap.set('n', '<Leader>sy', ':SymbolsOutline<CR>')
    end
  },
  --[[
  {
    'rmagatti/goto-preview',
    config = function()
      require('goto-preview').setup {}
      keymap.set('n', 'gpd', function() require('goto-preview').goto_preview_definition() end)
    end
  },
  ]]
  {
    "utilyre/barbecue.nvim",
    name = "barbecue",
    version = "*",
    dependencies = {
      "SmiteshP/nvim-navic",
      "nvim-tree/nvim-web-devicons",
    },
    opts = {
    },
  },
  {
    'm-demare/hlargs.nvim',
    opts = {},
  },
  'RRethy/vim-illuminate',
  --'jiangmiao/auto-pairs',
  {
    'goolord/alpha-nvim',
    config = function ()
      -- require'alpha'.setup(require'alpha.themes.dashboard'.config)
      local alpha = require("alpha")
      local dashboard = require("alpha.themes.dashboard")
      dashboard.section.header.val = {
        "                                                     ",
        "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
        "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
        "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
        "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
        "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
        "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
        "                                                     ",
      }
      dashboard.section.buttons.val = {
        dashboard.button( "e", " > New file"          , ":ene <BAR> startinsert <CR>"),
        -- dashboard.button( "r", " > Recent"            , ":Telescope oldfiles<CR>"),
        dashboard.button( "r", " > Recent"            , ":Telescope frecency<CR>"),
        dashboard.button( "d", " > Recent Directories", ":lua require('telescope').extensions.olddirs.picker()<CR>"),
        dashboard.button( "s", " > Sessions"          , ":Telescope session-lens search_session<CR>"),
        dashboard.button( "f", " > Find file"         , ":cd $HOME | Telescope file_browser<CR>"),
        -- dashboard.button( "c", " > Configs"           , ":execute('cd ' . fnamemodify($MYVIMRC, ':h')) | :e $MYVIMRC<CR>"),
        dashboard.button( "c", " > Configs"           , ":let _chezmoi_path = execute(':!chezmoi source-path', 'silent!')->split('\\n')[2] | execute(':cd ' . _chezmoi_path . '/dot_config/nvim/') | e init.lua<CR>"),
        dashboard.button( "q", " > Quit NVIM"         , ":qa<CR>"),
      }
      alpha.setup(dashboard.opts)
      vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
    end
  },
  {
    'folke/which-key.nvim',
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    opts = {},
    config = function()
      local wk = require("which-key")
      wk.register({
        ["<leader>"] = {
          f = {
            name = "Telescope",
            b = { "Buffers" },
            f = { "Find Files" },
            g = { "Live Grep" },
            h = { "Help Tags" },
            o = { "Recent Files" },
            d = { "Recent Dirs" },
            p = { "LSP References" },
            u = { "Undotree" },
            x = { "Code Action" },
          },
          r = {
            n = { "LSP Rename" }
          },
        },
      })
    end
  },
  {
    'stevearc/dressing.nvim',
    opts = {},
  },
  {
    'VonHeikemen/fine-cmdline.nvim',
    dependencies = {
      'MunifTanjim/nui.nvim'
    },
    config = function() 
      api.nvim_set_keymap('n', '<CR>', '<cmd>FineCmdline<CR>', {noremap = true})
      -- api.nvim_set_keymap('n', ':', '<cmd>FineCmdline<CR>', {noremap = true})
    end
  },
  {
    'vigoux/notifier.nvim',
    config = function()
      require'notifier'.setup({})
    end
  },
})

keymap.set('t', '<ESC>', [[<C-\><C-n>]], {silent=true})


vim.cmd('command! Format lua vim.lsp.buf.format()')

--[[
vim.keymap.set('n', '<leader>qf', function()
  vim.lsp.buf.code_action({
    filter = function(a) return a.isPreferred end,
    apply = true
  })
end, { noremap=true, silent=true })
]]

local opts = { noremap=true, silent=true }
keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
keymap.set('n', ']d', vim.diagnostic.goto_next, opts)

-- inlay hints
--[[
vim.api.nvim_create_autocmd({ 'InsertEnter' }, {
  callback = function () vim.lsp.inlay_hint(0, true) end,
})
vim.api.nvim_create_autocmd({ 'InsertLeave' }, {
  callback = function () vim.lsp.inlay_hint(0, false) end,
})
]]
