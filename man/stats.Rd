\name{bd-stats}
\alias{logit}
\alias{expit}
\alias{rgamma2}
\alias{rlnorm2}

\title{Stats}

\description{
Miscellaneous statistical functions.
}

\usage{
## logistic transformation
logit(x)

## inverse logistic transformation
expit(x)

## random Gamma deviates with given mean and SD
rgamma2(n, mean, sd)

## random log-normal deviates with given mean and SD
rlnorm2(n, mean, sd)
}

\arguments{
  \item{x}{Vector of values to be transformed.}
  \item{n}{Number of random deviates.}
  \item{mean}{Mean of random deviates.}
  \item{sd}{Standard deviation of random deviates.}
}

\details{
logit(x) = log(x / (1 - x))\cr
expit(x) = exp(x) / (1 + exp(x))
}

\author{\email{brechtdv@gmail.com}}
