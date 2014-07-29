###=========================================================================#
### SUMMARY STATS ==========================================================#


###=========================================================================#
###== FUNCTIONS ============================================================#
###-- summary_stats ............. calculate summary statistics
###---| mean_ci ................. calculate mean and 95% confidence interval
###-- sem ....................... calculate standard error of the mean
###-- cv ........................ calculate coefficient of variation

##--------------------------------------------------------------------------#
## Calculate summary statistics --------------------------------------------#
summary_stats <-
function(x, na.rm = FALSE) {
  if (!na.rm && any(is.na(x))) {
    warning(paste("'x' contains", sum(is.na(x)), "NA's"))
  }

  stats <-
    c(mean = mean(x, na.rm = na.rm),
      median = median(x, na.rm = na.rm),
      quantile(x, c(.025, .05, .95, .975), na.rm = na.rm))
  return(stats)
}

##--------------------------------------------------------------------------#
## Calculate mean and 95% confidence interval ------------------------------#
mean_ci <-
function(x, ...) {
  stats <- summary_stats(x, ...)
  mean_ci <- stats[c(1, 3, 6)]
  return(mean_ci)
}


##--------------------------------------------------------------------------#
## Calculate standard error of the mean ------------------------------------#
sem <-
function(x, ...) {
  sem <- sd(x, ...) / sqrt(length(x))
  return(sem)
}


##--------------------------------------------------------------------------#
## Calculate coefficient of variation --------------------------------------#
cv <-
function(x, ...) {
  cv <- sd(x, ...) / mean(x, ...)
  return(cv)
}