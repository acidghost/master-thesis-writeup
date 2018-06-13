set spell
au BufEnter *.tex call SetForTex()

function SetForTex()
  setlocal spelllang=en
  setlocal spellfile=~/.vim/spell/en.utf-8.add
  setlocal spellfile+=./jargon.utf-8.add

  syn region texRefZone   matchgroup=texStatement start="\\nllabel{"    end="}\|%stopzone\>"  contains=@texRefGroup
  syn match  texRefZone   '\\citeauthor' nextgroup=texRefOption,texCite
  syn region texZone   start="\\begin{lstlisting}"   end="\\end{lstlisting}\|%stopzone\>"  contains=@NoSpell
endfunction

colorscheme carvedwood
" hi Normal cterm=none ctermbg=15 ctermfg=0
" hi Normal cterm=none ctermbg=15 ctermfg=0
hi LineNr cterm=none ctermbg=226 ctermfg=16
hi Identifier ctermfg=171
hi Statement ctermfg=177
hi Type ctermfg=45
hi Todo cterm=bold ctermbg=16 ctermfg=208
hi Comment ctermfg=14
hi StatusLine cterm=none ctermbg=226 ctermfg=16
hi Cursor cterm=none ctermbg=226 ctermfg=16
hi CursorColumn cterm=none ctermbg=226 ctermfg=16
hi CursorLine cterm=underline
hi CursorLineNr cterm=bold ctermbg=16 ctermfg=226
hi texSection cterm=bold ctermbg=27 ctermfg=231
