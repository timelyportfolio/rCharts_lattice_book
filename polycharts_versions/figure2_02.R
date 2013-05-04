#Figure 2.2
#http://www.amazon.com/Lattice-Multivariate-Data-Visualization-Use/dp/0387759689/ref=cm_cr_pr_product_top



data(Oats, package = "MEMSS")


chart2_2 <- rPlot(yield ~ nitro,
                  data = subset(Oats, Block == "I"),
                  color = "Variety",
                  type = 'point',
                  size = list(const=2))
chart2_2$layer(yield ~ nitro,
               data = subset(Oats, Block == "I"),
               color = "Variety",
               type = 'line', copy_layer = T)
chart2_2$facet(
  type = "wrap",
  var = list(var = "Variety", levels = sort(unique(Oats$Variety)))
)
chart2_2
