set shiftwidth=4 tabstop=4 softtabstop=4 expandtab autoindent smartindent
setlocal wildignore=*/__pycache__/*,*.pyc
" clear empty spaces at the end of lines on save of python files
autocmd BufWritePre *.py :%s/\s\+$//e

