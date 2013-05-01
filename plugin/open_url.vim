if exists("g:loaded_open_url")
  finish
endif
let g:loaded_open_url = 1

let s:url_re='\c\v%(<|>)(%([a-z][[:alnum:]-]+:%(/{1,3}|[a-z0-9%])|www\d{0,3}[.]|[a-z0-9.\-]+[.][a-z]{2,4}/)%([^[:space:]()<>]+|\(([^[:space:]()<>]+|(\([^[:space:]()<>]+\)))*\))+%(\(([^[:space:]()<>]+|(\([^[:space:]()<>]+\)))*\)|[^[:space:]`!()\[\]{};:''".,<>?«»“”‘’]))'

function! s:GetURL(lineno)
  return matchstr(getline(a:lineno), s:url_re)
endfunction

function! s:OpenURL()
  let l:url = s:GetURL(line('.'))
  if l:url == ""
    echom "No url found in line."
  else
    call system("open " . shellescape(l:url))
    echom l:url
  endif
endfunction

command! -range OpenURL execute '<line1>,<line2>call <SID>OpenURL()'

if !hasmapto('OpenURL')
  noremap <leader>u :OpenURL<CR>
end
