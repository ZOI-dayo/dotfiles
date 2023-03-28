local mason_lspconfig = require('mason-lspconfig')
local navic = require("nvim-navic")
mason_lspconfig.setup_handlers({
  function(server_name)
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
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
        navic.attach(client, bufnr)
      end
    }
    require('lspconfig')[server_name].setup(opts)
  end
})
require("mason").setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗"
    }
  }
})

--require('lspconfig')['ccls'].setup({capabilities = require('cmp_nvim_lsp').default_capabilities()});
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
vim.o.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"

require"fidget".setup{}
