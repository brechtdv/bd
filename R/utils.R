###=========================================================================#
### UTILS ==================================================================#
###=========================================================================#
###-- collapse0 ................... collapse elements without separator
###-- write_cb .................... write to Windows clipboard
###-- read_cb ..................... read from Windows clipboard
###-- pubmed_extract .............. extract PubMed file

##--------------------------------------------------------------------------#
## Collapse elements without separator -------------------------------------#
collapse0 <-
function(...) {
  .Internal(paste0(list(...), collapse = ""))
}

##--------------------------------------------------------------------------#
## Write to Windows clipboard ----------------------------------------------#
write_cb <-
function(x, quote = FALSE, dec = ",", sep = "\t",
         row.names = FALSE, col.names = FALSE, ...) {
  write.table(x, file = "clipboard",
              quote = quote, dec = dec, sep = sep,
              row.names = row.names, col.names = col.names, ...)
}

##--------------------------------------------------------------------------#
## Read from Windows clipboard ---------------------------------------------#
read_cb <-
function(dec = ",", sep = "\t", ...) {
  read.table(file = "clipboard",
             dec = dec, sep = sep, ...)
}
