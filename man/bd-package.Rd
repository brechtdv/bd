\name{bd-package}
\alias{bd-package}
\alias{bd}

\docType{package}

\title{brechtdv's helper functions}

\description{Miscellaneous summary statistics and utils.}

\details{
  \tabular{ll}{
    Package:    \tab  bd\cr
    Type:       \tab  Package\cr
    Version:    \tab  0.0.12\cr
    Date:       \tab  2017-10-17\cr
    Authors:    \tab  Brecht Devleesschauwer\cr
    Maintainer: \tab  \email{brechtdv@gmail.com}\cr
    Depends:    \tab  R (>= 3.4.0)\cr
    License:    \tab  GPL (>= 2)\cr
    LazyLoad:   \tab  yes\cr
}

Available functions in the \pkg{bd} package:
  \tabular{ll}{
    \strong{Utils}\cr
    \code{\link{openwd}}             \tab Open working directory.\cr
    \code{\link{collapse} }          \tab Collapse elements without separator.\cr
    \code{\link{write_cb}}           \tab Write to Windows clipboard.\cr
    \code{\link{read_cb}}            \tab Read from Windows clipboard.\cr
    \code{\link{today}}              \tab Return today's date in yyyymmdd format.\cr
    \code{\link{now}}                \tab Return current time.\cr
    \code{\link{extract_pubmed}}     \tab Extract data from PubMed file.\cr
    \code{\link{convert}}            \tab Read and save as.\cr
    \code{\link{multiplot}}          \tab Plot multiple ggplot2 objects.\cr
    \code{\link{prop_table}}         \tab Return proportional table.\cr
    \code{\link{dropbox}}            \tab Path to Dropbox folder.\cr
    \code{\link{github}}             \tab Path to GitHub folder.\cr
    \code{\link{sanitize_specials}}  \tab Translate special characters to HTML or LaTeX.\cr
    \code{\link{html_body}}          \tab RMarkdown template for HTML body only.\cr
    \code{\link{readxl}}             \tab Read Excel file as data.frame.\cr\cr

    \strong{Summary statistics}\cr
    \code{\link{summary_stats}}      \tab Calculate summary statistics.\cr
    \code{\link{mean_ci}}            \tab Calculate mean and 95\% confidence interval.\cr
    \code{\link{hpd}}                \tab Highest posterior density interval.\cr
    \code{\link{sem}}                \tab Calculate standard error of the mean.\cr
    \code{\link{cv}}                 \tab Calculate coefficient of variation.\cr\cr
    
    \strong{Statistical functions}\cr
    \code{\link{logit}}              \tab Logistic transformation.\cr
    \code{\link{expit}}              \tab Inverse logistic transformation.\cr
    \code{\link{rgamma2}}            \tab Random Gamma deviates with given mean and SD.\cr
    \code{\link{rlnorm2}}            \tab Random log-normal deviates with given mean and SD.\cr
  }
}

\keyword{package}
