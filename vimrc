"Update Time
set updatetime=250

"Pathogen
execute pathogen#infect()
filetype plugin indent on
syntax on

:set t_Co=16 "sets vim color scheme to terminal colorscheme


"colorscheme serenade
"autocmd vimenter * hi Normal guibg=NONE ctermbg=NONE
"autocmd vimenter * hi EndOfBuffer guibg=NONE ctermbg=NONE
"let g:lightline.colorscheme = 'serenade'


"Fortran
let fortran_free_source=1
let fortran_have_tabs=1
let fortran_do_enddo=1


"C++ YCM
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py'
"YCM is garbage sometimes
let g:loaded_youcompleteme = 1

"inoremap $$ $$<Left>
"inoremap \[ \[\]<Left><Left>




"LaTeX
":inoremap $ $$<esc>i
let g:livepreview_previewer = 'zathura'
map <space>o :! pdflatex %<CR><CR> 					 
map <space>p :! zathura %:r.pdf &<CR><CR> 
let g:tex_flavor = "latex"
"set conceallevel=2
"let g:tex_conceal='abdgm'
"let g:tex_superscripts= "[0-9a-zA-W.,:;+-<>/()=]"
"let g:tex_subscripts= "[0-9aehijklmnoprstuvx,+-/().]"
"let g:tex_conceal_frac=2 


" YouCompleteMe and UltiSnips compatibility, with the helper of supertab
" (via http://stackoverflow.com/a/22253548/1626737)
let g:SuperTabDefaultCompletionType    = '<C-n>'
let g:SuperTabCrMapping                = 0
let g:UltiSnipsExpandTrigger           = '<tab>'
let g:UltiSnipsJumpForwardTrigger      = '<tab>'
let g:UltiSnipsJumpBackwardTrigger     = '<s-tab>'
let g:ycm_key_list_select_completion   = ['<C-j>', '<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-k>', '<C-p>', '<Up>']


"Joe's original
"let g:UltiSnipsExpandTrigger="<c-j>"
"let g:UltiSnipsJumpForwardTrigger="<c-j>"
"let g:UltiSnipsJumpBackwardTrigger="<c-k>"

"Set filepath for custom snippets
set runtimepath+=~/.vim/my-snippets/
" use different snippets dir
let g:UltiSnipsSnippetsDir='~/.vim/my-snippets/'
let g:UltiSnipsSnippetDirectories=["my-snippets"]


" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"



" Compile and Execute Fortran
"noremap <C-m> :!gfortran % -o %< && ./%<<CR>
"Compile and Execute cpp
noremap <C-m> :!g++ % -o %< && ./%<<CR>
noremap <C-n> :!nvcc % -o %< && ./%<<CR>
noremap <C-N> :!sudo nvcc % -o %< ~/hdd2/UMICH/Research/Forger/Diffusion/cufinufft/lib-static/libcufinufft.a -lcudart -lcufft -lnvToolsExt && ./%<<CR>

"sudo nvcc example2d1many.cpp -o example2d1many ~/hdd2/UMICH/Research/Forger/Diffusion/cufinufft/lib-static/libcufinufft.a -lcudart -lcufft -lnvToolsExt

" Start LLP for Latex
noremap <C-p> :LLP<CR>

" Color of text preview window from YCM
highlight Pmenu ctermfg=15 ctermbg=12

" FZF stuff
nnoremap <silent> <C-f> :Files<CR>

" Startify
let g:startify_custom_header = []






"----------------------------------------------------------------------------------------
	set number relativenumber 							"numbers on the left
	set wildmode=longest,list,full 							"autocomplete
	autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o  "disable automatic commenting	
	







"----------------------------------------------------------------------------------------

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Get the defaults that most users want.
source $VIMRUNTIME/defaults.vim

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file (restore to previous version)
  if has('persistent_undo')
    set undofile	" keep an undo file (undo changes after closing)
  endif
endif

if &t_Co > 2 || has("gui_running")
  " Switch on highlighting the last used search pattern.
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Add optional packages.
"
" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
" The ! means the package won't be loaded right away but when plugins are
" loaded during initialization.
if has('syntax') && has('eval')
  packadd! matchit
endif





