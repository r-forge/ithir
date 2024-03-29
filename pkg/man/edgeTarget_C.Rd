\name{1km resolution soil carbon map of the Edgeroi District, NSW (S1)}
\docType{data}
\alias{edgeroi SOC 1km}
\alias{target}
\title{Subset of the 1km resolution soil carbon map of the Edgeroi District, NSW}
\description{A \code{RasterLayer} of a subset of the 1km SOC map for the Edgeroi District, NSW. It portrays soil carbon stock for the 0-30cm depth interval only}
\usage{data(edgeTarget_C)}
\format{
\code{edgeTarget_C} is an 7 row, 10 column \code{RasterLayer} of soil carbon stock for a small area in the Edgeroi district NSW, Australia. The grid has a pixel resolution of 1km x 1km. It contains the layer:
  \describe{
  \item{\code{target}}{numeric; predicted soil carbon stock for the 0-30cm depth interval}
}
}
\details{The Edgeroi District, NSW is an intensive cropping area upon the fertile alluvial Namoi River plain. The District has been the subject of many soil invetigations, namely McGarry et al. (1989) whom describe an extensive soil data set collected from the area. More recently, digital soil mapping studies of the area have been conducted, for example, Malone et al. (2009). The 1km mapping of soil carbon stock was performed using digital soil mapping methods McBratney et al. (2003) using the soil data from McGarry et al. (1989) and available environmental covariates.}
\note{The projection for the \code{RasterLayer} is WGS 84 Zone 55. It has the same mapping extent i.e. of the exact same area as the \code{edgeGrids} dataset provided in this package, but a different resolution.}

\references{
\itemize{
\item Malone, B.P., McBratney, A.B., Minasny, B. (2009) \href{http://dx.doi.org/10.1016/j.geoderma.2009.10.007}{Mapping continuous depth functions of soil carbon storage and available water capacity}. Geoderma 154, 138-152.
\item McBratney, A.B., Mendonca Santos, M.L., Minasny, B. (2003) \href{http://dx.doi.org/10.1016/S0016-7061(03)00223-4}{On Digtial Soil mapping}. Geoderma 117: 3-52.
\item McGarry, D., Ward, W.T., McBratney, A.B. (1989) Soil Studies in the Lower Namoi Valley: Methods and Data. The Edgeroi Data Set. (2 vols) (CSIRO Division of Soils: Adelaide).
}
}
\examples{
library(ithir)
library(raster)

data(edgeTarget_C)
target

#plot layer
plot(target, main= "soil carbon stock 0-30cm")

}
\keyword{datasets}
