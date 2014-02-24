#Figure 2.7
#http://www.amazon.com/Lattice-Multivariate-Data-Visualization-Use/dp/0387759689/ref=cm_cr_pr_product_top


data(Oats, package = "MEMSS")


chart2_7 <- rPlot(
  yield ~ nitro | Block,
  data = Oats,
  color = "Variety",
  type = 'point',
  size = list(const = 4)
)
chart2_7$layer(
  yield ~ nitro | Block,
  data = Oats,
  color = "Variety",
  type = 'line', copy_layer = T
)
chart2_7$guides(
  x = list( title = "Yields (bushels/acre)"),
  y = list( title = "Nitrogen concentration (cwt/acre)")
)
chart2_7$facet( rows = 1 )
chart2_7$set( title = "Yield of three varieties of oats" )
chart2_7
