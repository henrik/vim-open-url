if exists("g:loaded_open_url")
  finish
endif

if !has("ruby")
  echohl ErrorMsg
  echon "Sorry, the 'Open URL' plugin requires Ruby support."
  finish
end

let g:loaded_open_url = 1

if !exists("g:open_url_browser")
    let g:open_url_browser="open"
endif

command! -range OpenURL execute '<line1>,<line2>call openurl#OpenURL()'

if !hasmapto('OpenURL')
  map <leader>u :OpenURL<CR>
end
