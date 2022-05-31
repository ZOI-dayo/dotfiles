local fn = vim.fn
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

