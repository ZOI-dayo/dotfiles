local keymap = vim.keymap
local fn = vim.fn
function file_exists(path)
  return fn.filereadable(fn.expand(path)) ~= 0
end

keymap.set({'i', 'c'}, 'jk', '<Plug>(skkeleton-toggle)')
fn["skkeleton#register_kanatable"]('rom', {jk = 'disable'})
fn['skkeleton#config']({
  eggLikeNewline= true,
  globalJisyo= '~/.skk/SKK-JISYO.L',
  registerConvertResult= true
})

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
