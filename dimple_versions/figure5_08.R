#Figure 5.8
#http://www.amazon.com/Lattice-Multivariate-Data-Visualization-Use/dp/0387759689/ref=cm_cr_pr_product_top

require(rCharts)

data(Earthquake, package = "MEMSS")

chart5_8 <- rPlot(
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
chart5_8$layer(
  x = "x",
  y = "y",
  data = smoothing,
  type = "line"
)

chart5_8$guides(
  x = list( title = "Distance From Epicenter (km)" ),
  y = list( title = "Maximum Horizontal Acceleration (g)" )
)
chart5_8


