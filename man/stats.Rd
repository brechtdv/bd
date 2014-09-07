\name{bd-stats}
\alias{logit}
\alias{expit}

\title{Stats}

\description{
Miscellaneous statistical functions.
}

\usage{
## logistic transformation
logit(x)

## inverse logistic transformation
expit(x)
}

\arguments{
  \item{x}{Vector of values to be transformed.}
}

\details{
logit(x) = log(x / (1 - x))\cr
expit(x) = exp(x) / (1 + exp(x))
}

\author{\email{Brecht.Devleesschauwer@UGent.be}}
