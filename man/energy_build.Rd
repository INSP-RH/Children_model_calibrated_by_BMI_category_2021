% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/energy_build.R
\name{energy_build}
\alias{energy_build}
\title{Energy Matrix Interpolating Function}
\usage{
energy_build(energy, time, interpolation = "Brownian")
}
\arguments{
\item{energy}{(matrix) Matrix with each row representing an individual and each column
a moment in time in which energy was measured. Energy is assumed to be measured at time 0 
initially.}

\item{time}{(vector) Vector of times at which the measurements (columns of energy) 
were made. \strong{Note} that first element of time most always be \code{0}. 

\strong{ Optional }}

\item{interpolation}{(string) Way to interpolate the values between measurements. Currently
supporting \code{"Linear"}, \code{"Exponential"}, \code{"Stepwise_R"},  \code{"Stepwise_L"},
\code{"Logarithmic"} and \code{"Brownian"}.}
}
\description{
Creates a matrix interpolating energy consumption
from measurements at specific moments in time.
}
\examples{
#EXAMPLE 1: INDIVIDUAL MODELLING
#--------------------------------------------------------

#Get energy consumption
myconsumption <- energy_build(c(0, 200, -500), c(0, 365*2, 365*4), "Linear")
plot(1:(365*4), myconsumption, type = "l")

#Change interpolation to exponential
myexponential <- energy_build(c(0, 200, -500), c(0, 365*2, 365*4), "Exponential")
lines(1:(365*4), myexponential, type = "l", col = "red")

mystepwise    <- energy_build(c(0, 200, -500), c(0, 365*2, 365*4), "Stepwise_R")
lines(1:(365*4), mystepwise, type = "l", col = "blue")

mystepwise2    <- energy_build(c(0, 200, -500), c(0, 365*2, 365*4), "Stepwise_L")
lines(1:(365*4), mystepwise2, type = "l", col = "green")

mylogarithmic <- energy_build(c(0, 200, -500), c(0, 365*2, 365*4), "Logarithmic")
lines(1:(365*4), mylogarithmic, type = "l", col = "purple")

mybrownian    <- energy_build(c(0, 200, -500), c(0, 365*2, 365*4), "Brownian")
lines(1:(365*4), mybrownian, type = "l", col = "forestgreen")

#EXAMPLE 2: GROUP MODELLING
#--------------------------------------------------------

#Get energy consumption
multiple <- energy_build(cbind(runif(10,1000,2000), 
                                 runif(10,1000,2000), 
                                 runif(10,1000,2000)), c(0, 142, 365),
                                 "Brownian")
matplot(1:365, t(multiple), type = "l")
}
\seealso{
\code{\link{adult_weight}} for weight change in adults and
\code{\link{child_weight}} for children weight change.
}
\author{
Dalia Camacho-Garc??a-Forment?? \email{daliaf172@gmail.com}

Rodrigo Zepeda-Tello \email{rzepeda17@gmail.com}
}
