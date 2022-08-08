" YAML
let b:ale_fixers = ['yamlfix']

au! BufNewFile,BufReadPost *.{yaml,yml} set filetype=yaml 
autocmd FileType yaml setlocal ts=3 sts=3 sw=2 expandtab
