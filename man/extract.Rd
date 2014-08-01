\name{extract}
\alias{extract_pubmed}

\title{Extract}

\description{
Extract data from PubMed files.
}

\usage{
## extract from pubmed file
extract_pubmed(file, what = c("TI", "AUTH", "SRC", "YEAR", "AB"))
}

\arguments{
  \item{file}{A character string giving the name of the file to read.}
  \item{what}{A character vector giving the column name(s) that need to be read. Should be one or more of \code{c("TI", "AUTH", "SRC", "YEAR", "AB")}, referring to Title, Author, Source, Year, and Abstract.}
}

\details{
When doing a \bold{PubMed} search, click \emph{Send to:} in the top right part of the screen, then select \emph{Choose Destination: File} and \emph{Format: MEDLINE}. This will generate a \code{.txt}-file that can be saved on your computer. \code{extract_pubmed} can now be used to extract Title, (first) Author, Source (=journal), Year and Abstract from this file. Use \code{\link{write_cb}} to copy these data to your clipboard and paste them in Excel.\cr
}

\value{
A character matrix containing the requested data.
}

\author{\email{Brecht.Devleesschauwer@UGent.be}}
