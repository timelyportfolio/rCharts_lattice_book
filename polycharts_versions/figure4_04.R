#Figure 4.4
#http://www.amazon.com/Lattice-Multivariate-Data-Visualization-Use/dp/0387759689/ref=cm_cr_pr_product_top

require(rCharts)
require(reshape2)

VADeaths.melt <- melt(data.frame(rownames(VADeaths),VADeaths))
colnames( VADeaths.melt ) <- c( "Age", "LocationGender", "Freq")

#remove . in LocationGender
VADeaths.melt$LocationGender <- gsub("[.]", "", VADeaths.melt$LocationGender) 

chart4_4 <- rPlot(
  Freq ~ Age | LocationGender,
  data = VADeaths.melt,
  type = 'bar',
  color = "LocationGender"
)
chart4_4$coord( type = "cartesian", flip = TRUE )
chart4_4$guides(
  x = list( title = "Rate (per 100)" ),
  y = list (title = "")
)
chart4_4$facet( cols = 1 )
chart4_4$set(title = "Death Rates in Virginia - 1940")
chart4_4
