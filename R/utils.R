###=========================================================================#
### UTILS ==================================================================#
###=========================================================================#
###-- collapse0 ................... collapse elements without separator
###-- openwd ...................... open working directory
###-- write_cb .................... write to Windows clipboard
###-- read_cb ..................... read from Windows clipboard
###-- today ....................... return today's date in yyymmdd format
###-- now ......................... return current time
###-- extract_pubmed .............. extract data from PubMed file
###-- logit ....................... log(p / (1 - p))
###-- expit ....................... exp(x) / (1 + exp(x))
###-- convert ..................... read and save as


##--------------------------------------------------------------------------#
## Collapse elements without separator -------------------------------------#
collapse0 <-
function(...) {
  .Internal(paste0(list(...), collapse = ""))
}


##--------------------------------------------------------------------------#
## Open working directory --------------------------------------------------#
openwd <-
function() {
  shell.exec(getwd())
}


##--------------------------------------------------------------------------#
## Write to Windows clipboard ----------------------------------------------#
write_cb <-
function(x, limit = 32, quote = FALSE, dec = ",", sep = "\t",
         row.names = FALSE, col.names = FALSE, ...) {
  clipboard_string <- paste0("clipboard-", limit)
  write.table(x, file = clipboard_string,
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


##--------------------------------------------------------------------------#
## Logit, Expit ------------------------------------------------------------#
logit <-
function(x) {
  log(x / (1 - x)
}

expit <-
function(x) {
  exp(x) / (1 + exp(x))
}


##--------------------------------------------------------------------------#
## Read and save as --------------------------------------------------------#
convert <-
function(file,
         from = c("csv2", "csv", "delim2", "delim"),
         to = c("csv", "csv2", "delim2", "delim"), ...) {
  from <- match.arg(from)
  to <- match.arg(to)
  if (from == to) stop("'from' should be different than 'to'")

  ## read file
  data <-
    switch(from,
           csv2 = read.csv2(file, ...),
           csv = read.csv(file, ...),
           delim2 = read.delim2(file, ...),
           delim = read.delim(file, ...))

  ## save as
  file_to <- paste0("copy_", file)
  switch(to,
         csv2 = write.csv2(data, file_to),
         csv = write.csv(data, file_to),
         delim2 =
           write.table(data, file_to,
                       header = TRUE, sep = "\t", dec = ","),
         delim =
           write.table(data, file_to,
                       header = TRUE, sep = "\t", dec = "."))
}