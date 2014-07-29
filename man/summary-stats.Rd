\name{bd-summary-stats}
\alias{summary_stats}
\alias{mean_ci}
\alias{sem}
\alias{cv}

\title{Summary statistics}

\description{
Miscellaneous summary statistics.
}

\usage{
## summary statistics
summary_stats(x, na.rm = FALSE)

## mean and 95\% CI
mean_ci(x, \dots)

## standard error of the mean
sem(x, \dots)

## coefficient of variation
cv(x, \dots)
}

\arguments{
  \item{x}{Numerical vector.}
  \item{na.rm}{A logical value indicating whether \code{NA} values should be stripped before the computation proceeds.}
  \item{\dots}{Other arguments to be passed to other methods.}
}

\details{
SEM is defined as SD / sqrt(n), with n the number of observations;
CV is defined as SD / mean.
}

\author{\email{Brecht.Devleesschauwer@UGent.be}}

\examples{
x <- rnorm(100)
summary_stats(x)
mean_ci(x)
sem(x)
cv(x)

}