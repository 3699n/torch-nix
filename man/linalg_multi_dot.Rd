% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/linalg.R
\name{linalg_multi_dot}
\alias{linalg_multi_dot}
\title{Efficiently multiplies two or more matrices}
\usage{
linalg_multi_dot(tensors)
}
\arguments{
\item{tensors}{(\code{Sequence[Tensor]}): two or more tensors to multiply. The first and last
tensors may be 1D or 2D. Every other tensor must be 2D.}
}
\description{
Efficiently multiplies two or more matrices by reordering the multiplications so that
the fewest arithmetic operations are performed.
}
\details{
Supports inputs of \code{float}, \code{double}, \code{cfloat} and \code{cdouble} dtypes.
This function does not support batched inputs.

Every tensor in \code{tensors} must be 2D, except for the first and last which
may be 1D. If the first tensor is a 1D vector of shape \verb{(n,)} it is treated as a row vector
of shape \verb{(1, n)}, similarly if the last tensor is a 1D vector of shape \verb{(n,)} it is treated
as a column vector of shape \verb{(n, 1)}.

If the first and last tensors are matrices, the output will be a matrix.
However, if either is a 1D vector, then the output will be a 1D vector.
}
\note{
This function is implemented by chaining \code{\link[=torch_mm]{torch_mm()}} calls after
computing the optimal matrix multiplication order.

The cost of multiplying two matrices with shapes \verb{(a, b)} and \verb{(b, c)} is
\code{a * b * c}. Given matrices \code{A}, \code{B}, \code{C} with shapes \verb{(10, 100)},
\verb{(100, 5)}, \verb{(5, 50)} respectively, we can calculate the cost of different
multiplication orders as follows:

\Sexpr[results=rd, stage=build]{torch:::math_to_rd("
\\\\begin{align*}
\\\\operatorname{cost}((AB)C) &= 10 \\\\times 100 \\\\times 5 + 10 \\\\times 5 \\\\times 50 = 7500 \\\\
\\\\operatorname{cost}(A(BC)) &= 10 \\\\times 100 \\\\times 50 + 100 \\\\times 5 \\\\times 50 = 75000
\\\\end{align*}
")}

In this case, multiplying \code{A} and \code{B} first followed by \code{C} is 10 times faster.
}
\examples{
if (torch_is_installed()) {

linalg_multi_dot(list(torch_tensor(c(1, 2)), torch_tensor(c(2, 3))))
}
}
\seealso{
Other linalg: 
\code{\link{linalg_cholesky}()},
\code{\link{linalg_cholesky_ex}()},
\code{\link{linalg_det}()},
\code{\link{linalg_eig}()},
\code{\link{linalg_eigh}()},
\code{\link{linalg_eigvals}()},
\code{\link{linalg_eigvalsh}()},
\code{\link{linalg_householder_product}()},
\code{\link{linalg_inv}()},
\code{\link{linalg_inv_ex}()},
\code{\link{linalg_lstsq}()},
\code{\link{linalg_matrix_norm}()},
\code{\link{linalg_matrix_power}()},
\code{\link{linalg_matrix_rank}()},
\code{\link{linalg_norm}()},
\code{\link{linalg_pinv}()},
\code{\link{linalg_qr}()},
\code{\link{linalg_slogdet}()},
\code{\link{linalg_solve}()},
\code{\link{linalg_solve_triangular}()},
\code{\link{linalg_svd}()},
\code{\link{linalg_svdvals}()},
\code{\link{linalg_tensorinv}()},
\code{\link{linalg_tensorsolve}()},
\code{\link{linalg_vector_norm}()}
}
\concept{linalg}
