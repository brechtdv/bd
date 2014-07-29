\name{bd-package}
\alias{bd-package}
\alias{bd}

\docType{package}

\title{Brecht Devleesschauwer's helper functions}

\description{A suite of miscellaneous summary statistics and utils. }

\details{
  \tabular{ll}{
    Package:    \tab  bd\cr
    Type:       \tab  Package\cr
    Version:    \tab  0.0.1\cr
    Date:       \tab  2013-07-29\cr
    Authors:    \tab  Brecht Devleesschauwer\cr
    Maintainer: \tab  \email{Brecht.Devleesschauwer@UGent.be}\cr
    Depends:    \tab  R (>= 3.0.0)\cr
    License:    \tab  GPL (>= 2)\cr
    LazyLoad:   \tab  yes\cr
}

Available functions in the \pkg{bd} package:
  \tabular{ll}{
    \strong{Utils}\cr
    \code{\link{collapse0}}      \tab Collapse elements without separator.\cr
    \code{\link{write_cb}}       \tab Write to Windows clipboard.\cr
    \code{\link{read_cb}}        \tab Read from Windows clipboard.\cr\cr

    \strong{Summary statistics}\cr
    \code{\link{summary_stats}}  \tab Calculate summary statistics.\cr
    \code{\link{mean_ci}}        \tab Calculate mean and 95\% confidence interval.\cr
    \code{\link{sem}}            \tab Calculate standard error of the mean.\cr
    \code{\link{cv}}             \tab Calculate coefficient of variation.\cr\cr
  }
}

\keyword{package}
