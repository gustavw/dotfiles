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

