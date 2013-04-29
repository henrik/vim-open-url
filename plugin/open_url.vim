if exists("g:loaded_open_url")
  finish
endif
let g:loaded_open_url = 1

let s:url_re='\c\v%(\<|\>)(%([a-z][\w-]+:%(/{1,3}|[a-z0-9%])|www\d{0,3}[.]|[a-z0-9.\-]+[.][a-z]{2,4})%([^\s()<>]+|\(([^\s()<>]+|(\([^\s()<>]+\)))*\))+%(\(([^\s()<>]+|(\([^\s()<>]+\)))*\)|[^\s`!()\[\]{};:''".,<>?«»“”‘’]))'

function! s:GetUrlFromLine(lineno)
  return matchstr(getline(line(a:lineno)), s:url_re)
endfunction

function! s:GetUrlCurrentLine()
  return <SID>GetUrl(line('.'))
endfunction

function! s:OpenURL()
  call system("open ". GetUrlCurrentLine())
endfunction

command! -range OpenURL execute '<line1>,<line2>call <SID>OpenURL()'

if !hasmapto('OpenURL')
  map <leader>u :OpenURL<CR>
end
