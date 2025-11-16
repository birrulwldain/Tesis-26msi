# LaTeX MK configuration for Unified Thesis
# Supports compiling thesis.tex in 3 modes: sempro, semhas, sidang

$pdf_mode = 5;              # Use XeLaTeX
$xelatex = 'xelatex -interaction=nonstopmode -file-line-error -synctex=1 %O %S';
$biber = 'biber %O %S';
$bibtex_use = 2;
$out_dir = '.';

# Use latexmk with: latexmk -jobname=sempro thesis.tex
