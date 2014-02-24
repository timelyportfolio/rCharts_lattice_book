#Figure 5.9
#http://www.amazon.com/Lattice-Multivariate-Data-Visualization-Use/dp/0387759689/ref=cm_cr_pr_product_top

require(rCharts)

data(Earthquake, package = "MEMSS")

#get log2
Earthquake$accel <- log2( Earthquake$accel )
Earthquake$distance <- log2( Earthquake$distance )

chart5_9 <- rPlot(
  accel ~ distance,
  data = Earthquake,
  type = 'point',
  size = list( const = 2)
)
#get loess for smoothing
smoothing <- data.frame(
  loess.smooth(
    x = Earthquake$distance,
    y = Earthquake$accel
  )
)
#add loess smoothing line as layer
chart5_9$layer(
  x = "x",
  y = "y",
  data = smoothing,
  type = "line"
)
chart5_9$guides(
  x = list(
    title = "Distance From Epicenter (km)"#,
#####fix this once implemented
#    formatter = 'function(x) {return "2^" + x}'
  ),
  y = list(
    title = "Maximum Horizontal Acceleration (g)"#,
#####fix this once implemented    
#    formatter = 'function(y) {return "2^" + y}'
  )
)
chart5_9


