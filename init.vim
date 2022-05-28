if filereadable(expand('~/.vimrc'))
  source ~/.vimrc
endif

call ddc#custom#patch_global('sources', ['around', 'file', 'buffer', 'skkeleton', 'nvim-lsp'])
call ddc#custom#patch_global('sourceOptions', {
            \ 'nvim-lsp': {
              \ 'mark': 'L',
              \ 'forceCompletionPattern': '¥.¥w*|:¥w*|->¥w*',
              \ 'kindLabels': { 'Class': 'c' }
              \ },
            \})
call ddc#enable()

" LSP
lua << EOF
local lsp_installer = require("nvim-lsp-installer")
lsp_installer.on_server_ready(function(server)
  local opts = {}
  opts.on_attach = function(client,buffer_number)
    print(vim.inspect(client))
    print(buffer_number)
  end
  server:setup(opts)
end)
EOF
