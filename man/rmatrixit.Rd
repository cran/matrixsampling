% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/student.R
\name{rmatrixit}
\alias{rmatrixit}
\title{Matrix inverted-t sampler}
\usage{
rmatrixit(n, nu, M, U, V, checkSymmetry = TRUE, keep = TRUE)
}
\arguments{
\item{n}{sample size, a positive integer}

\item{nu}{degrees of freedom, any positive number or an
integer strictly greater than \code{1-nrow(M)}}

\item{M}{mean matrix, without constraints}

\item{U}{columns covariance matrix, a positive semidefinite matrix of order equal
to \code{nrow(M)}}

\item{V}{rows covariance matrix, a positive semidefinite matrix of order equal
to \code{ncol(M)}}

\item{checkSymmetry}{logical, whether to check the symmetry of \code{U} and \code{V}}

\item{keep}{logical, whether to return an array with class \pkg{\link[keep]{keep}}}
}
\value{
A numeric three-dimensional array;
simulations are stacked along the third dimension (see example).
}
\description{
Samples the matrix inverted-t distribution.
}
\examples{
nu <- 0
m <- 2
p <- 3
M <- matrix(1, m, p)
U <- toeplitz(m:1)
V <- toeplitz(p:1)
ITsims <- rmatrixit(10000, nu, M, U, V)
dim(ITsims) # 2 3 10000
apply(ITsims, 1:2, mean) # approximates M
vecITsims <- t(apply(ITsims, 3, function(X) c(t(X))))
round(cov(vecITsims),2) # approximates 1/(nu+m+p-1) * kronecker(U,V)
}
