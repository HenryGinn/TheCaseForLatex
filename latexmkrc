# latexmkrc

# Auxiliary files go into build/
$aux_dir = 'build';

# Use LuaLaTeX
$pdf_mode = 4;
$lualatex = 'lualatex -synctex=0 -interaction=nonstopmode %O %S';

# Main document if no filename is supplied
@default_files = ('TheCaseForLatex.tex');
