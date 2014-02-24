#Figure 3.1
#http://www.amazon.com/Lattice-Multivariate-Data-Visualization-Use/dp/0387759689/ref=cm_cr_pr_product_top

require(rCharts)
data(faithful)

#get density data for the plot
density.data <- density(
  faithful$eruptions,
  kernel = "rect",
  bw = 0.2, 
  n = 200   
)

#get in data frame structure from list
density.data <- data.frame(density.data$x, density.data$y)
colnames( density.data ) <- c( "x", "y" )

chart3_1 <- rPlot(y ~ x,
  data = density.data,
  type = 'line'
)
#add random y to jitter for rugplot of points at bottom
faithful$randomy <- runif(n = nrow(faithful), min = 0, max = 0.025)
chart3_1$layer(
  x = "eruptions",
  y = "randomy",
  data = faithful,
  type = "point",
  size = list( const = 2 ),
  copy_layer = TRUE
)
#remove grid
chart3_1$guides(
  x = list( renderGrid = FALSE ),
  y = list( renderGrid = FALSE )
)
chart3_1
