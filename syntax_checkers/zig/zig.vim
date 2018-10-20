if exists('g:loaded_syntastic_zig_zig_checker')
    finish
endif
let g:loaded_syntastic_zig_zig_checker = 1

let s:save_cpo = &cpo
set cpo&vim

function! SyntaxCheckers_zig_zig_IsAvailable() dict
    return executable(self.getExec())
endfunction

function! SyntaxCheckers_zig_zig_GetHighlightRegex(item)
    "echo a:item

    "if match(a:item['text'], 'assigned but unused variable') > -1
    "    let term = split(a:item['text'], ' - ')[1]
    "    return '\V\\<'.term.'\\>'
    "endif

    return ''
endfunction

function! SyntaxCheckers_zig_zig_GetLocList() dict
    let makeprg = self.makeprgBuild({
                \ 'exe_after': 'build', 
                \ 'fname': '' })
    let errorformat = '%f:%l:%c: %m'
    "let perlRegex = '([^:]+):([^:]+):([^:]+): (.+)\n(.+)\n(\s+\^)'
    "let errorformat = '%f:%i:%c: %m\n(.+)\n(\s+\^)'
    let loclist = SyntasticMake({
        \ 'makeprg': makeprg,
        \ 'errorformat': errorformat,
        \ 'env': {} })
    echo loclist
    return loclist
endfunction

call g:SyntasticRegistry.CreateAndRegisterChecker({
            \ 'filetype': 'zig',
            \ 'name':     'zig' })

let &cpo = s:save_cpo
unlet s:save_cpo

" vim: set sw=4 sts=4 et fdm=marker:
