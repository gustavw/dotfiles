function! Create_ipython_notebook(pyfile_path, filename)
    """ Author: Gustav Wiberg (gustav.wiberg@rightnleft.se)
    """ Function: Use ipython api to create notebooka
    """ Reguires: vim to be compiled with python support
python3 << endpython
import vim
import io
from IPython.nbformat import current


# convert normal python script to json ipy notebook
def convert(py_file, ipynb_file):
    with io.open(py_file, 'r', encoding='utf-8') as f:
        notebook = current.reads(f.read(), format='py')
    with io.open(ipynb_file, 'w', encoding='utf-8') as f:
        current.write(notebook, f, format='ipynb')

convert(vim.eval("a:pyfile_path"), vim.eval("a:filename"))
endpython
endfunction
