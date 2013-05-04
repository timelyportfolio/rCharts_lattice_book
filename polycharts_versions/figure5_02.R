#Figure 5.2
#http://www.amazon.com/Lattice-Multivariate-Data-Visualization-Use/dp/0387759689/ref=cm_cr_pr_product_top


require(rCharts)

#add cut to facet as in example
quakes$cuts <- cut( quakes$depth, 3 )

chart5_2 <- rPlot(
  lat ~ long,
  data = quakes,
  type = 'point',
  size = list( const = 1)
)
chart5_2$facet(
  type = "wrap",
  rows = 1,
  var = list (
    var = "cuts",
    levels = sort( unique( quakes$cuts ) )
  )
)
chart5_2
