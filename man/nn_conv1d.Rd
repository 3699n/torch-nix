% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/nn-conv.R
\name{nn_conv1d}
\alias{nn_conv1d}
\title{Conv1D module}
\usage{
nn_conv1d(
  in_channels,
  out_channels,
  kernel_size,
  stride = 1,
  padding = 0,
  dilation = 1,
  groups = 1,
  bias = TRUE,
  padding_mode = "zeros"
)
}
\arguments{
\item{in_channels}{(int): Number of channels in the input image}

\item{out_channels}{(int): Number of channels produced by the convolution}

\item{kernel_size}{(int or tuple): Size of the convolving kernel}

\item{stride}{(int or tuple, optional): Stride of the convolution. Default: 1}

\item{padding}{(int, tuple or str, optional) – Padding added to both sides of
the input. Default: 0}

\item{dilation}{(int or tuple, optional): Spacing between kernel
elements. Default: 1}

\item{groups}{(int, optional): Number of blocked connections from input
channels to output channels. Default: 1}

\item{bias}{(bool, optional): If \code{TRUE}, adds a learnable bias to the
output. Default: \code{TRUE}}

\item{padding_mode}{(string, optional): \code{'zeros'}, \code{'reflect'},
\code{'replicate'} or \code{'circular'}. Default: \code{'zeros'}}
}
\description{
Applies a 1D convolution over an input signal composed of several input
planes.
In the simplest case, the output value of the layer with input size
\eqn{(N, C_{\mbox{in}}, L)} and output \eqn{(N, C_{\mbox{out}}, L_{\mbox{out}})} can be
precisely described as:
}
\details{
\deqn{
\mbox{out}(N_i, C_{\mbox{out}_j}) = \mbox{bias}(C_{\mbox{out}_j}) +
  \sum_{k = 0}^{C_{in} - 1} \mbox{weight}(C_{\mbox{out}_j}, k)
\star \mbox{input}(N_i, k)
}

where \eqn{\star} is the valid
\href{https://en.wikipedia.org/wiki/Cross-correlation}{cross-correlation} operator,
\eqn{N} is a batch size, \eqn{C} denotes a number of channels,
\eqn{L} is a length of signal sequence.
\itemize{
\item \code{stride} controls the stride for the cross-correlation, a single
number or a one-element tuple.
\item \code{padding} controls the amount of implicit zero-paddings on both sides
for \code{padding} number of points.
\item \code{dilation} controls the spacing between the kernel points; also
known as the à trous algorithm. It is harder to describe, but this
\href{https://github.com/vdumoulin/conv_arithmetic/blob/master/README.md}{link}
has a nice visualization of what \code{dilation} does.
\item \code{groups} controls the connections between inputs and outputs.
\code{in_channels} and \code{out_channels} must both be divisible by
\code{groups}. For example,
\itemize{
\item At groups=1, all inputs are convolved to all outputs.
\item At groups=2, the operation becomes equivalent to having two conv
layers side by side, each seeing half the input channels,
and producing half the output channels, and both subsequently
concatenated.
\item At groups= \code{in_channels}, each input channel is convolved with
its own set of filters,
of size \eqn{\left\lfloor\frac{out\_channels}{in\_channels}\right\rfloor}.
}
}
}
\section{Note}{


Depending of the size of your kernel, several (of the last)
columns of the input might be lost, because it is a valid
\code{cross-correlation}\emph{, and not a full \code{cross-correlation}}.
It is up to the user to add proper padding.

When \code{groups == in_channels} and \code{out_channels == K * in_channels},
where \code{K} is a positive integer, this operation is also termed in
literature as depthwise convolution.
In other words, for an input of size \eqn{(N, C_{in}, L_{in})},
a depthwise convolution with a depthwise multiplier \code{K}, can be constructed by arguments
\eqn{(C_{\mbox{in}}=C_{in}, C_{\mbox{out}}=C_{in} \times K, ..., \mbox{groups}=C_{in})}.
}

\section{Shape}{

\itemize{
\item Input: \eqn{(N, C_{in}, L_{in})}
\item Output: \eqn{(N, C_{out}, L_{out})} where
}

\deqn{
  L_{out} = \left\lfloor\frac{L_{in} + 2 \times \mbox{padding} - \mbox{dilation}
    \times (\mbox{kernel\_size} - 1) - 1}{\mbox{stride}} + 1\right\rfloor
}
}

\section{Attributes}{

\itemize{
\item weight (Tensor): the learnable weights of the module of shape
\eqn{(\mbox{out\_channels}, \frac{\mbox{in\_channels}}{\mbox{groups}}, \mbox{kernel\_size})}.
The values of these weights are sampled from
\eqn{\mathcal{U}(-\sqrt{k}, \sqrt{k})} where
\eqn{k = \frac{groups}{C_{\mbox{in}} * \mbox{kernel\_size}}}
\item bias (Tensor): the learnable bias of the module of shape
(out_channels). If \code{bias} is \code{TRUE}, then the values of these weights are
sampled from \eqn{\mathcal{U}(-\sqrt{k}, \sqrt{k})} where
\eqn{k = \frac{groups}{C_{\mbox{in}} * \mbox{kernel\_size}}}
}
}

\examples{
if (torch_is_installed()) {
m <- nn_conv1d(16, 33, 3, stride = 2)
input <- torch_randn(20, 16, 50)
output <- m(input)
}
}
