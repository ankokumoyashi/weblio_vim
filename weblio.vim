command! -nargs=1 Weblio call Weblio(<f-args>)
function! Weblio(word)
    let res = webapi#http#get('http://ejje.weblio.jp'.'/content/'.word)
    echomsg string(res)
endfunction
