% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/distributions-normal.R
\name{distr_normal}
\alias{distr_normal}
\title{Creates a normal (also called Gaussian) distribution parameterized by
\code{loc} and \code{scale}.}
\usage{
distr_normal(loc, scale, validate_args = NULL)
}
\arguments{
\item{loc}{(float or Tensor): mean of the distribution (often referred to as mu)}

\item{scale}{(float or Tensor): standard deviation of the distribution (often referred to as sigma)}

\item{validate_args}{Additional arguments}
}
\value{
Object of \code{torch_Normal} class
}
\description{
Creates a normal (also called Gaussian) distribution parameterized by
\code{loc} and \code{scale}.
}
\examples{
if (torch_is_installed()) {
m <- distr_normal(loc = 0, scale = 1)
m$sample() # normally distributed with loc=0 and scale=1
}
}
\seealso{
\link{Distribution} for details on the available methods.

Other distributions: 
\code{\link{distr_bernoulli}()},
\code{\link{distr_chi2}()},
\code{\link{distr_gamma}()},
\code{\link{distr_multivariate_normal}()},
\code{\link{distr_poisson}()}
}
\concept{distributions}
