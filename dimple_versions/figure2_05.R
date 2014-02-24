#Figure 2.5
#http://www.amazon.com/Lattice-Multivariate-Data-Visualization-Use/dp/0387759689/ref=cm_cr_pr_product_top

#facet not really correct

data(Oats, package = "MEMSS")


chart2_5 <- rPlot(yield ~ nitro,
                  data = Oats,
                  color = "Variety",
                  type = 'point',
                  size = list(const=2))
chart2_5$layer(yield ~ nitro,
               data = Oats,
               color = "Variety",
               type = 'line', copy_layer = T)
chart2_5$facet(
  type = "grid",
  x = "Variety",
  y = "Block"
)
chart2_5$set(horizontalSpacing = 50)
chart2_5$set(verticalSpacing = 50)
chart2_5
