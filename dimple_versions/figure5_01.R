#Figure 5.1
#http://www.amazon.com/Lattice-Multivariate-Data-Visualization-Use/dp/0387759689/ref=cm_cr_pr_product_top


require(rCharts)

#add cut to facet as in example
quakes$cuts <- cut(quakes$depth,2)

chart5_1 <- rPlot(
  lat ~ long,
  data = quakes,
  type = 'point',
  size = list( const = 3)
)
chart5_1$facet(
  type = "wrap",
  cols = 2,
  var = list (
    var = "cuts",
    levels = sort( unique( quakes$cuts ) )
  )
)
chart5_1
