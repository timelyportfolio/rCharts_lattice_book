#Figure 3.16
#http://www.amazon.com/Lattice-Multivariate-Data-Visualization-Use/dp/0387759689/ref=cm_cr_pr_product_top


require(rCharts)

quakes$mag <- quakes$mag + runif(n=nrow(quakes),min = -0.01, max = 0.01)
chart3_16 <- rPlot(
  x = "mag",
  y = "depth",
  data = quakes,
  type = 'point',
  size = list( const = 1)
)
chart3_16
