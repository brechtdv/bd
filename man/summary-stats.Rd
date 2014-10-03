\name{bd-summary-stats}
\alias{summary_stats}
\alias{mean_ci}
\alias{hpd}
\alias{sem}
\alias{cv}

\title{Summary statistics}

\description{
Miscellaneous summary statistics.
}

\usage{
## summary statistics
summary_stats(x, hpd = FALSE, na.rm = FALSE)

## mean and 95\% CI
mean_ci(x, \dots)

## highest posterior density interval
hpd(x, alpha)

## standard error of the mean
sem(x, \dots)

## coefficient of variation
cv(x, \dots)
}

\arguments{
  \item{x}{Numerical vector.}
  \item{hpd}{Logical indicating whether highest posterior density intervals should be calculated (\code{TRUE}) or equal tail intervals (\code{FALSE}).}
  \item{na.rm}{Logical indicating whether \code{NA} values should be stripped before the computation proceeds.}
  \item{alpha}{Specifies the 100*(1 - alpha)\% interval to compute.}
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
hpd(x)
sem(x)
cv(x)

}