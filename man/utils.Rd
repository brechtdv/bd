\name{bd-utils}
\alias{openwd}
\alias{collapse}
\alias{write_cb}
\alias{read_cb}
\alias{today}
\alias{now}
\alias{convert}
\alias{multiplot}
\alias{prop_table}
\alias{dropbox}
\alias{github}
\alias{sanitize_specials}
\alias{html_body}
\alias{readxl}
\alias{quiet_source}

\title{Utils}

\description{
Miscellaneous utility functions. Note that some of these only work under Windows.
}

\usage{
## open working directory
openwd()

## collapse elements without separator
collapse(\dots)

## write to Windows clipboard
write_cb(x, limit = 32, quote = FALSE, dec = ",", sep = "\t",
         row.names = FALSE, col.names = FALSE, \dots)

## read from Windows clipboard
read_cb(dec = ",", sep = "\t", \dots)

## return today's date in yyyymmdd format
today()

## return current time
now()

## read and save as
convert(file,
        from = c("csv2", "csv", "delim2", "delim", "dta"),
        to = c("csv", "csv2", "delim2", "delim", "dta"), \dots)

## plot multiple ggplot2 objects
multiplot(\dots, cols = 1, layout = NULL)

## return proportional table
prop_table(x, \dots)

## translate special characters to HTML or LaTeX
sanitize_specials(char, type = c("html", "latex"))

## read Excel file as data.frame
readxl(\dots)

## source file without printing/plotting
quiet_source(file)
}

\arguments{
  \item{x}{The object to be written to clipboard, preferably a vector, matrix or data frame.}
  \item{limit}{The limit on the text to be written to the clipboard. Defaults to 32Kb.}
  \item{quote}{A logical value (\code{TRUE} or \code{FALSE}) or a numeric vector. If \code{TRUE}, any character or factor columns will be surrounded by double quotes. If a numeric vector, its elements are taken as the indices of columns to quote. In both cases, row and column names are quoted if they are written. If \code{FALSE}, nothing is quoted. Defaults to \code{FALSE}.}
  \item{dec}{The string to use for decimal points in numeric or complex columns; must be a single character. Defaults to \code{","}.}
  \item{sep}{The field separator string. Values within each row of \code{x} are separated by this string. Defaults to \code{"\t"}.}
  \item{row.names}{Either a logical value indicating whether the row names of \code{x} are to be written along with \code{x}, or a character vector of row names to be written. Defaults to \code{FALSE}.}
  \item{col.names}{Either a logical value indicating whether the column names of \code{x} are to be written along with \code{x}, or a character vector of column names to be written. Defaults to \code{FALSE}.}
  
  \item{file}{File name.}
  \item{from}{Original format.}
  \item{to}{Format to which the file must be converted.}
  
  \item{cols}{Desired number of columns.}
  \item{layout}{Plot layout; optional.}

  \item{char}{Character vector.}
  \item{type}{Translate to \code{html} or \code{latex}.}
  
  \item{\dots}{For \code{collapse0}: Elements to be collapsed;
  \cr For \code{write_cb}: Other arguments to be passed to \code{\link{write.table}};
  \cr For \code{read_cb}: Other arguments to be passed to \code{\link{read.table}};
  \cr For \code{multiplot}: ggplot2 objects;
  \cr For \code{readxl}: Arguments to be passed to \code{read_excel}.}
}

\author{\email{brechtdv@gmail.com}}
