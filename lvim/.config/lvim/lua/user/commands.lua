vim.cmd([[
  func! CompileRunGcc()
    exec "w"
    if &filetype == 'c'
      exec "!g++ % -o %<"
      exec "!time ./%<"
    elseif &filetype == 'cpp'
      exec "!g++ -std=c++11 % -Wall -o %<"
      :vsp
      :term ./%<
      :wincmd h
      :!rm -f ./%<
      :wincmd l
    elseif &filetype == 'r'
      :vsp
      :term Rscript %
    elseif &filetype == 'java'
      set splitbelow
      :sp
      :res -5
      term javac % && time java %<
    elseif &filetype == 'sh'
      :!time bash %
    elseif &filetype == 'python'
      set splitbelow
      :sp
      :term python3 %
    elseif &filetype == 'html'
      silent! exec "!".g:mkdp_browser." % &"
    elseif &filetype == 'markdown'
      exec "MarkdownPreview"
    elseif &filetype == 'tex'
      silent! exec "TexCompile"
      silent! exec "TexView"
    elseif &filetype == 'dart'
      exec "CocCommand flutter.run -d ".g:flutter_default_device." ".g:flutter_run_args
      silent! exec "CocCommand flutter.dev.openDevLog"
    elseif &filetype == 'javascript'
      set splitbelow
      :sp
      :term export DEBUG="INFO,ERROR,WARNING"; node --trace-warnings .
    elseif &filetype == 'go'
      set splitbelow
      :sp
      :term go run .
    endif
    endfunction
  ]])
