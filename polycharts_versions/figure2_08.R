#Figure 2.8
#http://www.amazon.com/Lattice-Multivariate-Data-Visualization-Use/dp/0387759689/ref=cm_cr_pr_product_top

#facet not really correct

require(rCharts)
data = as.data.frame(Titanic)

chart2_8 <- rPlot(Freq ~ Class | Sex + Age,
  data = data,
  color = "Survived",
  type = 'bar'
)
chart2_8$coord(type = "cartesian", flip = "true")
chart2_8$facet(rows = 1) # does not work with facet grid
chart2_8
