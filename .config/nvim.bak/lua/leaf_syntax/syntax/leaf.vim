" syntax/leaf.vim

" Load HTML syntax as the base
runtime! syntax/html.vim

" Vapor Leaf Syntax Highlighting

" Match #(variable)
syntax match leafVariable /#\((.*)\)/
highlight link leafVariable Identifier

" Match #extend("template"): ... #endextend
syntax region leafExtend start=/#extend(".*"):/ end=/#endextend/ contains=ALL
highlight link leafExtend Include

" Match #export("name"): ... #endexport
syntax region leafExport start=/#export(".*"):/ end=/#endexport/ contains=ALL
highlight link leafExport Keyword

" Match #import("name")
syntax match leafImport /#import(".*")/
highlight link leafImport PreProc

" Match #count(variable)
syntax match leafCount /#count\((.*)\)/
highlight link leafCount Function

" Match #for(...) ... #endfor
syntax region leafFor start=/#for\((.*)\):/ end=/#endfor/ contains=ALL
highlight link leafFor Repeat

" Match #if(...) ... #endif
syntax region leafIf start=/#if\((.*)\):/ end=/#endif/ contains=ALL
highlight link leafIf Conditional

" Match #else:
syntax match leafElse /#else:/
highlight link leafElse Conditional

" Ensure nested syntax regions are highlighted correctly
syntax cluster leafStatement contains=leafIf,leafFor,leafElse,leafExtend,leafExport

" Optionally, define comment syntax if needed
" syntax match leafComment /#.*$/
" highlight link leafComment Comment

