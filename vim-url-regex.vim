" This is an expanded form of the Vim port of @gruber's URL regex
" from http://daringfireball.net/2010/07/improved_regex_for_matching_urls
"
" NOTE: This won't work in Vim, it's just here for documentation.
"
\c\v
%(\<|\>)
(
  %(
    [a-z][\w-]+:
    %(
      /{1,3}
      |
      [a-z0-9%]

    )
    |
    www\d{0,3}[.]
    |
    [a-z0-9.\-]+[.][a-z]{2,4}
  )
  %(
    [^\s()<>]+
    |
    \(([^\s()<>]+|(\([^\s()<>]+\)))*\)
  )+
  %(
    \(([^\s()<>]+|(\([^\s()<>]+\)))*\)
    |
    [^\s`!()\[\]{};:'".,<>?«»“”‘’]
  )
)
