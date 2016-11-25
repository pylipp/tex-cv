# From https://tex.stackexchange.com/questions/58963/latexmk-with-makeglossaries-and-auxdir-and-outdir#59098
add_cus_dep('glo', 'gls', 0, 'makeglossaries');
sub makeglossaries {
  my ($base_name, $path) = fileparse($_[0]);
  pushd $path;
  my $return = system "makeglossaries $base_name";
  popd;
  return $return;
}
# from http://dlpeterson.com/2013/08/latex-workflow/
# Choose xelatex as the default builder of pdfs, don't stop for errors, use synctex
$pdflatex = 'pdflatex -interaction=nonstopmode %O %S';
# .bbl files assumed to be regeneratable, safe as long as the .bib file is available
$bibtex_use = 2;
# User biber instead of bibtex
$biber = 'biber --debug %O %S';
# Default pdf viewer
$pdf_previewer = 'evince %O %S';
# Use these two configs instead of the flags -pdf and -pvc
# Create pdf 
#$pdf_mode = 1;
# 
#$preview_continuous_mode = 1;
