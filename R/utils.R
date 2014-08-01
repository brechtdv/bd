###=========================================================================#
### UTILS ==================================================================#
###=========================================================================#
###-- collapse0 ................... collapse elements without separator
###-- write_cb .................... write to Windows clipboard
###-- read_cb ..................... read from Windows clipboard
###-- today ....................... return today's date in yyymmdd format
###-- now ......................... return current time
###-- extract_pubmed .............. extract data from PubMed file


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


##--------------------------------------------------------------------------#
## Return today's date in yyyymmdd format ----------------------------------#
today <-
function() {
  return(format(Sys.time(), "%Y%m%d"))
}


##--------------------------------------------------------------------------#
## Return current time -----------------------------------------------------#
now <-
function() {
  return(Sys.time())
}


##--------------------------------------------------------------------------#
## Extract data from PubMed file -------------------------------------------#
extract_pubmed <-
function(file, what = c("TI", "AUTH", "SRC", "YEAR", "AB")) {
  ## read file as character vector
  x <- readLines(file)

  ## check 'what'
  what <- match.arg(what, several.ok = TRUE)

  ## initialize 'out'
  out <- NULL

  ## ABSTRACT
  if ("AB" %in% what) {
    y <- character()
    t <- FALSE

    for (i in seq_along(x)) {
      if (t && identical(substr(x[i], 0, 6), "PMID- ")) {
        y <- c(y, "NA")
        t <- FALSE
      }
      if (identical(substr(x[i], 0, 6), "PMID- "))
        t <- TRUE
      if (t && identical(substr(x[i], 0, 4), "AB  ")) {
        ab <- substr(x[i], 7, nchar(x[i]))
        j <- i + 1
        while(identical(substr(x[j], 0, 4), "    ")) {
          ab <- paste(ab, substr(x[j], 7, nchar(x[j])))
          j <- j + 1
        }
        y <- c(y, ab)
        t <- FALSE
      }
    }

    out <- cbind(y, out)
  }

  ## YEAR
  if ("YEAR" %in% what) {
    y <- character()
    t <- FALSE

    for (i in seq_along(x)) {
      if (identical(substr(x[i], 0, 3), "DP ")) {
        year <- substr(x[i], 4, nchar(x[i]))
        year <- strsplit(year, " ")[[1]][3]
        y <- c(y, year)
      }
    }

    out <- cbind(y, out)
  }

  ## SOURCE
  if ("SRC" %in% what) {
    y <- character()
    t <- FALSE

    for (i in seq_along(x)) {
      if (t && identical(substr(x[i], 0, 6), "PMID- ")) {
        y <- c(y, "NA")
        t <- FALSE
      }
      if (identical(substr(x[i], 0, 6), "PMID- "))
        t <- TRUE
      if (t && identical(substr(x[i], 0, 4), "JT  ")) {
        auth <- substr(x[i], 7, nchar(x[i]))
        y <- c(y, auth)
        t <- FALSE
      }
    }

    out <- cbind(y, out)
  }

  ## AUTHOR
  if ("AUTH" %in% what) {
    y <- character()
    t <- FALSE

    for (i in seq_along(x)) {
      if (t && identical(substr(x[i], 0, 6), "PMID- ")) {
        y <- c(y, "NA")
        t <- FALSE
      }
      if (identical(substr(x[i], 0, 6), "PMID- "))
        t <- TRUE
      if (t && identical(substr(x[i], 0, 4), "FAU ")) {
        auth <- substr(x[i], 7, nchar(x[i]))
        auth <- strsplit(auth, ",")[[1]][1]
        y <- c(y, auth)
        t <- FALSE
      }
    }

    out <- cbind(y, out)
  }

  ## TITLE
  if ("TI" %in% what) {
    y <- character()
    t <- FALSE

    for (i in seq_along(x)) {
      if (t && identical(substr(x[i], 0, 3), "   ")) {
        y[length(y)] <- paste(y[length(y)], substr(x[i], 7, nchar(x[i])))
      } else {
        t <- FALSE
      }
      if (identical(substr(x[i], 0, 3), "TI ")) {
        y <- c(y, substr(x[i], 7, nchar(x[i])))
        t <- TRUE
      }
    }

    out <- cbind(y, out)
  }

  order <- order(match(what, c("TI", "AUTH", "SRC", "YEAR", "AB")))
  return(out[, order])
}
