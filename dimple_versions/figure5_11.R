#Figure 5.11
#http://www.amazon.com/Lattice-Multivariate-Data-Visualization-Use/dp/0387759689/ref=cm_cr_pr_product_top

require(rCharts)
require(reshape2)

data(SeatacWeather, package = "latticeExtra")

SeatacWeather.melt <- melt( SeatacWeather, id.var = c( "month", "day", "year" ) )
#remove troublesome . from variable
SeatacWeather.melt$variable <- gsub("[.]", "", SeatacWeather.melt$variable)


chart5_11 <- rPlot(
  value ~ day | month,
  color = "variable", 
  data = SeatacWeather.melt[
    which( SeatacWeather.melt$variable %in% c( "maxtemp", "mintemp", "precip" ) ), 
  ],
  type = 'line'
)
chart5_11


