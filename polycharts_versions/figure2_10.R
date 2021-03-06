#Figure 2.10
#http://www.amazon.com/Lattice-Multivariate-Data-Visualization-Use/dp/0387759689/ref=cm_cr_pr_product_top

#facet not really correct
#same as 2.8 except scales are lattice relation = "free"
#which I do not know how to accomplish with polycharts
#and vertical grid rather than horizontal


require(rCharts)
data = as.data.frame(Titanic)

chart2_10 <- rPlot(Freq ~ Class | Sex + Age,
  data = data,
  color = "Survived",
  type = 'bar'
)
chart2_10$coord( type = "cartesian", flip = "true" )
chart2_10$facet( rows = 1 ) # does not work with facet grid
chart2_10$guides(
  x = list( renderGrid = FALSE ),
  y = list( renderGrid = TRUE )
)
chart2_10
