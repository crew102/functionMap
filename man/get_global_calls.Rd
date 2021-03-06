% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/expressions.R
\name{get_global_calls}
\alias{get_global_calls}
\title{Get global function calls from a function}
\usage{
get_global_calls(func, funcname, envir = parent.frame())
}
\arguments{
\item{func}{The function to examine.}

\item{funcname}{Name of the function.}

\item{envir}{The environment containing the function. This environment
is also used to look for S3 methods.}
}
\value{
A data frame of function calls and call types.
}
\description{
Note the results are approximate only. R's dynamic nature
does not allow us to always find the global calls reliably.
}
\details{
Calls can be: \itemize{
  \item Direct function calls.
  \item Function calls via \code{do.call}.
  \item Calls to external functions via \code{.C}, \code{.Call}, etc.
  \item We assume that an S3 generic calls all its methods
    in the supplied environment.
}

Internally we use \code{\link[codetools]{findGlobals}} for finding
the global calls and variables.

Note that by default calls to base function are also included in the
result, even of they are primitive functions (e.g. \code{<-},
\code{==}, etc.).
}
\keyword{internal}

