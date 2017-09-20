" XML Beautify by vim
function! XmlBeautify()
  call XmlMinify()
  setlocal filetype=xml
  filetype indent on
  setlocal smartindent
  execute "%s/></>\\r</e"
  normal! gg=G
  " Recolor the file again
  setlocal filetype=xml
endfunction

function! XmlMinify()
  setlocal filetype=xml
  execute "%s/>\\s\\+</></e"
  execute "%s/\\s\\+$//e"
  execute "%left"
  execute "%j!"
endfunction

nnoremenu Edit.XML.Beautify   :call XmlBeautify()<CR>
nnoremenu Edit.XML.Minify     :call XmlMinify()<CR>
command! XmlBeautify    execute "call XmlBeautify()"
command! XmlMinify      execute "call XmlMinify()"
