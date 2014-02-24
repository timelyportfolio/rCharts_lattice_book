#Figure 2.1
#http://www.amazon.com/Lattice-Multivariate-Data-Visualization-Use/dp/0387759689/ref=cm_cr_pr_product_top



data(Oats, package = "MEMSS")

## Figure 2.1
chart2_1 <- rPlot(yield ~ nitro | Variety + Block,
                  data = Oats,
                  color = "Variety",
                  type = 'point',
                  size = list(const=2))
chart2_1$layer(yield ~ nitro | Variety + Block,
               data = Oats,
               color = "Variety",
               type = 'line', copy_layer = T)
chart2_1