command! -nargs=1 Weblio call Weblio(<f-args>)
function! Weblio(word)
    " let res = webapi#http#get('http://ejje.weblio.jp'.'/content/'.a:word)
    let res = webapi#http#get('http://ejje.weblio.jp'.'/content/' . a:word)
    let tml = webapi#html#parse(string(res))
    let content = string(tml.childNode('head').childNodes('meta')[1]['attr']['content'])
    let content = string(matchlist(content,'[0-9]\(.*\)[0-9]')[0])
    let content = split(content,'[0-9]')
    echo content[1]
endfunction
