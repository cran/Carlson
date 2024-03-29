#' Incomplete elliptic integral of the first kind
#' @description Evaluate the incomplete elliptic integral of the first kind.
#'
#' @param phi amplitude, real or complex number/vector
#' @param m parameter, real or complex number/vectot
#' @param minerror the bound on the relative error passed to
#'   \code{\link{Carlson_RF}}
#'
#' @return A complex number or vector, the value(s) of the incomplete elliptic
#'   integral \ifelse{html}{\out{F(&phi;,m)}}{\eqn{F(\phi,m)}{F(phi,m)}}.
#' @export
#'
#' @examples elliptic_F(1, 0.2)
#' gsl::ellint_F(1, sqrt(0.2))
elliptic_F <- function(phi, m, minerror = 1e-15) {
  phi <- as.complex(phi)
  m   <- as.complex(m)
  if(length(phi) == 1L) {
    phi <- rep(phi, length(m))
  } else if(length(m) == 1L) {
    m <- rep(m, length(phi))
  } else if(length(phi) != length(m)) {
    stop("Incompatible lengths of `phi` and `m`.")
  }
  ellFcpp(phi, m, minerror)
  # if(phi == 0 || m == Inf || m == -Inf){
  #   as.complex(0)
  # }else if(Re(phi) == 0 && is.infinite(Im(phi)) && Im(m) == 0 && Re(m) > 0 &&
  #          Re(m) < 1){
  #   sign(Im(phi)) *
  #     (elliptic_F(pi/2,m,minerror) - elliptic_F(pi/2,1/m,minerror)/sqrt(m))
  # }else if(abs(Re(phi)) == pi/2 && m == 1){
  #   NaN
  # }else if(Re(phi) >= -pi/2 && Re(phi) <= pi/2){
  #   if(m == 1 && abs(Re(phi)) < pi/2){
  #     as.complex(asinh(tan(phi))) # or atanh(sin(phi))
  #   }else if(m == 0){
  #     as.complex(phi)
  #   }else{
  #     sine <- sin(phi) # sin(999i) = 0+Infi => pb sine2
  #     if(is.infinite(Re(sine)) || is.infinite(Im(sine))){
  #       stop("`sin(phi)` is not finite.")
  #     }
  #     sine2 <- sine*sine
  #     cosine2 <- 1 - sine2
  #     oneminusmsine2 <- 1 - m*sine2
  #     sine * Carlson_RF(cosine2, oneminusmsine2, 1, minerror)
  #   }
  # }else if(Re(phi) > pi/2){
  #   k <- ceiling(Re(phi)/pi - 0.5)
  #   phi <- phi - k*pi
  #   # k <- 0
  #   # while(Re(phi) > pi/2){
  #   #   phi <- phi - pi
  #   #   k <- k + 1
  #   # }
  #   2*k*elliptic_F(pi/2, m, minerror) + elliptic_F(phi, m, minerror)
  # }else{
  #   k <- -floor(0.5 - Re(phi)/pi)
  #   phi <- phi - k*pi
  #   # k <- 0
  #   # while(Re(phi) < -pi/2){
  #   #   phi <- phi + pi
  #   #   k <- k - 1
  #   # }
  #   2*k*elliptic_F(pi/2, m, minerror) + elliptic_F(phi, m, minerror)
  # }
}
