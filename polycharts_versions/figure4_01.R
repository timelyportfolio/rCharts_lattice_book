#Figure 4.1
#http://www.amazon.com/Lattice-Multivariate-Data-Visualization-Use/dp/0387759689/ref=cm_cr_pr_product_top

require(rCharts)
require(reshape2)

VADeaths.melt <- melt(data.frame(rownames(VADeaths),VADeaths))
colnames( VADeaths.melt ) <- c( "Age", "LocationGender", "Freq")

#remove . in LocationGender
VADeaths.melt$LocationGender <- gsub("[.]", "", VADeaths.melt$LocationGender) 

chart4_1 <- rPlot(
  x = "Freq",
  y = "Age",
  data = VADeaths.melt,
  type = 'point',
  size = list( const = 3)
)
chart4_1$facet( 
  type = "wrap",
  rows = 2,
  var = list(
    var = "LocationGender",
    levels = sort(unique( VADeaths.melt$LocationGender ),
                  decreasing = TRUE ) 
    )
)
chart4_1$guides(
  y = list (title = "")
)
chart4_1
