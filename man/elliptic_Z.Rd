% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/elliptic_Z.R
\name{elliptic_Z}
\alias{elliptic_Z}
\title{Jacobi zeta function}
\usage{
elliptic_Z(phi, m, minerror = 1e-15)
}
\arguments{
\item{phi}{amplitude, real or complex number/vector}

\item{m}{parameter, real or complex number/vector}

\item{minerror}{bound on relative error passed to \code{\link{elliptic_E}}
and \code{\link{elliptic_F}}}
}
\value{
A complex number or vector, the value(s) of the Jacobi zeta function
  \ifelse{html}{\out{Z(&phi;,m)}}{\eqn{Z(\phi,m)}{Z(phi,m)}}.
}
\description{
Evaluate the Jacobi zeta function.
}
