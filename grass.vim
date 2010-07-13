
if v:version < 600
    syntax clear
elseif exists('b:current_syntax')
    finish
endif



syn case match
syn match GrassProgram /.*/ contains=Grassw,GrassW,Grassv,GrassComment
syn match Grassw /[wｗ]/ contained
syn match GrassW /[WＷ]/ contained
syn match Grassv /[vｖ]/ contained
syn match GrassComment /[^wｗWＷvｖ]\+/ contained

hi GrassGreen guifg=Green



if v:version >= 508 || !exists("did_grass_syn_inits")
    if v:version < 508
        let did_grass_syn_inits = 1
        command -nargs=+ HiLink hi link <args>
    else
        command -nargs=+ HiLink hi def link <args>
    endif
    HiLink Grassw GrassGreen
    HiLink GrassW GrassGreen
    HiLink Grassv GrassGreen
    HiLink GrassComment Comment
    delcommand HiLink
endif



let b:current_syntax = 'grass'