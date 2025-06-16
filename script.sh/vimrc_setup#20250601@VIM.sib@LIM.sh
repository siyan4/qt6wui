#!/bin/bash
# This is the BOF.
# This script will set up the VIM Configuration.
# Maintained by Sib Chen<sib@mxc.cc>.

# Download plug.vim and put it into the "~/.vim/autoload/" directory:
if [ -d ~/.vim/autoload/vim-plug ]
	then echo "The vim-plug had already been installed."
	else git clone https://github.com/junegunn/vim-plug.git ~/.vim/autoload/vim-plug/
fi
ln -frs ~/.vim/autoload/vim-plug/plug.vim ~/.vim/autoload/plug.vim

# Backup previous file "~/.vim/vimrc" for vim:
if [ -f ~/.vim/vimrc ]
	then mv ~/.vim/vimrc ~/.vim/vimrc.old.`date +%Y-%m-%d_%H:%M:%S`
fi

# Generate file "~/.vim/vimrc" for vim:
echo '" VIM Runtime Configuration file "~/.vim/vimrc"' > ~/.vim/vimrc
echo -e >> ~/.vim/vimrc
echo '" Checking Plugin Manager file "~/.vim/autoload/plug.vim"' >> ~/.vim/vimrc
echo "if empty(glob('~/.vim/autoload/plug.vim'))" >> ~/.vim/vimrc
echo "	silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" >> ~/.vim/vimrc
echo '	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC' >> ~/.vim/vimrc
echo "endif" >> ~/.vim/vimrc
echo -e >> ~/.vim/vimrc
echo '" set options:' >> ~/.vim/vimrc
echo '" For view:' >> ~/.vim/vimrc
echo ':set sts=4' >> ~/.vim/vimrc
echo ':set ts=8' >> ~/.vim/vimrc
echo ':set et' >> ~/.vim/vimrc
echo ':set sr' >> ~/.vim/vimrc
echo ':set sw=2' >> ~/.vim/vimrc
echo ':set list' >> ~/.vim/vimrc
echo ':set number' >> ~/.vim/vimrc
echo ':set showcmd' >> ~/.vim/vimrc
echo ':set incsearch' >> ~/.vim/vimrc
echo ':set relativenumber' >> ~/.vim/vimrc
echo '" For GBK:' >> ~/.vim/vimrc
echo ':set fileencodings-=latin1' >> ~/.vim/vimrc
echo ':set fileencodings+=cp936' >> ~/.vim/vimrc
echo ':set encoding=utf-8' >> ~/.vim/vimrc
echo '" For default:' >> ~/.vim/vimrc
#echo ':set (**)' >> ~/.vim/vimrc
echo ':set display=truncate' >> ~/.vim/vimrc
echo ':set history=200' >> ~/.vim/vimrc
echo ':set langnoremap' >> ~/.vim/vimrc
echo ':set mouse=nvi' >> ~/.vim/vimrc
echo ':set nolangremap' >> ~/.vim/vimrc
echo ':set nrformats=bin,hex' >> ~/.vim/vimrc
echo ':set scrolloff=4' >> ~/.vim/vimrc
echo ':set ttimeout' >> ~/.vim/vimrc
echo ':set ttimeoutlen=100' >> ~/.vim/vimrc
echo ':set wildmenu' >> ~/.vim/vimrc
#echo '" For (**):' >> ~/.vim/vimrc
#echo ':set (**)' >> ~/.vim/vimrc
#echo ':set (**)=(**)' >> ~/.vim/vimrc
echo '" let options:' >> ~/.vim/vimrc
echo '" For <Leader> keys:' >> ~/.vim/vimrc
echo ":let mapleader = '\'" >> ~/.vim/vimrc
#echo '" For (**):' >> ~/.vim/vimrc
#echo ':let (**)' >> ~/.vim/vimrc
#echo ":let (**) = '(**)'" >> ~/.vim/vimrc
echo -e >> ~/.vim/vimrc
echo '" Shortcuts for quick access:' >> ~/.vim/vimrc
echo ':noremap ys "+y' >> ~/.vim/vimrc
echo ':noremap <Space><Space> /(\*\*)<CR>c%' >> ~/.vim/vimrc
echo ':noremap <Leader>tm :TableModeToggle<CR>' >> ~/.vim/vimrc
echo ':nmap <Leader>mp <Plug>MarkdownPreview' >> ~/.vim/vimrc
echo ':nmap <Leader>sp <Plug>StopMarkdownPreview' >> ~/.vim/vimrc
echo -e >> ~/.vim/vimrc
echo '" Call plugin by vim-plug:' >> ~/.vim/vimrc
echo '" Specify a directory for plugins:' >> ~/.vim/vimrc
echo ":call plug#begin('~/.vim/plugged')" >> ~/.vim/vimrc
echo '" For Markdown Preview:' >> ~/.vim/vimrc
echo ":Plug 'iamcco/mathjax-support-for-mkdp'" >> ~/.vim/vimrc
echo ":Plug 'iamcco/markdown-preview.vim'" >> ~/.vim/vimrc
echo ':source ~/.vim/markdown-preview.vim' >> ~/.vim/vimrc
echo '" For VIM Table Mode:' >> ~/.vim/vimrc
echo ":Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle' }" >> ~/.vim/vimrc
echo '" For VimWiki:' >> ~/.vim/vimrc
echo ":Plug 'vimwiki/vimwiki'" >> ~/.vim/vimrc
echo '" For NerdTree:' >> ~/.vim/vimrc
echo ":Plug 'scrooloose/nerdtree'" >> ~/.vim/vimrc
echo '" For Vim-Startify:' >> ~/.vim/vimrc
echo ":Plug 'mhinz/vim-startify'" >> ~/.vim/vimrc
echo '" For Vim-Fugitive:' >> ~/.vim/vimrc
echo ":Plug 'tpope/vim-fugitive'" >> ~/.vim/vimrc
echo '" For vim-interestingwords:' >> ~/.vim/vimrc
echo ":Plug 'lfv89/vim-interestingwords'" >> ~/.vim/vimrc
echo '" For ALE:' >> ~/.vim/vimrc
echo ":Plug 'w0rp/ale'" >> ~/.vim/vimrc
echo '" For Tagbar:' >> ~/.vim/vimrc
echo ":Plug 'majutsushi/tagbar'" >> ~/.vim/vimrc
echo ":let g:tagbar_width = 32" >> ~/.vim/vimrc
echo ':autocmd BufReadPost *.c,*.cc,*.cpp,*.cxx,*.C,*.h,*.hh,*.hpp,*.hxx,*.H call tagbar#autoopen()' >> ~/.vim/vimrc
echo '" For YouCompleteMe:' >> ~/.vim/vimrc
echo ":Plug 'ycm-core/YouCompleteMe'" >> ~/.vim/vimrc
echo '" For Gutentags:' >> ~/.vim/vimrc
echo ":Plug 'ludovicchabant/vim-gutentags'" >> ~/.vim/vimrc
#echo '" For (**):' >> ~/.vim/vimrc
#echo ":Plug '(**)'" >> ~/.vim/vimrc
#echo '(**)' >> ~/.vim/vimrc
#echo "(**)" >> ~/.vim/vimrc
echo '" Initialize plugin system:' >> ~/.vim/vimrc
echo ':call plug#end()' >> ~/.vim/vimrc

echo -e >> ~/.vim/vimrc
echo '" For Ctags:' >> ~/.vim/vimrc
echo "if filereadable('tags')" >> ~/.vim/vimrc
echo '	:set tags=tags' >> ~/.vim/vimrc
echo "endif" >> ~/.vim/vimrc

echo -e >> ~/.vim/vimrc
echo '" For Cscope:' >> ~/.vim/vimrc
echo "if has('cscope')" >> ~/.vim/vimrc
echo '	:set csprg=/usr/bin/cscope' >> ~/.vim/vimrc
echo '	:set csto=1' >> ~/.vim/vimrc
echo '	:set cst' >> ~/.vim/vimrc
echo '	:set nocsverb' >> ~/.vim/vimrc
echo "	if filereadable('cscope.out')" >> ~/.vim/vimrc
echo '		:cs add cscope.out' >> ~/.vim/vimrc
echo "	endif" >> ~/.vim/vimrc
echo "endif" >> ~/.vim/vimrc
echo ':set cscopequickfix=s-,c-,d-,i-,t-,e-' >> ~/.vim/vimrc
echo '":nmap <silent> <C-C>s :cs find s <C-R>=expand("<cword>")<CR><CR>' >> ~/.vim/vimrc
echo '":nmap <silent> <C-C>t :cs find t <C-R>=expand("<cword>")<CR><CR>' >> ~/.vim/vimrc
echo '":nmap <silent> <C-C>c :cs find c <C-R>=expand("<cword>")<CR><CR>' >> ~/.vim/vimrc
echo ':nmap <silent> <F5> :cs find s <C-R>=expand("<cword>")<CR><CR>' >> ~/.vim/vimrc
echo ':nmap <silent> <F6> :cs find t <C-R>=expand("<cword>")<CR><CR>' >> ~/.vim/vimrc
echo ':nmap <silent> <F7> :cs find c <C-R>=expand("<cword>")<CR><CR>' >> ~/.vim/vimrc

# Generate file "~/.vim/markdown-preview.vim" for Markdown Preview:
echo '" Markdown Preview Configuration file "~/.vim/markdown-preview.vim"' > ~/.vim/markdown-preview.vim
echo -e >> ~/.vim/markdown-preview.vim
echo 'let g:mkdp_path_to_chrome = ""' >> ~/.vim/markdown-preview.vim
echo '" Path to the chrome or the command to open chrome (or other modern browsers).' >> ~/.vim/markdown-preview.vim
echo '" If set, g:mkdp_browserfunc would be ignored.' >> ~/.vim/markdown-preview.vim
echo -e >> ~/.vim/markdown-preview.vim
echo "let g:mkdp_browserfunc = 'MKDP_browserfunc_default'" >> ~/.vim/markdown-preview.vim
echo '" Callback Vim function to open browser, the only parameter is the url to open.' >> ~/.vim/markdown-preview.vim
echo -e >> ~/.vim/markdown-preview.vim
echo 'let g:mkdp_auto_start = 0' >> ~/.vim/markdown-preview.vim
echo '" Set to 1, Vim will open the preview window on entering the Markdown' >> ~/.vim/markdown-preview.vim
echo '" buffer.' >> ~/.vim/markdown-preview.vim
echo -e >> ~/.vim/markdown-preview.vim
echo 'let g:mkdp_auto_open = 0' >> ~/.vim/markdown-preview.vim
echo '" Set to 1, Vim will automatically open the preview window when you edit a' >> ~/.vim/markdown-preview.vim
echo '" Markdown file.' >> ~/.vim/markdown-preview.vim
echo -e >> ~/.vim/markdown-preview.vim
echo 'let g:mkdp_auto_close = 1' >> ~/.vim/markdown-preview.vim
echo '" Set to 1, Vim will automatically close the current preview window when' >> ~/.vim/markdown-preview.vim
echo '" switching from one Markdown buffer to another.' >> ~/.vim/markdown-preview.vim
echo -e >> ~/.vim/markdown-preview.vim
echo 'let g:mkdp_refresh_slow = 0' >> ~/.vim/markdown-preview.vim
echo '" Set to 1, Vim will just refresh Markdown when saving the buffer or' >> ~/.vim/markdown-preview.vim
echo '" leaving from insert mode. With default 0, it will automatically refresh' >> ~/.vim/markdown-preview.vim
echo '" Markdown as you edit or move the cursor.' >> ~/.vim/markdown-preview.vim
echo -e >> ~/.vim/markdown-preview.vim
echo 'let g:mkdp_command_for_global = 0' >> ~/.vim/markdown-preview.vim
echo '" Set to 1, the MarkdownPreview command can be used for all files,' >> ~/.vim/markdown-preview.vim
echo '" by default it can only be used in Markdown files.' >> ~/.vim/markdown-preview.vim
echo -e >> ~/.vim/markdown-preview.vim
echo 'let g:mkdp_open_to_the_world = 0' >> ~/.vim/markdown-preview.vim
echo '" Set to 1, the preview server will be available to others in your network.' >> ~/.vim/markdown-preview.vim
echo '" By default, the server only listens on localhost (127.0.0.1).' >> ~/.vim/markdown-preview.vim
# This is the EOF.
