require("nvim-navic").setup()

-- vim.o.winbar = "%{%v:lua.require'nvim-navic'.get_location()%%}"

vim.api.nvim_set_hl(0, 'WinBarPath', { bg = '#1d1f21', fg = '#969896' })
-- vim.api.nvim_set_hl(0, 'WinBarModified', { bg = '#1d1f21', fg = '#7d0000' })

local M = {}

function M.eval()
  --local full_path = vim.api.nvim_buf_get_name()
  local file_path = vim.api.nvim_eval_statusline('%f', {}).str
  local modified = vim.api.nvim_eval_statusline('%M', {}).str

  return '%#WinBarPath#'
    .. file_path
	.. ' '
	.. modified
	.. ' '
    .. require'nvim-navic'.get_location()
end

local navic = require("nvim-navic")
require("lspconfig").on_attach = function(client, bufnr)
  navic.attach(client, bufnr)
end

-- vim.o.winbar = "%{%v:lua.require'settings.navic'.eval()%}"
-- vim.opt.statusline = "%{%v:lua.require'settings.navic'.eval()%}"
-- vim.cmd([[eval"%{%v:lua.require'settings.navic'.eval()%}"]])


navic.setup {
  icons = {
    File          = " ",
    Module        = " ",
    Namespace     = " ",
    Package       = " ",
    Class         = " ",
    Method        = " ",
    Property      = " ",
    Field         = " ",
    Constructor   = " ",
    Enum          = "練",
    Interface     = "練",
    Function      = " ",
    Variable      = " ",
    Constant      = " ",
    String        = " ",
    Number        = " ",
    Boolean       = "◩ ",
    Array         = " ",
    Object        = " ",
    Key           = " ",
    Null          = "ﳠ ",
    EnumMember    = " ",
    Struct        = " ",
    Event         = " ",
    Operator      = " ",
    TypeParameter = " ",
  },
  highlight = false,
  separator = " > ",
  depth_limit = 0,
  depth_limit_indicator = "..",
  safe_output = true
}
-- vim.opt.statusline = ([[%= %{%v:lua.require'nvim-navic'()%} %p%% %l:%c]/])
-- vim.o.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"
-- vim.cmd([[set statusline+=%{%v:lua.require'nvim-navic'.get_location()%}]/])
vim.o.statusline = "%{%v:lua.require'nvim-navic'.get_location()%}"
--  OR
-- vim.o.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"


return M
