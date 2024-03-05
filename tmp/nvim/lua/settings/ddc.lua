local fn = vim.fn
local keymap = vim.keymap
fn["ddc#custom#patch_global"]('ui', 'pum')
fn["ddc#custom#patch_global"]('sources', {'around', 'file', 'buffer', 'skkeleton', 'nvim-lsp'})
fn['ddc#custom#patch_global']('sourceOptions', {
  _= {
    matchers= {'matcher_head'},
    sorters= {'sorter_rank'},
    minAutoCompleteLength = 1,
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

-- pum

keymap.set('i', '<Tab>', function()
  --if(vim.b.copilot_enabled) then
  --  return 'copilot#Accept("\\<CR>")'
  --elseif(fn['pum#visible']()) then
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
vim.cmd("autocmd User PumCompleteDone call vsnip_integ#on_complete_done(g:pum#completed_item)")

