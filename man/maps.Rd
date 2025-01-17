% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/maps.R
\name{coord_trans2gaode}
\alias{coord_trans2gaode}
\alias{coord_get}
\alias{coord_rev}
\title{Map tools}
\usage{
coord_trans2gaode(
  coord,
  type = "baidu",
  key = "f538a09476ee5a6d62b457684b6c32a5",
  output = "JSON"
)

coord_get(address, key = "f538a09476ee5a6d62b457684b6c32a5", output = "JSON")

coord_rev(coord, key = "f538a09476ee5a6d62b457684b6c32a5", output = "JSON")
}
\arguments{
\item{coord}{string, Latitude follows longitude, separated by commas.\\n
eg:"108.952560,34.204798"}

\item{type}{"baidu", "gps"}

\item{key}{amap key}

\item{output}{output type, default is JSON.}

\item{address}{The Chinese address}
}
\value{
coordinates of amap(GCJ-02). Or the Chinese address.
}
\description{
Coordinate transformation. Obtain the coordinate. Get the address.
}
\details{
Visit https://lbs.amap.com/api/webservice/summary
for more infomation.
NOTE: These functions only supoort chinese address.
}
\examples{
coord_get("chinese address")
coord_rev("108.952560,34.204798")
coord_trans2gaode("108.952560,34.204798")

}
