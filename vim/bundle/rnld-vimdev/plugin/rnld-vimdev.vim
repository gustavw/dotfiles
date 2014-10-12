function! Rnldvimdev(rnld_buf_placement, rnld_buf_name, rnld_exec_string)
""" Author: Gustav Wiberg (gustav.wiberg@rightnleft.se)
""" Function: open a new buffer with a specific placement, buffer name and
""" Executes a string passed to the function
""" Arg1: Buffer placement (e.g. new or vnew)
""" Arg2: Name of the new buffer (e.g. __pydoc__)
""" Arg3: Execution string (e.g. r ! pydoc print)


"  First save current buffer so that function will run with all changes made
exec 'w'

"  Check if buffer __pydoc__ exists make sure displayed right
if bufexists(a:rnld_buf_name) && bufwinnr(a:rnld_buf_name) > 0
    "  If buffer __pydoc__ exists and window is visible
    "  goto visible __pydoc__ buffer
    exec bufnr(a:rnld_buf_name) . 'wincmd w'
    exec '%d'

elseif bufexists(a:rnld_buf_name) == 1 && bufwinnr(a:rnld_buf_name) == -1
    "  if buffer __pydoc__ exists but hidden. treat as new, del and create new
    exec a:rnld_buf_placement . ' ' . a:rnld_buf_name
    exec '%d'

else
    "  Create buffer __pydoc__ if it doesn't exist
    exec a:rnld_buf_placement . ' ' . a:rnld_buf_name
endif

"  run execution string to be applied in buffer
exec a:rnld_exec_string

endfunction


function! Get_visual_selection()
    """ Author: Gustav Wiberg (gustav.wiberg@rightnleft.se)
    """ Function: Get selection however delete whitespace first ident
    """ Inspiration: stackoverflow 'Get_visual_selection'
    let [lnum1, col1] = getpos("'<")[1:2]
    let [lnum2, col2] = getpos("'>")[1:2]
    let lines = getline(lnum1, lnum2)
    let lines = lines + ["\n"]

    let i = 0
    while lines[0][i] == " "
       " loop through first line find first characther after whitespace
        let i += 1
    endwhile

    " If sloppy visual add characters in begining of line
    let l:untrimmer = ""
    if col1 != 1 && lnum1 != lnum2
        for x in range(1, i)
            let l:untrimmer = l:untrimmer . "x"
        endfor
        let lines[0] = l:untrimmer . lines[0][i - col1 + 1 :]
    endif

    " Remove unnecesary whitespace in begning of line
    for n in range(len(lines))
        let lines[n] = lines[n][i :]
    endfor

    let lines[-1] = lines[-1][col2 - (&selection == 'inclusive' ? 1 : 2)]
    let lines[0] = lines[0][col1 - 1:]

    " Write to register and var
    let l:selection_indent = join(lines, "\n")
    let @" = expand(l:selection_indent)

    " Send output to tmp file
    redir! >/tmp/rnld_vim_tmp
    silent echo @"
    redir END
endfunction


