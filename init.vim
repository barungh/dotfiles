call plug#begin('~/.local/share/nvim/plugged')

    Plug 'ryanoasis/vim-devicons'
    Plug 'preservim/nerdtree'
    Plug 'Xuyuanp/nerdtree-git-plugin'
    Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
    Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
    Plug 'godlygeek/tabular' | Plug 'plasticboy/vim-markdown'

    Plug 'itchyny/lightline.vim'

    Plug 'junegunn/limelight.vim'
    Plug 'junegunn/goyo.vim'
    Plug 'yassinebridi/vim-purpura'
    Plug 'preservim/nerdcommenter'

    Plug 'dracula/vim'

    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    let g:coc_global_extensions = ['coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier', 'coc-tsserver']


    Plug 'leafgarland/typescript-vim'
    Plug 'peitalin/vim-jsx-typescript'

    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'
call plug#end()


    "  -------- coc / COC settings --------------
    set hidden 
    set nobackup
    set nowritebackup
    set cmdheight=2
    set shortmess+=c

    if has("patch-8.1.1564")
            set signcolumn=number
    else
            set signcolumn=yes
    endif

    inoremap <silent><expr> <TAB>
                            \ pumvisible() ? "\<C-n>" :
                            \ <SID>check_back_space() ? "\<TAB>" :
                            \ coc#refresh()
    inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

    function! s:check_back_space() abort
            let col = col('.') - 1
            return !col || getline('.')[col - 1] =~# '\s'
    endfunction

    if exists('*complete_info')
            inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
    else
            inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
    endif

    nnoremap <silent> K :call <SID>show_documentation()<CR>
    function! s:show_documentation()
            if (index(['vim','help'], &filetype) >= 0)
                    execute 'h '.expand('<cword>')
            else
                    call CocAction('doHover')
            endif
    endfunction
    autocmd CursorHold * silent call CocActionAsync('highlight')
    set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}



    " NERDTree settings
    autocmd StdinReadPre * let s:std_in=1
    autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
    let g:NERDTreeDirArrowExpandable = '▸'
    let g:NERDTreeDirArrowCollapsible = '▾'
    map <F12> :NERDTreeToggle<CR>
    let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }
    let s:brown = "905532"
    let s:aqua =  "3AFFDB"
    let s:blue = "689FB6"
    let s:darkBlue = "44788E"
    let s:purple = "834F79"
    let s:lightPurple = "834F79"
    let s:red = "AE403F"
    let s:beige = "F5C06F"
    let s:yellow = "F09F17"
    let s:orange = "D4843E"
    let s:darkOrange = "F16529"
    let s:pink = "CB6F6F"
    let s:salmon = "EE6E73"
    let s:green = "8FAA54"
    let s:lightGreen = "31B53E"
    let s:white = "FFFFFF"
    let s:rspec_red = 'FE405F'
    let s:git_orange = 'F54D27'

    let g:NERDTreeExtensionHighlightColor = {} " this line is needed to avoid error
    let g:NERDTreeExtensionHighlightColor['css'] = s:blue " sets the color of css files to blue

    let g:NERDTreeExactMatchHighlightColor = {} " this line is needed to avoid error
    let g:NERDTreeExactMatchHighlightColor['.gitignore'] = s:git_orange " sets the color for .gitignore files

    let g:NERDTreePatternMatchHighlightColor = {} " this line is needed to avoid error
    let g:NERDTreePatternMatchHighlightColor['.*_spec\.rb$'] = s:rspec_red " sets the color for files ending with _spec.rb

    " --------- NERD COMMENTER Settings --------------------
    " Nerd Comment key remap

    vmap ++ <plug>NERDCommenterToggle
    nmap ++ <plug>NERDCommenterToggle
    let g:netrw_browse_split = 2
    " Enable NERDCommenterToggle to check all selected lines is commented or not 
    let g:NERDToggleCheckAllLines = 1
    " Add spaces after comment delimiters by default
    let g:NERDSpaceDelims = 1

    " Use compact syntax for prettified multi-line comments
    let g:NERDCompactSexyComs = 1

    " Align line-wise comment delimiters flush left instead of following code indentation
    let g:NERDDefaultAlign = 'left'

    " Set a language to use its alternate delimiters by default
    let g:NERDAltDelims_java = 1

    " Add your own custom formats or override the defaults
    let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

    " Allow commenting and inverting empty lines (useful when commenting a region)
    let g:NERDCommentEmptyLines = 1

    " Enable trimming of trailing whitespace when uncommenting
    let g:NERDTrimTrailingWhitespace = 1

    " Netrw => chage default behaviour
    let g:netrw_banner = 0     " Hide annoying 'help' banner
    let g:netrw_liststyle = 3  " Use tree view
    let g:netrw_winsize = '30' " Smaller default window size

    " vim folds
    augroup AutoSaveFolds
        autocmd!
        " view files are about 500 bytes
        " bufleave but not bufwinleave captures closing 2nd tab
        " nested is needed by bufwrite* (if triggered via other autocmd)
        autocmd BufWinLeave,BufLeave,BufWritePost ?* nested silent! mkview!
        autocmd BufWinEnter ?* silent! loadview
    augroup end

    set viewoptions=folds,cursor
    set sessionoptions=folds
    " Disable default powerline
    let g:powerline_loaded = 1

    set laststatus=2

    let g:mkdp_markdown_css='/home/krishna/.local/share/markdown/github-markdown-css.css'


    autocmd! User GoyoEnter Limelight
    autocmd! User GoyoLeave Limelight!

    set nocompatible
    filetype plugin on
    filetype indent plugin on
    syntax on
    syntax enable
    set hidden
    set wildmenu
    set showcmd
    set hlsearch
    set incsearch
    set nocursorcolumn
    set ignorecase
    set smartcase
    set backspace=indent,eol,start
    set smarttab autoindent
    set ruler
    set laststatus=2
    set cmdheight=2
    set number
    set expandtab
    set shiftwidth=4
    set softtabstop=4
    set undofile
    set undodir=~/.vim/undo//
    set textwidth=80
    nnoremap B ^
    nnoremap E $
    nnoremap $ <nop>
    nnoremap ^ <nop>
    inoremap ( ()<Esc>i
    inoremap [ []<Esc>i
    inoremap { {}<Esc>i



    " Mapleader
    let mapleader = ","

    inoremap jk <ESC>

    if (has("termguicolors"))
     set termguicolors
    endif
    syntax enable

    " color scheme
    colorscheme dracula

    set splitright
    set splitbelow


    nnoremap <C-p> :FZF<CR>
    let g:fzf_tction = {
      \ 'ctrl-t': 'tab split',
      \ 'ctrl-s': 'split',
      \ 'ctrl-v': 'vsplit'
      \}
    let g:fzf_preview_window = 'right:60%'



