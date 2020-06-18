% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/nn-activation.R
\name{nn_leaky_relu}
\alias{nn_leaky_relu}
\title{LeakyReLU module}
\usage{
nn_leaky_relu(...)
}
\arguments{
\item{negative_slope}{Controls the angle of the negative slope. Default: 1e-2}

\item{inplace}{can optionally do the operation in-place. Default: \code{FALSE}}
}
\description{
Applies the element-wise function:
}
\details{
\deqn{
  \text{LeakyReLU}(x) = \max(0, x) + \text{negative\_slope} * \min(0, x)
}
or

\deqn{
  \text{LeakyRELU}(x) =
  \begin{cases}
x, & \text{ if } x \geq 0 \\
\text{negative\_slope} \times x, & \text{ otherwise }
\end{cases}
}
}
\section{Shape}{

\itemize{
\item Input: \eqn{(N, *)} where \code{*} means, any number of additional
dimensions
\item Output: \eqn{(N, *)}, same shape as the input
}
}

\examples{
m <- nn_leaky_relu(0.1)
input <- torch_randn(2)
output <- m(input)

}