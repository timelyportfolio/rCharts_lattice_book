#Figure 4.3
#http://www.amazon.com/Lattice-Multivariate-Data-Visualization-Use/dp/0387759689/ref=cm_cr_pr_product_top

require(rCharts)
require(reshape2)

VADeaths.melt <- melt(data.frame(rownames(VADeaths),VADeaths))
colnames( VADeaths.melt ) <- c( "Age", "LocationGender", "Freq")

#remove . in LocationGender
VADeaths.melt$LocationGender <- gsub("[.]", "", VADeaths.melt$LocationGender) 

chart4_3 <- rPlot(
  x = "Freq",
  y = "Age",
  data = VADeaths.melt,
  type = 'point',
  color = "LocationGender"
)
#chart4_3$layer(
#  x = "Freq",
#  y = "Age",
#  data = VADeaths.melt,
#  type = 'line',
#  color = "LocationGender"
#)
chart4_3$guides(
  y = list (title = "")
)
chart4_3$set(title = "Death Rates in Virginia - 1940")
chart4_3
