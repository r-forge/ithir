\name{ea_spline}
\docType{methods}
\alias{ea_spline}
\alias{ea_spline}
\title{Fits a mass preserving spline}
\description{This function is specific for soil profile data. A continous spline function is fitted upon information recieved about a target soil property at specified depths intervals or soil horizons. The spline however has the unique property of maintaining the integrity of the observed information i.e. the spline has mass preserving properties.}

\usage{ea_spline(obj, var.name, lam = 0.1, d = t(c(0,5,15,30,60,100,200)), vlow = 0, vhigh = 1000, show.progress=TRUE)}

\arguments{
  \item{obj}{Can be an object of class \code{"data.frame"} or \code{"SoilProfileCollection"}} 
  \item{var.name}{character; target variable name (must be a numeric variable)}     
  \item{lam}{numeric; lambda the smoothing parameter}
  \item{d}{numeric; standard depths that are used to extract values from fitted spline i.e harmonising depths}
  \item{vlow}{numeric; smallest value of the target variable (smaller values will be replaced)}
  \item{vhigh}{numeric; highest value of the target variable (larger values will be replaced)}
  \item{show.progress}{logical; Display the progress bar?}
}
\value{Returns a list with four elements:
  \describe{
   \item{\code{harmonised}}{data frame; are spline-estimated values of the target variable at standard depths}
   \item{\code{obs.preds}}{data frame; are observed values together with associated spline predictions for each profile at each depth.}
   \item{\code{var.1cm}}{matrix; are spline-estimated values of the target variable using the 1 cm increments}  
   \item{\code{tmse}}{matrix; True mean square error estimate between observed profiles and associated fitted splines.} 
    
}
}
\note{Target variable needs to be a numeric vector measured at least 2 horizons for the spline to be fitted. Profiles with 1 horizon are accepted and processed as per output requirements, but no spline is fitted as such. Only positive numbers for upper and lower depths can be accepted. It is assumed that soil variables collected per horizon refer to block support i.e. they represent averaged values for the whole horizon. This operation can be time-consuming for large data sets.}

\author{ Brendan Malone }
\references{
\itemize{
  \item Bishop, T.F.A., McBratney, A.B., Laslett, G.M., (1999) \href{http://dx.doi.org/10.1016/S0016-7061(99)00003-8}{Modelling soil attribute depth functions with equal-area quadratic smoothing splines}. Geoderma, 91(1-2): 27-45. 
  \item Malone, B.P., McBratney, A.B., Minasny, B., Laslett, G.M. (2009) \href{http://dx.doi.org/10.1016/j.geoderma.2009.10.007}{Mapping continuous depth functions of soil carbon storage and available water capacity}. Geoderma, 154(1-2): 138-152.
}
}

\examples{
library(aqp)
library(plyr)
library(sp)


#Fit spline 
data(oneProfile)
class(oneProfile)
sp.fit<- ea_spline(oneProfile, var.name="C.kg.m3.")


#Using a SoilProfileCollection
## sample profile from Nigeria:
lon = 3.90; lat = 7.50; id = "ISRIC:NG0017"; FAO1988 = "LXp" 
top = c(0, 18, 36, 65, 87, 127) 
bottom = c(18, 36, 65, 87, 127, 181)
ORCDRC = c(18.4, 4.4, 3.6, 3.6, 3.2, 1.2)
munsell = c("7.5YR3/2", "7.5YR4/4", "2.5YR5/6", "5YR5/8", "5YR5/4", "10YR7/3")
## prepare a SoilProfileCollection:
prof1 <- join(data.frame(id, top, bottom, ORCDRC, munsell), 
         data.frame(id, lon, lat, FAO1988), type='inner')
depths(prof1) <- id ~ top + bottom
site(prof1) <- ~ lon + lat + FAO1988 
coordinates(prof1) <- ~ lon + lat
proj4string(prof1) <- CRS("+proj=longlat +datum=WGS84")

## fit spline:
ORCDRC.s <- ea_spline(prof1, var.name="ORCDRC")
str(ORCDRC.s)

}
\keyword{methods}
