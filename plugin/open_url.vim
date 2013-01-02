if exists("g:loaded_open_url")
  finish
endif
let g:loaded_open_url = 1

if !has("ruby")
  echohl ErrorMsg
  echon "Sorry, the 'Open URL' plugin requires Ruby support."
  finish
end

ruby << EOF
  def open_url
    re = %r{(?i)\b((?:[a-z][\w-]+:(?:/{1,3}|[a-z0-9%])|www\d{0,3}[.]|[a-z0-9.\-]+[.][a-z]{2,4}/)(?:[^\s()<>]+|\((?:[^\s()<>]+|(?:\([^\s()<>]+\)))*\))+(?:\((?:[^\s()<>]+|(?:\([^\s()<>]+\)))*\)|[^\s`!()\[\]{};:'".,<>?«»“”‘’]))}

    line = VIM::Buffer.current.line
    urls = line.scan(re).flatten

    if urls.empty?
      VIM::message("No URL found in line.")
    else
      system("open", *urls)
      VIM::message(urls.join(" and "))
    end
  end
EOF

function! s:OpenURL()
  ruby open_url
endfunction

command! -range OpenURL execute '<line1>,<line2>call <SID>OpenURL()'

if !hasmapto('OpenURL')
  map <leader>u :OpenURL<CR>
end
