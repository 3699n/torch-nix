% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/nn.R
\name{clone_module}
\alias{clone_module}
\title{Clone a torch module.}
\usage{
clone_module(module, deep = FALSE, ..., replace_values = TRUE)
}
\arguments{
\item{module}{(\code{\link{nn_module}})\cr
The module to clone}

\item{deep}{(\code{logical(1)})\cr
Whether to create a deep clone.}

\item{...}{(any)\cr
Additional parameters, currently unused.}

\item{replace_values}{(\code{logical(1)})\cr
Whether to replace parameters and buffers with the cloned values.}
}
\description{
Clones a module.
}
\examples{
if (torch_is_installed()) {
clone_module(nn_linear(1, 1), deep = TRUE)
# is the same as
nn_linear(1, 1)$clone(deep = TRUE)
}
}
