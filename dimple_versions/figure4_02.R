#Figure 4.2
#http://www.amazon.com/Lattice-Multivariate-Data-Visualization-Use/dp/0387759689/ref=cm_cr_pr_product_top

#does not work
#same as 4.1 but has line connecting dot to y axis
#similar to bar

require(rCharts)
require(reshape2)

VADeaths.melt <- melt(data.frame(rownames(VADeaths),VADeaths))
colnames( VADeaths.melt ) <- c( "Age", "LocationGender", "Freq")

#remove . in LocationGender
VADeaths.melt$LocationGender <- gsub("[.]", "", VADeaths.melt$LocationGender) 

chart4_2 <- rPlot(
  x = "Age",
  y = "Freq",
  data = VADeaths.melt,
  type = 'bar'
)
chart4_2$layer(
  x = "Age",
  y = "Freq",
  data = VADeaths.melt,
  type = 'point',
  color = list(const = "gray")
)
chart4_2$facet( 
  type = "wrap",
  cols = 1,
  var = list(
    var = "LocationGender",
    levels = sort(unique( VADeaths.melt$LocationGender ),
                  decreasing = TRUE ) 
    )
)
chart4_2$coord( type = "cartesian", flip = TRUE)
chart4_2$guides(
  y = list (title = "")
)
chart4_2
