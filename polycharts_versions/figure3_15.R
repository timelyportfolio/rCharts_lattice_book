#Figure 3.15
#http://www.amazon.com/Lattice-Multivariate-Data-Visualization-Use/dp/0387759689/ref=cm_cr_pr_product_top


require(rCharts)

chart3_15 <- rPlot(
  x = "depth",
  y = "mag",
  data = quakes,
  type = 'point',
  size = list( const = 1)
)
chart3_15
