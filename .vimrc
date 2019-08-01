set spell
au BufEnter *.tex call SetForTex()

function SetForTex()
  setlocal spelllang=en
  setlocal spellfile=~/.vim/spell/en.utf-8.add
  setlocal spellfile+=./jargon.utf-8.add

  let g:syntastic_tex_chktex_args = "-n 8"

  syn region texRefZone   matchgroup=texStatement start="\\nllabel{"    end="}\|%stopzone\>"  contains=@texRefGroup
  syn match  texRefZone   '\\citeauthor' nextgroup=texRefOption,texCite
  syn match  texRefZone   '\\citetitle' nextgroup=texRefOption,texCite
  syn region texRefZone matchgroup=texStatement start="\\autoref{" end="}\|%stopzone\>" contains=@texRefGroup
  syn region texZone   start="\\begin{lstlisting}"   end="\\end{lstlisting}\|%stopzone\>"  contains=@NoSpell
  syn match texUrl "\\url{[^}]\{-}}" containedin=texStatement contains=@NoSpell
  syn match texNoSpellComment "%.*$" contained contains=@NoSpell
  syn region texNoSpell contained matchgroup=texComment start="%\s*nospell\s*{" end="%\s*nospell\s*}" contains=@texFoldGroup,@NoSpell,texNoSpellComment
  hi link texNoSpellComment texComment
endfunction

nnoremap <Leader>m :w<bar>!make<CR>
nnoremap <Leader>mv :w<bar>!make view<CR>
nnoremap <Leader>mp :w<bar>!make present<CR>
nnoremap @ :nohlsearch<CR>
inoremap <C-h> <C-o>:nohlsearch<CR>
map <Leader>. :Sexplore<CR>
nnoremap <Leader>gq }v{gq<Esc><C-o>
nmap <Leader>sr :SyntasticReset<CR>
nmap <Leader>st :SyntasticToggleMode<CR>
nmap <Leader>sc :SyntasticCheck<CR>

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
